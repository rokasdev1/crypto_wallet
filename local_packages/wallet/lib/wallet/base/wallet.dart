import 'package:og_wallet_sdk/models/blockchain_type.dart';
import 'package:og_wallet_sdk/models/crypto_asset.dart';
import 'package:og_wallet_sdk/wallet/base/bip39/bip39.dart' as bip39;

abstract class TxParams {}

abstract class BaseWallet {
  RegExp get addressRegExp;

  Future<String> getDerivedPrivateKey({
    required String mnemonic,
    required BlockchainType blockchainType,
    required String derivationPath,
  });

  String generateMnemonic() => bip39.generateMnemonic();

  String getDerivedPath({required int index});

  Future<String> getNewAddress({
    required String privateKey,
  });
  bool isAddressValid({
    required String address,
  });
  Future<bool> isPrivateKeyValid({
    required String privateKey,
  });

  Future<String> signTransaction({
    required BlockchainType blockchainType,
    required String privateKey,
    required TxParams txParams,
  });
  Future<double?> getAccountBalance({
    required String privateKey,
    required BlockchainType blockchainType,
  });
  Future<double?> getBalance({
    required String privateKey,
    required BlockchainType blockchainType,
    required CryptoAsset cryptoAsset,
  });
  Future<BigInt> getCurrencyEstimatedFee({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
  });

  Future<BigInt> getTokenEstimatedFee({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
    required String contractAddress,
    required BigInt amountInLowestUnit,
  });

  Future<String?> sendTransaction({
    required BlockchainType blockchainType,
    required String recipientAddress,
    required String senderAddress,
    required String privateKey,
    required BigInt amountInLowestUnit,
    required CryptoAsset cryptoAsset,
    int? maxGas,
    BigInt? gasFeeInLowestUnit,
  });

  Future<bool?> isUserOwnerOfNFT({
    required NFT nft,
    required String accountAddress,
  });
}
