import 'package:json_annotation/json_annotation.dart';

enum CryptoAssetType {
  @JsonValue('CRYPTO_CURRENCY')
  cryptoCurrency,
  @JsonValue('FUNGIBLE_TOKEN')
  fungibleToken,
  @JsonValue('NON_FUNGIBLE_TOKEN')
  nonFungibleToken,
}

extension CryptoAssetTypeExtension on CryptoAssetType {
  String get text {
    switch (this) {
      case CryptoAssetType.cryptoCurrency:
        return 'Crypto Currency';
      case CryptoAssetType.fungibleToken:
        return 'Crypto Token';
      case CryptoAssetType.nonFungibleToken:
        return 'NFT';
    }
  }

  int get maxGas {
    switch (this) {
      case CryptoAssetType.cryptoCurrency:
        return 21000;
      case CryptoAssetType.fungibleToken:
        return 200000;
      case CryptoAssetType.nonFungibleToken:
        return 200000;
    }
  }
}
