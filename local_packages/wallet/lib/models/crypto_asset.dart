import 'package:decimal/decimal.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:og_wallet_sdk/common/extensions.dart';
import 'package:og_wallet_sdk/models/blockchain_type.dart';
import 'package:og_wallet_sdk/models/crypto_asset_type.dart';
import 'package:og_wallet_sdk/models/crypto_explorer_type.dart';
import 'package:og_wallet_sdk/models/image_source.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/nft_contract_type.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/smart_contracts/erc1155.g.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/smart_contracts/erc721.g.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/smart_contracts/kip1155.g.dart';
import 'package:og_wallet_sdk/wallet/ethereum/common/smart_contracts/kip721.g.dart';
import 'package:solana/solana.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web3dart/web3dart.dart';

part 'crypto_asset.freezed.dart';
part 'crypto_asset.g.dart';

class Currencies {
  static CryptoCurrency etherEthereum(BlockchainType blockchainType) =>
      CryptoCurrency(
        type: CryptoAssetType.cryptoCurrency,
        imageUrl:
            'https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880',
        id: 'ethereum',
        blockchainType: blockchainType,
        name: 'Ethereum',
        symbol: 'ETH',
        balance: 0,
        priceUsd: null,
        priceChangePercentage24h: null,
        marketCap: null,
        isCustom: false,
        decimals: 18,
      );

  static CryptoCurrency bnbBinanceSmartChain(BlockchainType blockchainType) =>
      CryptoCurrency(
        type: CryptoAssetType.cryptoCurrency,
        imageUrl:
            'https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850',
        id: 'binancecoin',
        blockchainType: blockchainType,
        name: 'BNB',
        symbol: 'BNB',
        balance: 0,
        priceUsd: null,
        priceChangePercentage24h: null,
        marketCap: null,
        isCustom: false,
        decimals: 18,
      );

  static CryptoCurrency maticPolygon(BlockchainType blockchainType) =>
      CryptoCurrency(
        type: CryptoAssetType.cryptoCurrency,
        imageUrl:
            'https://s2.coinmarketcap.com/static/img/coins/64x64/3890.png',
        id: 'matic',
        blockchainType: blockchainType,
        name: 'Polygon',
        symbol: 'MATIC',
        balance: 0,
        priceUsd: null,
        priceChangePercentage24h: null,
        marketCap: null,
        isCustom: false,
        decimals: 18,
      );

  static CryptoCurrency bitcoinBitcoin(BlockchainType blockchainType) =>
      CryptoCurrency(
        type: CryptoAssetType.cryptoCurrency,
        imageUrl: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png',
        id: 'bitcoin',
        blockchainType: blockchainType,
        name: 'Bitcoin',
        symbol: 'BTC',
        balance: 0,
        priceUsd: null,
        priceChangePercentage24h: null,
        marketCap: null,
        isCustom: false,
        decimals: 8,
      );

  static CryptoCurrency solanaSolana(BlockchainType blockchainType) =>
      CryptoCurrency(
        type: CryptoAssetType.cryptoCurrency,
        imageUrl:
            'https://s2.coinmarketcap.com/static/img/coins/64x64/5426.png',
        id: 'solana',
        blockchainType: blockchainType,
        name: 'Solana',
        symbol: 'SOL',
        balance: 0,
        priceUsd: null,
        priceChangePercentage24h: null,
        marketCap: null,
        isCustom: false,
        decimals: solDecimalPlaces,
      );

  static CryptoCurrency okcOKT(BlockchainType blockchainType) => CryptoCurrency(
        type: CryptoAssetType.cryptoCurrency,
        imageUrl:
            'https://assets.coingecko.com/coins/images/13708/small/WeChat_Image_20220118095654.png',
        id: 'okt',
        blockchainType: blockchainType,
        name: 'OKC',
        symbol: 'OKT',
        balance: 0,
        priceUsd: null,
        priceChangePercentage24h: null,
        marketCap: null,
        isCustom: false,
        decimals: 18,
      );

  static CryptoCurrency nccNeurochain(BlockchainType blockchainType) =>
      CryptoCurrency(
        type: CryptoAssetType.cryptoCurrency,
        imageUrl:
            'https://storage.googleapis.com/prod-public-storage-bucket-outgrid/neurochain-chain-image.png',
        id: 'neurochain',
        blockchainType: blockchainType,
        name: 'Neurochain',
        symbol: 'NCN',
        balance: 0,
        priceUsd: null,
        priceChangePercentage24h: null,
        marketCap: null,
        isCustom: false,
        decimals: 18,
      );

  static CryptoCurrency btcBitcoin(BlockchainType blockchainType) =>
      CryptoCurrency(
        type: CryptoAssetType.cryptoCurrency,
        imageUrl: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png',
        id: 'bitcoin',
        blockchainType: blockchainType,
        name: 'Bitcoin',
        symbol: 'BTC',
        balance: 0,
        priceUsd: null,
        priceChangePercentage24h: null,
        marketCap: null,
        isCustom: false,
        decimals: 8,
      );
}

mixin _CryptoCurrency {
  static CryptoCurrency fromAnkr(Map<String, dynamic> json) {
    return CryptoCurrency(
      type: CryptoAssetType.cryptoCurrency,
      imageUrl: json['thumbnail'] as String,
      id: '',
      blockchainType: BlockchainType.fromAnkr(json['blockchain']),
      name: json['tokenName'],
      symbol: json['tokenSymbol'],
      balance: double.tryParse(json['balance'].toString()) ?? 0,
      priceUsd: json['tokenPrice'] as String,
      priceChangePercentage24h: '0',
      marketCap: 0,
      isCustom: false,
      decimals: json['tokenDecimals'] as int,
    );
  }
}

mixin _CryptoToken {
  BlockchainType get blockchainType;
  String get contractAddress;
  Future<bool> launchTokenExplorer() async {
    final url = blockchainType.getExplorerUrl(
      CryptoExplorerType.token,
      contractAddress,
    );
    // For some reason, canLaunch returns false, thus simply wrap to try/catch
    try {
      launchUrl(Uri.parse(url));
      return true;
    } catch (_) {
      return false;
    }
  }

  static CryptoToken fromAnkr(Map<String, dynamic> json) {
    return CryptoToken(
      type: CryptoAssetType.fungibleToken,
      imageUrl: json['thumbnail'] as String,
      id: '',
      blockchainType: BlockchainType.fromAnkr(json['blockchain']),
      name: json['tokenName'],
      symbol: json['tokenSymbol'],
      balance: double.tryParse(json['balance'].toString()) ?? 0,
      priceUsd: json['tokenPrice'] as String,
      priceChangePercentage24h: '0',
      marketCap: 0,
      isCustom: false,
      decimals: json['tokenDecimals'] as int,
      contractAddress: json['contractAddress'] as String,
    );
  }
}

mixin _NFT {
  BlockchainType get blockchainType;
  String get contractAddress;
  String? get imageUrl;

  Future<bool> launchNFTExplorer() async {
    final url = blockchainType.getExplorerUrl(
      CryptoExplorerType.token,
      contractAddress,
    );
    // For some reason, canLaunch returns false, thus simply wrap to try/catch
    try {
      launchUrl(Uri.parse(url));
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<EVMNFTContractType?> get evmNFTContractType async {
    for (final contractType in EVMNFTContractType.values) {
      final supportsInterface = await _supportsInterface(contractType);
      if (supportsInterface) {
        return contractType;
      }
    }
    return null;
  }

  Future<bool> _supportsInterface(EVMNFTContractType contractType) async {
    final client = Web3Client(blockchainType.rpcUrl, http.Client());
    final address = EthereumAddress.fromHex(contractAddress);
    switch (contractType) {
      case EVMNFTContractType.erc721:
        final erc721Token = Erc721(address: address, client: client);
        return erc721Token.supportsInterface(contractType.interfaceId);
      case EVMNFTContractType.erc1155:
        final erc1155Token = Erc1155(address: address, client: client);
        return erc1155Token.supportsInterface(contractType.interfaceId);
      case EVMNFTContractType.kip721:
        final kip721Token = Kip721(address: address, client: client);
        return kip721Token.supportsInterface(contractType.interfaceId);
      case EVMNFTContractType.kip1155:
        final kip1155Token = Kip1155(address: address, client: client);
        return kip1155Token.supportsInterface(contractType.interfaceId);
    }
  }

  Future<GeneratedContract?> get generatedContract async {
    final contractType = await evmNFTContractType;
    if (contractType == null) {
      return null;
    }

    final client = Web3Client(blockchainType.rpcUrl, http.Client());
    final address = EthereumAddress.fromHex(contractAddress);
    switch (contractType) {
      case EVMNFTContractType.erc721:
        return Erc721(address: address, client: client);
      case EVMNFTContractType.erc1155:
        return Erc1155(address: address, client: client);
      case EVMNFTContractType.kip721:
        return Kip721(address: address, client: client);
      case EVMNFTContractType.kip1155:
        return Kip1155(address: address, client: client);
    }
  }
}

@freezed
sealed class CryptoAsset with _$CryptoAsset {
  CryptoAsset._();
  @Implements<Currencies>()
  @With<_CryptoCurrency>()
  @FreezedUnionValue('CRYPTO_CURRENCY')
  factory CryptoAsset.currency({
    required CryptoAssetType type,
    required String id,
    @JsonKey(name: 'blockchain_type') required BlockchainType blockchainType,
    @Default('') String name,
    @Default('') String symbol,
    @JsonKey(name: 'image_url') String? imageUrl,
    @Default(ImageSource.network) ImageSource imageSource,
    @Default(0) double balance,
    @JsonKey(name: 'price_usd') String? priceUsd,
    @JsonKey(name: 'price_change_percentage_24h')
    String? priceChangePercentage24h,
    @JsonKey(name: 'market_cap') double? marketCap,
    @Default(false) bool isCustom,
    // NFT does not have any decimals thus 0
    @Default(0) int decimals,
  }) = CryptoCurrency;

  @With<_CryptoToken>()
  @FreezedUnionValue('FUNGIBLE_TOKEN')
  factory CryptoAsset.token({
    required CryptoAssetType type,
    required String id,
    @JsonKey(name: 'blockchain_type') required BlockchainType blockchainType,
    @Default('') String name,
    @Default('') String symbol,
    @JsonKey(name: 'image_url') String? imageUrl,
    @Default(ImageSource.network) ImageSource imageSource,
    @Default(0) double balance,
    @JsonKey(name: 'price_usd') String? priceUsd,
    @JsonKey(name: 'price_change_percentage_24h')
    final String? priceChangePercentage24h,
    @JsonKey(name: 'market_cap') double? marketCap,
    @Default(false) bool isCustom,
    // NFT does not have any decimals thus 0
    @Default(0) int decimals,
    @JsonKey(name: 'contract_address') required String contractAddress,
  }) = CryptoToken;

  @With<_NFT>()
  @FreezedUnionValue('NON_FUNGIBLE_TOKEN')
  factory CryptoAsset.nft({
    required CryptoAssetType type,
    required String id,
    @JsonKey(name: 'blockchain_type') required BlockchainType blockchainType,
    @Default('') String name,
    @Default('') String symbol,
    @JsonKey(name: 'image_url') String? imageUrl,
    @Default(ImageSource.network) ImageSource imageSource,
    @Default(0) double balance,
    @JsonKey(name: 'price_usd') String? priceUsd,
    @JsonKey(name: 'price_change_percentage_24h')
    final String? priceChangePercentage24h,
    @JsonKey(name: 'market_cap') double? marketCap,
    @Default(false) bool isCustom,
    @JsonKey(name: 'contract_address') required String contractAddress,
    String? description,
    String? uri,
    List<Trait>? metadata,
    @JsonKey(name: 'token_id') String? tokenId,
  }) = NFT;

  factory CryptoAsset.fromJson(Map<String, dynamic> json) =>
      _$CryptoAssetFromJson(json);

  factory CryptoAsset.fromAnkr(Map<String, dynamic> json) {
    final isNative = json['tokenType'] == 'NATIVE';
    if (isNative) {
      return _CryptoCurrency.fromAnkr(json);
    } else {
      return _CryptoToken.fromAnkr(json);
    }
  }

  String? get contractAddress {
    return switch (this) {
      CryptoCurrency() => null,
      CryptoToken(:final contractAddress) => contractAddress,
      NFT(:final contractAddress) => contractAddress,
    };
  }

  String getShortSymbol() {
    return symbol.length > 4 ? '${symbol.substring(0, 4)}...' : symbol;
  }

  String get nameAndSymbol => '$name (${symbol.toUpperCase()})';

  double? get priceInUsdDouble {
    final localPriceUsd = priceUsd;
    if (localPriceUsd == null) return null;

    final parsedPrice = double.tryParse(localPriceUsd);
    return parsedPrice;
  }

  String? get priceInUsdFormatted {
    final localPriceUsd = priceInUsdDouble;
    if (localPriceUsd == null) return null;
    // return NumberFormat('#,##0.00', 'en_US').format(localPriceUsd);
    return NumberFormat.compactCurrency(symbol: '\$', locale: 'en_US')
        .format(localPriceUsd);
  }

  String get balanceInCryptoFormatted {
    final localBalance = balance;

    return '${localBalance.getFormattedAmount()} ${symbol.toUpperCase()}';
  }

  String get balanceInCryptoFormattedWithoutSymbol {
    final localBalance = balance;

    return localBalance.getFormattedAmount();
  }

  double? get balanceInUsd {
    final localBalance = balance;

    final priceInUsd = priceInUsdDouble;
    if (priceInUsd == null) return null;

    final balanceInUsd = localBalance * priceInUsd;
    return balanceInUsd;
  }

  String? get balanceInUsdFormatted {
    final localBalanceInUsd = balanceInUsd;
    if (localBalanceInUsd == null) return null;

    return NumberFormat.compactCurrency(symbol: '\$').format(localBalanceInUsd);
  }

  String? get priceChange24hFormatted {
    final localPriceChange = priceChangePercentage24h;
    if (localPriceChange == null) return null;

    final parsedPriceChange = double.tryParse(localPriceChange);
    if (parsedPriceChange == null) return null;

    String formattedPriceChange = parsedPriceChange.toStringAsFixed(2);
    if (!formattedPriceChange.startsWith('-')) {
      formattedPriceChange = '+$formattedPriceChange';
    }

    return '$formattedPriceChange%';
  }

  String? get marketCapFormatted {
    final localMarketCap = marketCap;
    if (localMarketCap == null) return null;

    return NumberFormat.compact().format(localMarketCap);
  }

  TextInputFormatter get decimalsFormatter => switch (this) {
        CryptoCurrency(:final decimals) => FilteringTextInputFormatter.allow(
            RegExp(r'^\d+\.?\d{0,' '$decimals' '}'),
          ),
        CryptoToken(:final decimals) => FilteringTextInputFormatter.allow(
            RegExp(r'^\d+\.?\d{0,' '$decimals' '}'),
          ),
        NFT() => FilteringTextInputFormatter.allow(
            RegExp(r'^\d+\.?\d{0,' '0' '}'),
          ),
      };

  double getAmountInHighestUnit(Decimal amount, {int? customDecimals}) =>
      switch (this) {
        CryptoCurrency(:final decimals) => (amount /
                Decimal.fromInt(10).pow(customDecimals ?? decimals).toDecimal())
            .toDouble(),
        CryptoToken(:final decimals) => (amount /
                Decimal.fromInt(10).pow(customDecimals ?? decimals).toDecimal())
            .toDouble(),
        NFT() => amount.toDouble(),
      };

  Decimal getAmountInLowestUnit(double amount) => switch (this) {
        CryptoCurrency(:final decimals) => Decimal.parse(amount.toString()) *
            Decimal.fromInt(10).pow(decimals).toDecimal(),
        CryptoToken(:final decimals) => Decimal.parse(amount.toString()) *
            Decimal.fromInt(10).pow(decimals).toDecimal(),
        NFT() => Decimal.parse(amount.toString()),
      };

  bool isNFT() {
    return type == CryptoAssetType.nonFungibleToken && this is NFT;
  }
}

@freezed
class Trait with _$Trait {
  factory Trait({
    @JsonKey(name: 'trait_type') @Default('') String traitType,
    @Default('') String value,
  }) = _Trait;

  factory Trait.fromJson(Map<String, dynamic> json) => _$TraitFromJson(json);
}
