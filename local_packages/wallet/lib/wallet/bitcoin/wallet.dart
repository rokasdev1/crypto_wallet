import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
import 'package:og_wallet_sdk/models/blockchain_type.dart';
import 'package:og_wallet_sdk/models/crypto_asset.dart';
import 'package:og_wallet_sdk/wallet/base/bip32/bip32.dart' as bip32;
import 'package:og_wallet_sdk/wallet/base/bip39/bip39.dart' as bip39;
import 'package:og_wallet_sdk/wallet/base/wallet.dart';
import 'package:og_wallet_sdk/wallet/bitcoin/common/api_service.dart';
import 'package:og_wallet_sdk/wallet/bitcoin/models/address_type.dart';
import 'package:og_wallet_sdk/wallet/bitcoin/models/segwit_type.dart';

class BtcWallet extends BaseWallet {
  static const defaultSegwitType = SegwitType.segwitNative;

  static const defaultAddressType = BtcAddressType.p2wpkh;

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
    print(key.publicKey());
    return hexToWif(
      key.privateKeyHex(),
      blockchainType,
    );
  }

  String hexToWif(String hexPrivateKey, BlockchainType blockchainType) {
    // Ensure the private key is 32 bytes (64 characters) long
    final network = getNetwork(blockchainType);
    print(hexPrivateKey);
    final List<int> privateKeyBytes = hex.decode(hexPrivateKey.substring(2));

    // Add version byte: 0x80 for mainnet, 0xEF for testnet
    if (hexPrivateKey.length < 64) {
      hexPrivateKey = hexPrivateKey.padLeft(64, '0');
    }
    print(hexPrivateKey.length);
    final wif = WifEncoder.encode(privateKeyBytes, netVer: network.wifNetVer);
    print(wif);

    // Version byte
    // var versionByte = testnet ? 'ef' : '80';

    // // Decode hex
    // var privateKeyBytes =
    //     Uint8List.fromList(hex.decode('$versionByte${hexPrivateKey}01'));

    // // Double SHA-256
    // var sha256First = sha256.convert(privateKeyBytes).bytes;
    // var checksum = sha256.convert(sha256First).bytes.sublist(0, 4);

    // // Append checksum
    // var finalKey = Uint8List.fromList(privateKeyBytes + checksum);

    // // Encode final key in Base58Check
    // var wifKey = Base58CheckCodec.bitcoin().encode(
    //   Base58CheckPayload(
    //     version,
    //     finalKey,
    //   ),
    // );

    return wif;
  }

  @override
  RegExp get addressRegExp => RegExp(
        r'^(1|3|2|m|n)[1-9A-HJ-NP-Za-km-z]{25,34}|(bc1|tb1)[a-z0-9]{1,39}$',
      );

  BitcoinNetwork getNetwork(BlockchainType type) {
    return type == BlockchainType.bitcoinMainNet
        ? BitcoinNetwork.mainnet
        : BitcoinNetwork.testnet;
  }

  // BitcoinRpcService rpcService(BlockchainType type) {
  //   return BitcoinRpcService(
  //     type.rpcUrl,
  //     http.Client(),
  //   );
  // }

  ApiProvider getApi(BlockchainType type) {
    print(type);
    final network = getNetwork(type);
    print(network);
    final service = BitcoinApiService();
    final api = ApiProvider.fromMempool(network, service);
    return api;
  }

  Future<List<UtxoWithAddress>> getUtxo({
    required String privateKey,
    required BlockchainType blockchainType,
  }) async {
    print('getting');
    final publicKey = this.publicKey(privateKey, blockchainType);
    final api = getApi(blockchainType);

    final owner = UtxoAddressDetails(
      publicKey: publicKey.toHex(),
      address: publicKey.toSegwitAddress(),
    );

    final utxo = await api.getAccountUtxo(owner);
    print(utxo);

    return utxo;
  }

  @override
  Future<double?> getAccountBalance({
    required String privateKey,
    required BlockchainType blockchainType,
  }) async {
    final utxo =
        await getUtxo(privateKey: privateKey, blockchainType: blockchainType);
    final sumOfUtxo = utxo.sumOfUtxosValue();

    final satoshi = BigInt.from(100000000);
    return sumOfUtxo / satoshi;
  }

  @override
  Future<double?> getBalance({
    required String privateKey,
    required BlockchainType blockchainType,
    required CryptoAsset cryptoAsset,
  }) {
    return getAccountBalance(
      privateKey: privateKey,
      blockchainType: blockchainType,
    );
  }

  @override
  Future<BigInt> getCurrencyEstimatedFee({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
  }) async {
    final api = getApi(blockchainType);
    final fee = await api.getNetworkFeeRate();

    return fee.high;
  }

  @override
  String getDerivedPath({
    required int index,
    SegwitType? segwitType = defaultSegwitType,
  }) {
    if (segwitType == null) {
      // normal address
      return "m/44'/0'/0'/0/$index";
    }

    switch (segwitType) {
      case SegwitType.segwitNested:
        return "m/84'/0'/0'/0/$index";
      case SegwitType.segwitNested49:
        return "m/49'/0'/0'/0/$index";
      case SegwitType.segwitNative:
        return "m/84'/0'/0'/0/$index";
      case SegwitType.segwitTaproot:
        return "m/86'/0'/0'/0/$index";
    }
  }

  @override
  Future<String> getNewAddress({
    required String privateKey,
    BlockchainType blockchainType = BlockchainType.bitcoinMainNet,
    BtcAddressType addressType = defaultAddressType,
  }) async {
    final network = getNetwork(blockchainType);

    final privateKey0 =
        ECPrivate.fromWif(privateKey, netVersion: network.wifNetVer);
    print(privateKey0);
    final publicKey = privateKey0.getPublic();
    print(publicKey);

    switch (addressType) {
      case BtcAddressType.p2pkh:
        return publicKey.toAddress().toAddress(network);
      case BtcAddressType.p2sh:
        return publicKey.toP2wshInP2sh().toAddress(network);
      case BtcAddressType.p2wpkh:
        return publicKey.toSegwitAddress().toAddress(network);
      case BtcAddressType.p2wsh:
        return publicKey.toP2wshAddress().toAddress(network);
      case BtcAddressType.p2tr:
        return publicKey.toTaprootAddress().toAddress(network);
    }
  }

  @override
  Future<BigInt> getTokenEstimatedFee({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
    required String contractAddress,
    required BigInt amountInLowestUnit,
  }) {
    throw UnimplementedError();
  }

  @override
  bool isAddressValid({required String address}) {
    // TODO: implement isPrivateKeyValid
    throw UnimplementedError();
  }

  @override
  Future<bool> isPrivateKeyValid({required String privateKey}) {
    // TODO: implement isPrivateKeyValid
    throw UnimplementedError();
  }

  @override
  Future<String?> sendTransaction({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
    required String privateKey,
    required BigInt amountInLowestUnit,
    required CryptoAsset cryptoAsset,
    int? maxGas,
    BigInt? gasFeeInLowestUnit,
  }) async {
    if (cryptoAsset is! CryptoCurrency) {
      throw Exception('Not applicable for ${cryptoAsset.runtimeType}');
    }

    final network = getNetwork(blockchainType);

    final utxo =
        await getUtxo(privateKey: privateKey, blockchainType: blockchainType);

    var fee = gasFeeInLowestUnit;
    fee ??= await getCurrencyEstimatedFee(
      blockchainType: blockchainType,
      recipientAddress: recipientAddress,
      senderAddress: senderAddress,
    );

    final output = BitcoinOutput(
      address: getAddressFromString(recipientAddress),
      value: amountInLowestUnit,
    );
    final utxosSum = utxo.sumOfUtxosValue();
    final feeAndValue = amountInLowestUnit + fee;
    print(utxosSum);
    print(feeAndValue);
    print(fee);
    print(amountInLowestUnit);
    final outputs = [output];
    final rest = utxo.sumOfUtxosValue() - amountInLowestUnit - fee;
    if (rest < BigInt.zero) {
      throw Exception('Insufficient funds');
    }
    if (rest > BigInt.zero) {
      outputs.add(
        BitcoinOutput(
          address: getAddressFromString(senderAddress),
          value: rest,
        ),
      );
    }

    final transactionBuilder = BitcoinTransactionBuilder(
      outPuts: outputs,
      fee: fee,
      network: network,
      utxos: utxo,
    );

    print(utxosSum);
    print(feeAndValue);

    final transaction = transactionBuilder
        .buildTransaction((trDigest, utxo, publicKey, sighash) {
      final privateKey0 =
          ECPrivate.fromWif(privateKey, netVersion: network.wifNetVer);

      // if (publicKey != privateKey0.getPublic().toAddress().toAddress(network)) {
      //   throw Exception('Invalid private key');
      // }
      if (utxo.utxo.isP2tr()) {
        // yes is p2tr utxo and now we use SignTaprootTransaction(Schnorr sign)
        // for now this transaction builder support only tweak transaction
        // If you want to spend a Taproot script-path spending, you must create your own transaction builder.
        return privateKey0.signTapRoot(trDigest, sighash: sighash);
      } else {
        // is seqwit(v0) or lagacy address we use  SingInput (ECDSA)
        return privateKey0.signInput(trDigest, sigHash: sighash);
      }
    });

    final digest = transaction.serialize();

    try {
      // final rpcService = this.rpcService(blockchainType);
      final api = getApi(blockchainType);
      final txId = await api.sendRawTransaction(digest);
      // rpcService.dispose();
      return txId;
    } on Exception {
      // Something went wrong when sending the transaction
    }

    return null;
  }

  BitcoinAddress getAddressFromString(String address) {
    if (address.startsWith('bc1')) {
      return P2wpkhAddress.fromAddress(
        address: address,
        network: BitcoinNetwork.mainnet,
      );
    }
    if (address.startsWith('tb1')) {
      return P2wpkhAddress.fromAddress(
        address: address,
        network: BitcoinNetwork.testnet,
      );
    }
    if (address.startsWith('bcrt1')) {
      return P2trAddress.fromAddress(
        address: address,
        network: BitcoinNetwork.mainnet,
      );
    }
    if (address.startsWith('3')) {
      return P2shAddress.fromAddress(
        address: address,
        network: BitcoinNetwork.mainnet,
      );
    }
    if (address.startsWith('2')) {
      return P2shAddress.fromAddress(
        address: address,
        network: BitcoinNetwork.testnet,
      );
    }
    return P2pkhAddress.fromAddress(
      address: address,
      network: BitcoinNetwork.mainnet,
    );
  }

  ECPublic publicKey(String privateKey, BlockchainType blockchainType) {
    final network = getNetwork(blockchainType);
    final privateKey0 =
        ECPrivate.fromWif(privateKey, netVersion: network.wifNetVer);
    return privateKey0.getPublic();
  }

  @override
  Future<String> signTransaction({
    required BlockchainType blockchainType,
    required String privateKey,
    required TxParams txParams,
  }) {
    // TODO: implement signTransaction
    throw UnimplementedError();
  }

  @override
  Future<bool?> isUserOwnerOfNFT({
    required NFT nft,
    required String accountAddress,
  }) {
    // TODO: implement isUserOwnerOfNFT
    throw UnimplementedError();
  }
}
