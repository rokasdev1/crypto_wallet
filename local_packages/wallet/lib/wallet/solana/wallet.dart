import 'dart:convert';

import 'package:blockchain_utils/hex/hex.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:og_wallet_sdk/models/blockchain_type.dart';
import 'package:og_wallet_sdk/models/crypto_asset.dart';
import 'package:og_wallet_sdk/wallet/base/bip39/bip39.dart' as bip39;
import 'package:og_wallet_sdk/wallet/base/wallet.dart';
import 'package:solana/base58.dart';
import 'package:solana/dto.dart';
import 'package:solana/encoder.dart' as encoder;
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';

import 'common/ed25519_hd_key/ed25519_hd_key.dart';

class SolTxParams extends TxParams {
  final CompiledMessage message;

  SolTxParams({
    required this.message,
  });
}

class SolWallet extends BaseWallet {
  static const kTokenProgramId = 'TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA';
  static const kSolMint = 'So11111111111111111111111111111111111111112';
  static const kSolProgramId = '11111111111111111111111111111111';

  final Map<String, Ed25519HDKeyPair> _keyPairs = {};

  @override
  Future<String> getDerivedPrivateKey({
    required String mnemonic,
    required BlockchainType blockchainType,
    required String derivationPath,
  }) async {
    final seedMnemonic = await compute(bip39.mnemonicToSeed, mnemonic);
    final keyData =
        await ED25519_HD_KEY.derivePath(derivationPath, seedMnemonic);
    final privateKey = hex.encode(keyData.key);
    return privateKey;
  }

  @override
  RegExp get addressRegExp => RegExp(r'^[1-9A-HJ-NP-Za-km-z]{32,44}$');

  @override
  String getDerivedPath({required int index}) {
    return "m/44'/501'/$index'";
  }

  @override
  Future<String> getNewAddress({required String privateKey}) async {
    final keyPair = await _getKeyPair(
      privateKey,
    );
    return keyPair.address;
  }

  Future<Ed25519HDKeyPair> _getKeyPair(String privateKey) async {
    if (_keyPairs.containsKey(privateKey)) {
      print('Key pair already exists');
      return _keyPairs[privateKey]!;
    }
    final keyPair = await Ed25519HDKeyPair.fromPrivateKeyBytes(
      privateKey: hex.decode(privateKey),
    );
    _keyPairs[privateKey] = keyPair;
    return keyPair;
  }

  SolanaClient _getSolanaClient(BlockchainType blockchainType) {
    return SolanaClient(
      rpcUrl: Uri.parse(blockchainType.rpcUrl),
      websocketUrl: Uri.parse(blockchainType.webSocketUrl!),
      timeout: const Duration(seconds: 60),
    );
  }

  @override
  Future<String> signTransaction({
    required BlockchainType blockchainType,
    required String privateKey,
    required TxParams txParams,
    required,
  }) async {
    if (txParams is! SolTxParams) {
      throw ArgumentError.value(
        txParams,
        'txParams',
        'txParams must be of type SolTxParams',
      );
    }
    final keyPair = await _getKeyPair(privateKey);
    final signedTx = await keyPair.sign(txParams.message.toByteArray());

    return signedTx.toBase58();
  }

  @override
  bool isAddressValid({required String address}) {
    return isValidAddress(address);
  }

  @override
  Future<double?> getAccountBalance({
    required String privateKey,
    required BlockchainType blockchainType,
  }) async {
    final solanaClient = _getSolanaClient(
      blockchainType,
    );

    final keyPair = await _getKeyPair(
      privateKey,
    );

    final address = keyPair.address;

    final double? balance;
    final cryptoBalance = await solanaClient.rpcClient.getBalance(address);
    balance = cryptoBalance.value / lamportsPerSol;

    return balance;
  }

  @override
  Future<double?> getBalance({
    required String privateKey,
    required BlockchainType blockchainType,
    required CryptoAsset cryptoAsset,
  }) async {
    final keyPair = await _getKeyPair(
      privateKey,
    );

    final address = keyPair.address;
    if (cryptoAsset is CryptoCurrency) {
      return getAccountBalance(
        privateKey: privateKey,
        blockchainType: blockchainType,
      );
    }
    if (cryptoAsset is! CryptoToken) {
      return null;
    }

    final double? balance;

    final splTokenAccountDataInfo = await _getSplTokenAccountDataInfo(
      address: address,
      mintId: cryptoAsset.contractAddress,
      blockchainType: blockchainType,
    );
    balance = double.tryParse(
      splTokenAccountDataInfo?.tokenAmount.uiAmountString ?? 'null',
    );

    return balance ?? 0;
  }

  @override
  @override
  Future<BigInt> getTokenEstimatedFee({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
    required String contractAddress,
    required BigInt amountInLowestUnit,
  }) async {
    final solanaClient = _getSolanaClient(
      blockchainType,
    );

    final sender = Ed25519HDPublicKey.fromBase58(senderAddress);
    final receiver = Ed25519HDPublicKey.fromBase58(recipientAddress);
    final splToken = Ed25519HDPublicKey.fromBase58(contractAddress);

    final futures = await Future.wait([
      findAssociatedTokenAddress(owner: receiver, mint: splToken),
      solanaClient.hasAssociatedTokenAccount(owner: receiver, mint: splToken),
      solanaClient.getAssociatedTokenAccount(owner: sender, mint: splToken),
    ]);

    final associatedAddress = futures[0] as Ed25519HDPublicKey;
    final hasAssociatedAccount = futures[1] as bool;
    final associatedSender = futures[2] as ProgramAccount?;

    if (associatedSender == null) {
      return BigInt.from(0);
    }

    final message = Message(
      instructions: [
        if (!hasAssociatedAccount)
          AssociatedTokenAccountInstruction.createAccount(
            mint: splToken,
            address: associatedAddress,
            owner: receiver,
            funder: sender,
          ),
        // if (transactionFeeInSmallestUnit > 0) additionalFeeInstruction(),
        encoder.Instruction(
          accounts: [
            encoder.AccountMeta.writeable(
              pubKey: Ed25519HDPublicKey.fromBase58(associatedSender.pubkey),
              isSigner: false,
            ),
            encoder.AccountMeta.writeable(
              pubKey: associatedAddress,
              isSigner: false,
            ),
            encoder.AccountMeta.readonly(pubKey: sender, isSigner: true),
          ],
          data: encoder.ByteArray.merge([
            TokenProgram.transferInstructionIndex,
            encoder.ByteArray.u64(amountInLowestUnit.toInt()),
          ]),
          programId: TokenProgram.id,
        ),
      ],
    );
    return _getFeeForMessage(
      solanaClient: solanaClient,
      message: message,
      senderAddress: senderAddress,
    );
  }

  @override
  Future<bool> isPrivateKeyValid({required String privateKey}) async {
    try {
      final key = base58decode(privateKey);
      await Ed25519HDKeyPair.fromPrivateKeyBytes(
        privateKey: key.take(32).toList(),
      );

      return true;
    } catch (_) {}
    return false;
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
    if (cryptoAsset is CryptoCurrency) {
      return _sendCurrencyTransaction(
        blockchainType: blockchainType,
        recipientAddress: recipientAddress,
        senderAddress: senderAddress,
        privateKey: privateKey,
        amountInLowestUnit: amountInLowestUnit,
      );
    }
    if (cryptoAsset is CryptoToken) {
      return _sendSplTransaction(
        blockchainType: blockchainType,
        senderAddress: senderAddress,
        recipientAddress: recipientAddress,
        amountInSmallestUnit: amountInLowestUnit,
        mintId: cryptoAsset.contractAddress,
        privateKey: privateKey,
        transactionFeeInSmallestUnit: gasFeeInLowestUnit,
      );
    }
    return null;
  }

  Future<String?> _sendCurrencyTransaction({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
    required String privateKey,
    required BigInt amountInLowestUnit,
  }) async {
    final solanaClient = _getSolanaClient(
      blockchainType,
    );

    final senderKey = Ed25519HDPublicKey.fromBase58(senderAddress);
    final receiverKey = Ed25519HDPublicKey.fromBase58(recipientAddress);
    final message = Message(
      instructions: [
        SystemInstruction.transfer(
          fundingAccount: senderKey,
          recipientAccount: receiverKey,
          lamports: amountInLowestUnit.toInt(),
        ),
        // encoder.Instruction(
        //   accounts: [
        //     encoder.AccountMeta.writeable(pubKey: senderKey, isSigner: true),
        //     encoder.AccountMeta.writeable(pubKey: receiverKey, isSigner: false),
        //   ],
        //   data: encoder.ByteArray.merge([
        //     SystemProgram.transferInstructionIndex,
        //     encoder.ByteArray.u64(amountInLamport),
        //   ]),
        //   programId: SystemProgram.id,
        // ),
      ],
    );

    // Thread heavy logic

    final keyPair = await _getKeyPair(privateKey);

    try {
      return solanaClient.rpcClient.signAndSendTransaction(message, [keyPair]);
    } catch (_) {
      return null;
    }
  }

  Future<String?> _sendSplTransaction({
    required BlockchainType blockchainType,
    required String senderAddress,
    required String recipientAddress,
    required BigInt amountInSmallestUnit,
    required String mintId,
    required String privateKey,
    required BigInt? transactionFeeInSmallestUnit,
  }) async {
    final solanaClient = _getSolanaClient(
      blockchainType,
    );

    final sender = Ed25519HDPublicKey.fromBase58(senderAddress);
    final receiver = Ed25519HDPublicKey.fromBase58(recipientAddress);
    final splToken = Ed25519HDPublicKey.fromBase58(mintId);

    final futures = await Future.wait([
      findAssociatedTokenAddress(owner: receiver, mint: splToken),
      solanaClient.hasAssociatedTokenAccount(owner: receiver, mint: splToken),
      solanaClient.getAssociatedTokenAccount(owner: sender, mint: splToken),
    ]);

    final associatedAddress = futures[0] as Ed25519HDPublicKey;
    final hasAssociatedAccount = futures[1] as bool;
    final associatedSender = futures[2] as ProgramAccount?;

    if (associatedSender == null) {
      return null;
    }

    final message = Message(
      instructions: [
        if (!hasAssociatedAccount)
          AssociatedTokenAccountInstruction.createAccount(
            mint: splToken,
            address: associatedAddress,
            owner: receiver,
            funder: sender,
          ),
        // if (transactionFeeInSmallestUnit > 0) additionalFeeInstruction(),
        encoder.Instruction(
          accounts: [
            encoder.AccountMeta.writeable(
              pubKey: Ed25519HDPublicKey.fromBase58(associatedSender.pubkey),
              isSigner: false,
            ),
            encoder.AccountMeta.writeable(
              pubKey: associatedAddress,
              isSigner: false,
            ),
            encoder.AccountMeta.readonly(pubKey: sender, isSigner: true),
          ],
          data: encoder.ByteArray.merge([
            TokenProgram.transferInstructionIndex,
            encoder.ByteArray.u64(amountInSmallestUnit.toInt()),
          ]),
          programId: TokenProgram.id,
        ),
      ],
    );

    final keyPair = await _getKeyPair(privateKey);

    try {
      return solanaClient.rpcClient.signAndSendTransaction(message, [keyPair]);
    } catch (_) {
      return null;
    }
  }

  Future<SplTokenAccountDataInfo?> _getSplTokenAccountDataInfo({
    required String address,
    required String mintId,
    required BlockchainType blockchainType,
  }) async {
    final solanaClient = _getSolanaClient(
      blockchainType,
    );

    List<ProgramAccount> tokenAccountsByOwner = [];
    tokenAccountsByOwner = await solanaClient.rpcClient
        .getTokenAccountsByOwner(
          address,
          TokenAccountsFilter.byMint(mintId),
          encoding: Encoding.jsonParsed,
        )
        .value;

    if (tokenAccountsByOwner.isEmpty) return null;

    final firstTokenAccountByOwner = tokenAccountsByOwner.first.account.data;
    if (firstTokenAccountByOwner is! ParsedAccountData) {
      return null;
    }

    final splTokenAccountDataInfo =
        firstTokenAccountByOwner.maybeWhen<SplTokenAccountDataInfo?>(
      orElse: () => null,
      splToken: (splToken) {
        return splToken.maybeWhen(
          orElse: () => null,
          account: (splTokenAccountDataInfo, _, __) => splTokenAccountDataInfo,
        );
      },
    );

    return splTokenAccountDataInfo;
  }

  @override
  Future<BigInt> getCurrencyEstimatedFee({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
  }) async {
    final solanaClient = _getSolanaClient(
      blockchainType,
    );

    final message = Message(
      instructions: [
        SystemInstruction.transfer(
          fundingAccount: Ed25519HDPublicKey.fromBase58(senderAddress),
          recipientAccount: Ed25519HDPublicKey.fromBase58(recipientAddress),
          lamports: 1,
        ),
      ],
    );

    return _getFeeForMessage(
      solanaClient: solanaClient,
      message: message,
      senderAddress: senderAddress,
    );
  }

  Future<BigInt> _getFeeForCompiledMessage({
    required CompiledMessage message,
    required BlockchainType blockchainType,
  }) async {
    final solanaClient = _getSolanaClient(
      blockchainType,
    );
    final fee = await solanaClient.rpcClient.getFeeForMessage(
      base64Encode(message.toByteArray().toList()),
      commitment: Commitment.confirmed,
    );
    return BigInt.from(fee ?? 0);
  }

  Future<BigInt> _getFeeForMessage({
    required SolanaClient solanaClient,
    required Message message,
    required String senderAddress,
  }) async {
    final blockhash = await solanaClient.rpcClient
        .getLatestBlockhash(commitment: Commitment.confirmed)
        .value
        .then((value) => value.blockhash);

    final compiledMessage = message.compile(
      recentBlockhash: blockhash,
      feePayer: Ed25519HDPublicKey.fromBase58(senderAddress),
    );
    //encode message
    final fee = await solanaClient.rpcClient.getFeeForMessage(
      base64Encode(compiledMessage.toByteArray().toList()),
      commitment: Commitment.confirmed,
    );
    return BigInt.from(fee ?? 0);
  }

  Future<String> publicKey(String privateKey) async {
    final keyPair = await Ed25519HDKeyPair.fromPrivateKeyBytes(
      privateKey: base58decode(privateKey).take(32).toList(),
    );
    return keyPair.address;
  }

  Future<List<ProgramAccount>> getTokenAccounts({
    required BlockchainType blockchainType,
    required String address,
  }) async {
    final solanaClient = _getSolanaClient(
      blockchainType,
    );

    List<ProgramAccount> tokenAccounts = [];
    tokenAccounts = await solanaClient.rpcClient
        .getTokenAccountsByOwner(
          address,
          const TokenAccountsFilterByProgramId(kTokenProgramId),
          encoding: Encoding.jsonParsed,
        )
        .value;

    return tokenAccounts;
  }

  Future<TokenAccountData?> getTokenAccountDataFromSplAccountAddress({
    required String splAccountAddress,
    required BlockchainType blockchainType,
  }) async {
    final solanaClient = _getSolanaClient(
      blockchainType,
    );

    Account? splAccount;
    try {
      splAccount = await solanaClient.rpcClient
          .getAccountInfo(splAccountAddress, encoding: Encoding.jsonParsed)
          .value;
    } catch (e) {
      return null;
    }

    if (splAccount == null) {
      return null;
    }

    final data = splAccount.data;
    if (data is! ParsedSplTokenProgramAccountData) {
      return null;
    }

    return data.parsed
        .maybeMap(orElse: () => null, account: (tokenAccount) => tokenAccount);
  }

  @override
  Future<bool?> isUserOwnerOfNFT({
    required NFT nft,
    required String accountAddress,
  }) async {
    final client = _getSolanaClient(nft.blockchainType);

    final largestAccounts =
        await client.rpcClient.getTokenLargestAccounts(nft.contractAddress);
    final largestAccount = largestAccounts.value.firstOrNull;

    if (largestAccount == null) {
      return false;
    }

    final tokenAccountData = await getTokenAccountDataFromSplAccountAddress(
      splAccountAddress: largestAccount.address,
      blockchainType: nft.blockchainType,
    );
    if (tokenAccountData == null) {
      return false;
    }

    return accountAddress == tokenAccountData.info.owner;
  }

  (Message, CompiledMessage) formMessages(
    Map<String, dynamic> parsedResponse,
  ) {
    // final solTransaction = SolanaTransaction.fromJson(parsedResponse);
    // final message = Message(
    //   instructions: solTransaction.instructions.map((inst) {
    //     final programId = Ed25519HDPublicKey.fromBase58(inst.programId);
    //     return encoder.Instruction(
    //       accounts: inst.keys
    //           .map(
    //             (key) => encoder.AccountMeta(
    //               isSigner: key.isSigner,
    //               isWriteable: key.isWritable,
    //               pubKey: Ed25519HDPublicKey.fromBase58(key.pubkey),
    //             ),
    //           )
    //           .toList(),
    //       data: encoder.ByteArray.fromBase58(
    //         base58encode(
    //           inst.data,
    //         ),
    //       ),
    //       programId: programId,
    //     );
    //   }).toList(),
    // );
    // final keyPair = await _getKeyPair( privateKey);

    final decodedTx = base64Decode(parsedResponse['transaction'] as String);

    final tx = SignedTx.fromBytes(decodedTx);

    // final tx = SignedTx(
    //   compiledMessage: message.compile(
    //     recentBlockhash: solTransaction.recentBlockhash,
    //     feePayer: keyPair.publicKey,
    //   ),
    // );

    // print('Tx version ${tx.version}');

    // final signedTx = await keyPair.sign(tx.compiledMessage.toByteArray());

    return (tx.decompileMessage(), tx.compiledMessage);
  }

  Future<BigInt> estimateFeeForCompiledMessage(
    CompiledMessage message,
    BlockchainType blockchainType,
  ) {
    return _getFeeForCompiledMessage(
      blockchainType: blockchainType,
      message: message,
    );
  }

  BigInt getAmountFromMessage(Message message) {
    print(message.instructions.length);
    final instruction = message.instructions.firstWhereOrNull(
      (element) => element.programId.toString() == kSolProgramId,
    );
    print(instruction?.data);
    final data = instruction?.data.skip(4).toList();
    //decode u64 bytearray
    final amount = BigInt.from(
      data?.reversed.reduce(
            (value, element) => (value << 8) + element,
          ) ??
          0,
    );
    return amount;
  }

  Future<String> signString(
    String privateKey,
    String message,
  ) async {
    final keyPair = await _getKeyPair(privateKey);
    final signedTx = await keyPair.sign(base58decode(message));
    return base58encode(signedTx.bytes);
  }
}
