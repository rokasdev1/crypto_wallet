import 'dart:convert';
import 'dart:math';

import 'package:convert/convert.dart' show hex;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:og_wallet_sdk/models/blockchain_type.dart';
import 'package:og_wallet_sdk/models/crypto_asset.dart';
import 'package:og_wallet_sdk/models/crypto_asset_type.dart';
import 'package:og_wallet_sdk/models/primary_blockchain_type.dart';
import 'package:og_wallet_sdk/wallet/base/bip32/bip32.dart' as bip32;
import 'package:og_wallet_sdk/wallet/base/bip39/bip39.dart' as bip39;
import 'package:og_wallet_sdk/wallet/base/wallet.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/erc20.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/eth_sig_util/eth_sig_util.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/nft_contract_type.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/smart_contracts/erc1155.g.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/smart_contracts/erc721.g.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/smart_contracts/kip1155.g.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/smart_contracts/kip721.g.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/util.dart';
import 'package:og_wallet_sdk/wallet/ethereum/models/ethereum_transaction.dart';
import 'package:pointycastle/digests/keccak.dart';
import 'package:web3dart/json_rpc.dart';
import 'package:web3dart/web3dart.dart';

class EthTxParams extends TxParams {
  final Transaction transaction;

  EthTxParams({required this.transaction});
}

class EthWallet extends BaseWallet {
  @override
  Future<String> getDerivedPrivateKey({
    required String mnemonic,
    required BlockchainType blockchainType,
    required String derivationPath,
  }) async {
    final mnemonicToHex = await compute(bip39.mnemonicToSeedHex, mnemonic);
    final chain = bip32.Chain.seed(mnemonicToHex);
    // First account
    final key = chain.forPath(derivationPath);
    return key.privateKeyHex();
  }

  @override
  RegExp get addressRegExp => RegExp(r'^(0x)?[0-9a-fA-F]{40}$');

  @override
  Future<String> getNewAddress({required String privateKey}) async {
    final ethPrivateKey = EthPrivateKey.fromHex(privateKey);
    return ethPrivateKey.address.hex;
  }

  String ethereumAddressFromPublicKey(Uint8List publicKey) {
    final decompressedPubKey = decompressPublicKey(publicKey);
    final hash = KeccakDigest(256).process(decompressedPubKey.sublist(1));
    final address = hash.sublist(12, 32);

    return checksumEthereumAddress(hex.encode(address));
  }

  String checksumEthereumAddress(String address) {
    if (!isValidFormat(address)) {
      throw ArgumentError.value(address, 'address', 'invalid address');
    }

    final addr = strip0x(address).toLowerCase();
    final hash = ascii.encode(
      hex.encode(
        KeccakDigest(256).process(ascii.encode(addr)),
      ),
    );

    var newAddr = '0x';

    for (var i = 0; i < addr.length; i++) {
      if (hash[i] >= 56) {
        newAddr += addr[i].toUpperCase();
      } else {
        newAddr += addr[i];
      }
    }

    return newAddr;
  }

  @override
  bool isAddressValid({required String address}) {
    if (!isValidFormat(address)) {
      return false;
    }

    final addr = strip0x(address);
    // if all lowercase or all uppercase, as in checksum is not present
    if (RegExp(r'^[0-9a-f]{40}$').hasMatch(addr) ||
        RegExp(r'^[0-9A-F]{40}$').hasMatch(addr)) {
      return true;
    }

    String checksumAddress;
    try {
      checksumAddress = checksumEthereumAddress(address);
    } catch (err) {
      return false;
    }

    return addr == checksumAddress.substring(2);
  }

  @override
  String getDerivedPath({required int index}) {
    return "m/44'/60'/0'/0/$index";
  }

  @override
  Future<String> signTransaction({
    required BlockchainType blockchainType,
    required String privateKey,
    required TxParams txParams,
  }) async {
    if (txParams is! EthTxParams) {
      throw ArgumentError.value(txParams, 'txParams', 'invalid txParams');
    }
    final client = Web3Client(
      blockchainType.rpcUrl,
      http.Client(),
    );
    final Credentials credentials = EthPrivateKey.fromHex(
      privateKey.startsWith('0x') ? privateKey : '0x$privateKey',
    );
    final resp =
        await client.signTransaction(credentials, txParams.transaction);

    await client.dispose();
    return base64Encode(resp);
  }

  @override
  Future<double> getAccountBalance({
    required String privateKey,
    required BlockchainType blockchainType,
  }) async {
    final web3Client = Web3Client(blockchainType.rpcUrl, http.Client());
    final ethAddress = EthPrivateKey.fromHex(privateKey).address;
    final ethBalance = await web3Client.getBalance(ethAddress);
    final balance = ethBalance.getValueInUnit(EtherUnit.ether);
    return balance;
  }

  @override
  Future<double?> getBalance({
    required String privateKey,
    required BlockchainType blockchainType,
    required CryptoAsset cryptoAsset,
  }) async {
    final web3Client = Web3Client(blockchainType.rpcUrl, http.Client());

    double balance = 0;
    if (blockchainType != cryptoAsset.blockchainType) {
      return null;
    }

    final walletEthAddress = EthPrivateKey.fromHex(privateKey).address;

    switch (cryptoAsset.type) {
      case CryptoAssetType.cryptoCurrency:
        if (cryptoAsset is! CryptoCurrency) {
          return null;
        }
        balance = await getAccountBalance(
          blockchainType: blockchainType,
          privateKey: privateKey,
        );
        break;
      case CryptoAssetType.fungibleToken:
        if (cryptoAsset is! CryptoToken) {
          return null;
        }
        final contractAddress = cryptoAsset.contractAddress;
        final erc20Token = ERC20(
          address: EthereumAddress.fromHex(contractAddress),
          client: web3Client,
        );

        try {
          final ethBalance = await erc20Token.balanceOf(walletEthAddress);
          balance = ethBalance.toDouble() / pow(10, cryptoAsset.decimals);
        } catch (e) {
          balance = 0;
        }
        break;
      case CryptoAssetType.nonFungibleToken:
        if (cryptoAsset is! NFT) {
          return null;
        }

        if (cryptoAsset.blockchainType.blockchainParentType !=
            PrimaryBlockchainType.ethereum) {
          return null;
        }

        final contractAddress = cryptoAsset.contractAddress;
        final contractType = await cryptoAsset.evmNFTContractType;
        if (contractType == null) {
          return null;
        }
        switch (contractType) {
          case EVMNFTContractType.erc721:
            final erc721Token = Erc721(
              address: EthereumAddress.fromHex(contractAddress),
              client: web3Client,
            );
            try {
              final ethBalance = await erc721Token.balanceOf(walletEthAddress);
              balance = EtherAmount.fromBigInt(EtherUnit.ether, ethBalance)
                  .getValueInUnit(EtherUnit.ether);
            } catch (e) {
              balance = 0;
            }
            break;
          case EVMNFTContractType.erc1155:
            final erc1155Token = Erc1155(
              address: EthereumAddress.fromHex(contractAddress),
              client: web3Client,
            );
            try {
              final ethBalance = await erc1155Token.balanceOf(
                walletEthAddress,
                BigInt.parse(cryptoAsset.tokenId ?? ''),
              );
              balance = EtherAmount.fromBigInt(EtherUnit.ether, ethBalance)
                  .getValueInUnit(EtherUnit.ether);
            } catch (e) {
              balance = 0;
            }
            break;
          case EVMNFTContractType.kip721:
            final kip721Token = Kip721(
              address: EthereumAddress.fromHex(contractAddress),
              client: web3Client,
            );
            try {
              final ethBalance = await kip721Token.balanceOf(walletEthAddress);
              balance = EtherAmount.fromBigInt(EtherUnit.ether, ethBalance)
                  .getValueInUnit(EtherUnit.ether);
            } catch (e) {
              balance = 0;
            }
            break;
          case EVMNFTContractType.kip1155:
            final kip1155Token = Kip1155(
              address: EthereumAddress.fromHex(contractAddress),
              client: web3Client,
            );
            try {
              final ethBalance = await kip1155Token.balanceOf(
                walletEthAddress,
                BigInt.parse(cryptoAsset.tokenId ?? ''),
              );
              balance = EtherAmount.fromBigInt(EtherUnit.ether, ethBalance)
                  .getValueInUnit(EtherUnit.ether);
            } catch (e) {
              balance = 0;
            }
            break;
        }
        break;
    }

    await web3Client.dispose();
    return balance;
  }

  @override
  Future<BigInt> getCurrencyEstimatedFee({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
  }) async {
    final web3Client = Web3Client(blockchainType.rpcUrl, http.Client());

    final recipient = recipientAddress.isEmpty
        ? null
        : EthereumAddress.fromHex(recipientAddress);

    final gasPrice = await web3Client.getGasPrice();
    var estimateGas = BigInt.from(0);

    estimateGas = await web3Client.estimateGas(
      sender: EthereumAddress.fromHex(senderAddress),
      to: recipient,
      gasPrice: gasPrice,
    );

    web3Client.dispose();
    // dev.log(estimateGas.toString());
    // dev.log(gasPrice.getInWei.toString());
    return (estimateGas * gasPrice.getInWei);
  }

  @override
  Future<BigInt> getTokenEstimatedFee({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
    required String contractAddress,
    required BigInt amountInLowestUnit,
  }) async {
    final web3Client = Web3Client(blockchainType.rpcUrl, http.Client());

    final recipient = recipientAddress.isEmpty
        ? null
        : EthereumAddress.fromHex(recipientAddress);

    final gasPrice = await web3Client.getGasPrice();

    var estimateGas = BigInt.from(0);
    final contract = ERC20(
      address: EthereumAddress.fromHex(contractAddress),
      client: web3Client,
    );

    estimateGas = await web3Client.estimateGas(
      sender: EthereumAddress.fromHex(senderAddress),
      to: recipient,
      data: contract.self.function('transfer').encodeCall([
        recipient,
        amountInLowestUnit,
      ]),
      amountOfGas: BigInt.from(200000),
      // gasPrice: gasPrice,
    );
    print('estimateGas $estimateGas');

    web3Client.dispose();
    return (estimateGas * gasPrice.getInWei);
  }

  @override
  Future<bool> isPrivateKeyValid({required String privateKey}) async {
    try {
      EthPrivateKey.fromHex(privateKey);
      return true;
    } catch (_) {}
    return false;
  }

  @override
  Future<String> sendTransaction({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
    required String privateKey,
    required BigInt amountInLowestUnit,
    required CryptoAsset cryptoAsset,
    int? maxGas,
    BigInt? gasFeeInLowestUnit,
  }) async {
    switch (cryptoAsset) {
      case CryptoCurrency():
        return await _sendCurrencyTransaction(
              blockchainType: blockchainType,
              recipientAddress: recipientAddress,
              senderAddress: senderAddress,
              privateKey: privateKey,
              maxGas: maxGas,
              gasFeeInLowestUnit: gasFeeInLowestUnit,
              amountInLowestUnit: amountInLowestUnit,
              cryptoCurrency: cryptoAsset,
            ) ??
            '';
      case CryptoToken():
        return await _sendTokenTransaction(
              blockchainType: blockchainType,
              recipientAddress: recipientAddress,
              senderAddress: senderAddress,
              privateKey: privateKey,
              maxGas: maxGas,
              gasFeeInLowestUnit: gasFeeInLowestUnit,
              amountInLowestUnit: amountInLowestUnit,
              cryptoToken: cryptoAsset,
            ) ??
            '';
      case _:
        throw UnimplementedError('NFT not implemented');
    }
  }

  Future<String?> _sendCurrencyTransaction({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
    required String privateKey,
    required BigInt amountInLowestUnit,
    required CryptoCurrency cryptoCurrency,
    int? maxGas,
    BigInt? gasFeeInLowestUnit,
  }) async {
    final web3Client = Web3Client(blockchainType.rpcUrl, http.Client());

    final recipient = EthereumAddress.fromHex(recipientAddress);
    final value = EtherAmount.fromBigInt(EtherUnit.wei, amountInLowestUnit);
    final maxGas = await web3Client.estimateGas(
      sender: EthereumAddress.fromHex(senderAddress),
      to: recipient,
      value: value,
    );
    final gasPrice = await web3Client.getGasPrice();
    final transaction = Transaction(
      from: EthereumAddress.fromHex(senderAddress),
      to: recipient,
      value: value,
      gasPrice: EtherAmount.inWei(
        (gasPrice.getInWei * BigInt.from(3)) ~/ BigInt.from(2),
      ),
      maxGas: (maxGas.toInt() * 1.25).toInt(),
    );
    final transactionId = await _sendTransaction(
      web3Client,
      EthPrivateKey.fromHex(privateKey),
      transaction,
      onError: (val) => print('ERROR: $val'),
    );

    if (transactionId == null) {
      return null;
    }

    web3Client.dispose();
    return transactionId;
  }

  Future<String?> _sendTokenTransaction({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
    required String privateKey,
    required BigInt amountInLowestUnit,
    required CryptoToken cryptoToken,
    int? maxGas,
    BigInt? gasFeeInLowestUnit,
  }) async {
    final web3Client = Web3Client(blockchainType.rpcUrl, http.Client());

    final erc20Token = ERC20(
      address: EthereumAddress.fromHex(cryptoToken.contractAddress),
      client: web3Client,
    );
    final sender = EthereumAddress.fromHex(senderAddress);
    final recipient = EthereumAddress.fromHex(recipientAddress);
    String? transactionId;

    try {
      final gasPrice = await web3Client.getGasPrice();

      final maxGas = await web3Client.estimateGas(
        sender: sender,
        to: erc20Token.self.address,
        // value: value,
        gasPrice: gasPrice,
        data: erc20Token.self.function('transfer').encodeCall([
          recipient,
          amountInLowestUnit,
        ]),
      );
      transactionId = await web3Client.sendTransaction(
        EthPrivateKey.fromHex(privateKey),
        Transaction.callContract(
          from: sender,
          contract: erc20Token.self,
          // gasPrice: gasPrice,
          function: erc20Token.self.function('transfer'),
          gasPrice: EtherAmount.inWei(
            (gasPrice.getInWei * BigInt.from(3)) ~/ BigInt.from(2),
          ),
          maxGas: (maxGas.toInt() * 1.25).toInt(),
          parameters: [
            recipient,
            amountInLowestUnit,
          ],
        ),
        chainId: blockchainType.chainId,
      );
    } catch (e) {
      transactionId = null;
    }

    if (transactionId == null) {
      return null;
    }

    web3Client.dispose();

    return transactionId;
  }

  Future<String?> _sendTransaction(
    Web3Client web3Client,
    Credentials credentials,
    Transaction transaction, {
    required void Function(String) onError,
  }) async {
    try {
      final chainId = await web3Client.getChainId();
      final transactionId = await web3Client.sendTransaction(
        credentials,
        transaction,
        chainId: chainId.toInt(),
      );

      return transactionId;
    } on RPCError catch (e) {
      if (e.message.contains('max fee per gas less than block base fee')) {
        onError('Gas fee too low. Please increase');
        return null;
      }

      if (e.message.contains('intrinsic gas too low')) {
        onError('Intrinsic Gas too low. Please increase');
        return null;
      }

      if (e.message.contains('replacement transaction underpriced')) {
        onError('Gas too low. Please increase (error code 2)');
        return null;
      }

      if (e.message.contains('nonce too low')) {
        onError(
          'Nonce too low. Current Nonce: ${transaction.nonce}. It might be that your previous transaction is already processed',
        );
        return null;
      }

      if (e.message.contains('transaction underpriced')) {
        onError('Gas price too low, please increase');
        return null;
      }

      if (e.errorCode == -32000) {
        onError('Not enough funds, cannot send transaction');
        return null;
      }
      return null;
    } catch (e, s) {
      onError('Unknown error, Error: $e, Stack: $s');
      return null;
    }
  }

  Future<String?> sendTransactionWithObject({
    required BlockchainType blockchainType,
    required String privateKey,
    required Transaction transaction,
  }) async {
    final client = Web3Client(
      blockchainType.rpcUrl,
      http.Client(),
    );
    final credentials = EthPrivateKey.fromHex(privateKey);

    final resp = await _sendTransaction(
      client,
      credentials,
      transaction,
      onError: (val) => print('ERROR: $val'),
    );

    await client.dispose();

    return resp;
  }

  String signTypedData({
    required String privateKey,
    required String data,
  }) {
    return EthSigUtil.signTypedData(
      privateKey: privateKey,
      jsonData: data,
      version: TypedDataVersion.V4,
    );
  }

  Transaction transactionFromJson(Map<String, dynamic> json) {
    final ethTransaction = EthereumTransaction.fromJson(json);

    return Transaction(
      from: EthereumAddress.fromHex(ethTransaction.from),
      to: EthereumAddress.fromHex(ethTransaction.to),
      value: ethTransaction.value != null
          ? EtherAmount.fromBigInt(
              EtherUnit.wei,
              BigInt.tryParse(ethTransaction.value ?? '') ?? BigInt.zero,
            )
          : null,
      gasPrice: ethTransaction.gasPrice != null
          ? EtherAmount.fromBigInt(
              EtherUnit.wei,
              BigInt.tryParse(ethTransaction.gasPrice!) ?? BigInt.zero,
            )
          : null,
      maxFeePerGas: ethTransaction.maxFeePerGas != null
          ? EtherAmount.fromBigInt(
              EtherUnit.wei,
              BigInt.tryParse(ethTransaction.maxFeePerGas!) ?? BigInt.zero,
            )
          : null,
      maxPriorityFeePerGas: ethTransaction.maxPriorityFeePerGas != null
          ? EtherAmount.fromBigInt(
              EtherUnit.wei,
              BigInt.tryParse(ethTransaction.maxPriorityFeePerGas!) ??
                  BigInt.zero,
            )
          : null,
      maxGas: int.tryParse(ethTransaction.gasLimit ?? ''),
      nonce: int.tryParse(ethTransaction.nonce ?? ''),
      data: (ethTransaction.data != null)
          ? Uint8List.fromList(
              hex.decode(
                ethTransaction.data!
                    .substring(ethTransaction.data!.startsWith('0x') ? 2 : 0),
              ),
            )
          : null,
    );
  }

  @override
  Future<bool?> isUserOwnerOfNFT({
    required NFT nft,
    required String accountAddress,
  }) async {
    final bool? isOwner;
    final contractType = await nft.evmNFTContractType;
    if (contractType == null) {
      return null;
    }
    final address = EthereumAddress.fromHex(nft.contractAddress);
    final client = Web3Client(
      nft.blockchainType.rpcUrl,
      http.Client(),
    );
    final tokenId = nft.tokenId;
    if (tokenId == null) {
      return null;
    }
    switch (contractType) {
      case EVMNFTContractType.erc721:
        final token = Erc721(address: address, client: client);

        final tokenOwner = await token.ownerOf(BigInt.parse(tokenId));
        isOwner = accountAddress == tokenOwner.hex;

        break;
      case EVMNFTContractType.erc1155:
        final token = Erc1155(address: address, client: client);

        final balance = await token.balanceOf(
          EthereumAddress.fromHex(accountAddress),
          BigInt.parse(tokenId),
        );
        isOwner = balance.toDouble() > 0;

        break;
      case EVMNFTContractType.kip721:
        final token = Kip721(address: address, client: client);

        final tokenOwner = await token.ownerOf(BigInt.parse(tokenId));
        isOwner = accountAddress == tokenOwner.hex;

        break;
      case EVMNFTContractType.kip1155:
        final token = Kip1155(address: address, client: client);

        final balance = await token.balanceOf(
          EthereumAddress.fromHex(accountAddress),
          BigInt.parse(tokenId),
        );
        isOwner = balance.toDouble() > 0;

        break;
    }

    return isOwner;
  }

  Transaction formTransaction(List<dynamic> parsedResponse) {
    final ethTransaction = EthereumTransaction.fromJson(
      parsedResponse[0] as Map<String, dynamic>,
    );

    print('ethTransaction $ethTransaction $parsedResponse');

    final transaction = Transaction(
      from: EthereumAddress.fromHex(ethTransaction.from),
      to: EthereumAddress.fromHex(ethTransaction.to),
      value: ethTransaction.value != null
          ? EtherAmount.fromBigInt(
              EtherUnit.wei,
              BigInt.tryParse(ethTransaction.value ?? '') ?? BigInt.zero,
            )
          : null,
      gasPrice: ethTransaction.gasPrice != null
          ? EtherAmount.fromBigInt(
              EtherUnit.wei,
              BigInt.tryParse(ethTransaction.gasPrice!) ?? BigInt.zero,
            )
          : null,
      maxFeePerGas: ethTransaction.maxFeePerGas != null
          ? EtherAmount.fromBigInt(
              EtherUnit.wei,
              BigInt.tryParse(ethTransaction.maxFeePerGas!) ?? BigInt.zero,
            )
          : null,
      maxPriorityFeePerGas: ethTransaction.maxPriorityFeePerGas != null
          ? EtherAmount.fromBigInt(
              EtherUnit.wei,
              BigInt.tryParse(
                    ethTransaction.maxPriorityFeePerGas!,
                    radix: 16,
                  ) ??
                  BigInt.zero,
            )
          : null,
      maxGas: int.tryParse(ethTransaction.gas ?? ''),
      nonce: int.tryParse(ethTransaction.nonce ?? ''),
      data: (ethTransaction.data != null)
          ? Uint8List.fromList(
              hex.decode(
                ethTransaction.data!
                    .substring(ethTransaction.data!.startsWith('0x') ? 2 : 0),
              ),
            )
          : null,
    );

    return transaction;
  }

  Future<BigInt> estimateNetworkFee(
    Transaction ethTransaction,
    BlockchainType blockchainType,
  ) async {
    BigInt effectiveGasPrice = BigInt.zero;
    int gasLimit = ethTransaction.maxGas ?? 0;

    if (ethTransaction.maxFeePerGas != null &&
        ethTransaction.maxPriorityFeePerGas != null) {
      // EIP-1559 transaction
      BigInt maxFeePerGas = ethTransaction.maxFeePerGas!.getInWei;
      BigInt maxPriorityFeePerGas =
          ethTransaction.maxPriorityFeePerGas!.getInWei;
      effectiveGasPrice = (maxFeePerGas < maxPriorityFeePerGas)
          ? maxFeePerGas
          : maxPriorityFeePerGas;
      print('Legacy transaction $maxFeePerGas  $maxPriorityFeePerGas');
    } else if (ethTransaction.gasPrice != null) {
      // Legacy transaction
      effectiveGasPrice = ethTransaction.gasPrice!.getInWei;
      print('Legacy transaction ${ethTransaction.gasPrice!.getInWei}');
    } else {
      final client = Web3Client(
        blockchainType.rpcUrl,
        http.Client(),
      );
      final price = await client.getGasPrice();
      effectiveGasPrice = price.getInWei;
      await client.dispose();
      print('Else $price $gasLimit');
    }

    BigInt totalFee = effectiveGasPrice * BigInt.from(gasLimit);
    print('totalFee $totalFee');
    return totalFee;
  }
}
