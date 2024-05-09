// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoCurrencyImpl _$$CryptoCurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CryptoCurrencyImpl(
      type: $enumDecode(_$CryptoAssetTypeEnumMap, json['type']),
      id: json['id'] as String,
      blockchainType:
          $enumDecode(_$BlockchainTypeEnumMap, json['blockchain_type']),
      name: json['name'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      imageSource:
          $enumDecodeNullable(_$ImageSourceEnumMap, json['imageSource']) ??
              ImageSource.network,
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      priceUsd: json['price_usd'] as String?,
      priceChangePercentage24h: json['price_change_percentage_24h'] as String?,
      marketCap: (json['market_cap'] as num?)?.toDouble(),
      isCustom: json['isCustom'] as bool? ?? false,
      decimals: json['decimals'] as int? ?? 0,
    );

Map<String, dynamic> _$$CryptoCurrencyImplToJson(
        _$CryptoCurrencyImpl instance) =>
    <String, dynamic>{
      'type': _$CryptoAssetTypeEnumMap[instance.type]!,
      'id': instance.id,
      'blockchain_type': _$BlockchainTypeEnumMap[instance.blockchainType]!,
      'name': instance.name,
      'symbol': instance.symbol,
      'image_url': instance.imageUrl,
      'imageSource': _$ImageSourceEnumMap[instance.imageSource]!,
      'balance': instance.balance,
      'price_usd': instance.priceUsd,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'market_cap': instance.marketCap,
      'isCustom': instance.isCustom,
      'decimals': instance.decimals,
    };

const _$CryptoAssetTypeEnumMap = {
  CryptoAssetType.cryptoCurrency: 'CRYPTO_CURRENCY',
  CryptoAssetType.fungibleToken: 'FUNGIBLE_TOKEN',
  CryptoAssetType.nonFungibleToken: 'NON_FUNGIBLE_TOKEN',
};

const _$BlockchainTypeEnumMap = {
  BlockchainType.ethereumMainNet: 'ETH_MAIN_NET',
  BlockchainType.ethereumRopstenTestNet: 'ETH_ROPSTEN_TEST_NET',
  BlockchainType.ethereumRinkebyTestNet: 'ETH_RINKEBY_TEST_NET',
  BlockchainType.ethereumGoerliTestNet: 'ETH_GOERLI_TEST_NET',
  BlockchainType.bscMainNet: 'BSC_MAIN_NET',
  BlockchainType.bscTestNet: 'BSC_TEST_NET',
  BlockchainType.solanaMainNet: 'SOLANA_MAIN_NET',
  BlockchainType.solanaTestNet: 'SOLANA_TEST_NET',
  BlockchainType.solanaDevNet: 'SOLANA_DEV_NET',
  BlockchainType.okcMainNet: 'OKC_MAIN_NET',
  BlockchainType.okcTestNet: 'OKC_TEST_NET',
  BlockchainType.polygonMainNet: 'POLYGON_MAIN_NET',
  BlockchainType.polygonTestNet: 'POLYGON_TEST_NET',
  BlockchainType.neurochainMainNet: 'NEUROCHAIN_MAIN_NET',
  BlockchainType.bitcoinMainNet: 'BITCOIN_MAIN_NET',
  BlockchainType.bitcoinTestNet: 'BITCOIN_TEST_NET',
};

const _$ImageSourceEnumMap = {
  ImageSource.asset: 'asset',
  ImageSource.network: 'network',
};

_$CryptoTokenImpl _$$CryptoTokenImplFromJson(Map<String, dynamic> json) =>
    _$CryptoTokenImpl(
      type: $enumDecode(_$CryptoAssetTypeEnumMap, json['type']),
      id: json['id'] as String,
      blockchainType:
          $enumDecode(_$BlockchainTypeEnumMap, json['blockchain_type']),
      name: json['name'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      imageSource:
          $enumDecodeNullable(_$ImageSourceEnumMap, json['imageSource']) ??
              ImageSource.network,
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      priceUsd: json['price_usd'] as String?,
      priceChangePercentage24h: json['price_change_percentage_24h'] as String?,
      marketCap: (json['market_cap'] as num?)?.toDouble(),
      isCustom: json['isCustom'] as bool? ?? false,
      decimals: json['decimals'] as int? ?? 0,
      contractAddress: json['contract_address'] as String,
    );

Map<String, dynamic> _$$CryptoTokenImplToJson(_$CryptoTokenImpl instance) =>
    <String, dynamic>{
      'type': _$CryptoAssetTypeEnumMap[instance.type]!,
      'id': instance.id,
      'blockchain_type': _$BlockchainTypeEnumMap[instance.blockchainType]!,
      'name': instance.name,
      'symbol': instance.symbol,
      'image_url': instance.imageUrl,
      'imageSource': _$ImageSourceEnumMap[instance.imageSource]!,
      'balance': instance.balance,
      'price_usd': instance.priceUsd,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'market_cap': instance.marketCap,
      'isCustom': instance.isCustom,
      'decimals': instance.decimals,
      'contract_address': instance.contractAddress,
    };

_$NFTImpl _$$NFTImplFromJson(Map<String, dynamic> json) => _$NFTImpl(
      type: $enumDecode(_$CryptoAssetTypeEnumMap, json['type']),
      id: json['id'] as String,
      blockchainType:
          $enumDecode(_$BlockchainTypeEnumMap, json['blockchain_type']),
      name: json['name'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      imageSource:
          $enumDecodeNullable(_$ImageSourceEnumMap, json['imageSource']) ??
              ImageSource.network,
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      priceUsd: json['price_usd'] as String?,
      priceChangePercentage24h: json['price_change_percentage_24h'] as String?,
      marketCap: (json['market_cap'] as num?)?.toDouble(),
      isCustom: json['isCustom'] as bool? ?? false,
      contractAddress: json['contract_address'] as String,
      description: json['description'] as String?,
      uri: json['uri'] as String?,
      metadata: (json['metadata'] as List<dynamic>?)
          ?.map((e) => Trait.fromJson(e as Map<String, dynamic>))
          .toList(),
      tokenId: json['token_id'] as String?,
    );

Map<String, dynamic> _$$NFTImplToJson(_$NFTImpl instance) => <String, dynamic>{
      'type': _$CryptoAssetTypeEnumMap[instance.type]!,
      'id': instance.id,
      'blockchain_type': _$BlockchainTypeEnumMap[instance.blockchainType]!,
      'name': instance.name,
      'symbol': instance.symbol,
      'image_url': instance.imageUrl,
      'imageSource': _$ImageSourceEnumMap[instance.imageSource]!,
      'balance': instance.balance,
      'price_usd': instance.priceUsd,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'market_cap': instance.marketCap,
      'isCustom': instance.isCustom,
      'contract_address': instance.contractAddress,
      'description': instance.description,
      'uri': instance.uri,
      'metadata': instance.metadata?.map((e) => e.toJson()).toList(),
      'token_id': instance.tokenId,
    };

_$TraitImpl _$$TraitImplFromJson(Map<String, dynamic> json) => _$TraitImpl(
      traitType: json['trait_type'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$$TraitImplToJson(_$TraitImpl instance) =>
    <String, dynamic>{
      'trait_type': instance.traitType,
      'value': instance.value,
    };
