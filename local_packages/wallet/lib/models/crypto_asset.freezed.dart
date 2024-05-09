// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CryptoAsset _$CryptoAssetFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'CRYPTO_CURRENCY':
      return CryptoCurrency.fromJson(json);
    case 'FUNGIBLE_TOKEN':
      return CryptoToken.fromJson(json);
    case 'NON_FUNGIBLE_TOKEN':
      return NFT.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'CryptoAsset', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$CryptoAsset {
  CryptoAssetType get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'blockchain_type')
  BlockchainType get blockchainType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  ImageSource get imageSource => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_usd')
  String? get priceUsd => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_percentage_24h')
  String? get priceChangePercentage24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'market_cap')
  double? get marketCap => throw _privateConstructorUsedError;
  bool get isCustom => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)
        currency,
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)
        token,
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)
        nft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)?
        currency,
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)?
        token,
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)?
        nft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)?
        currency,
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)?
        token,
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)?
        nft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CryptoCurrency value) currency,
    required TResult Function(CryptoToken value) token,
    required TResult Function(NFT value) nft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CryptoCurrency value)? currency,
    TResult? Function(CryptoToken value)? token,
    TResult? Function(NFT value)? nft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CryptoCurrency value)? currency,
    TResult Function(CryptoToken value)? token,
    TResult Function(NFT value)? nft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoAssetCopyWith<CryptoAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoAssetCopyWith<$Res> {
  factory $CryptoAssetCopyWith(
          CryptoAsset value, $Res Function(CryptoAsset) then) =
      _$CryptoAssetCopyWithImpl<$Res, CryptoAsset>;
  @useResult
  $Res call(
      {CryptoAssetType type,
      String id,
      @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
      String name,
      String symbol,
      @JsonKey(name: 'image_url') String? imageUrl,
      ImageSource imageSource,
      double balance,
      @JsonKey(name: 'price_usd') String? priceUsd,
      @JsonKey(name: 'price_change_percentage_24h')
      String? priceChangePercentage24h,
      @JsonKey(name: 'market_cap') double? marketCap,
      bool isCustom});
}

/// @nodoc
class _$CryptoAssetCopyWithImpl<$Res, $Val extends CryptoAsset>
    implements $CryptoAssetCopyWith<$Res> {
  _$CryptoAssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? blockchainType = null,
    Object? name = null,
    Object? symbol = null,
    Object? imageUrl = freezed,
    Object? imageSource = null,
    Object? balance = null,
    Object? priceUsd = freezed,
    Object? priceChangePercentage24h = freezed,
    Object? marketCap = freezed,
    Object? isCustom = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CryptoAssetType,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blockchainType: null == blockchainType
          ? _value.blockchainType
          : blockchainType // ignore: cast_nullable_to_non_nullable
              as BlockchainType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageSource: null == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      priceUsd: freezed == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as String?,
      priceChangePercentage24h: freezed == priceChangePercentage24h
          ? _value.priceChangePercentage24h
          : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
              as String?,
      marketCap: freezed == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as double?,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoCurrencyImplCopyWith<$Res>
    implements $CryptoAssetCopyWith<$Res> {
  factory _$$CryptoCurrencyImplCopyWith(_$CryptoCurrencyImpl value,
          $Res Function(_$CryptoCurrencyImpl) then) =
      __$$CryptoCurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CryptoAssetType type,
      String id,
      @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
      String name,
      String symbol,
      @JsonKey(name: 'image_url') String? imageUrl,
      ImageSource imageSource,
      double balance,
      @JsonKey(name: 'price_usd') String? priceUsd,
      @JsonKey(name: 'price_change_percentage_24h')
      String? priceChangePercentage24h,
      @JsonKey(name: 'market_cap') double? marketCap,
      bool isCustom,
      int decimals});
}

/// @nodoc
class __$$CryptoCurrencyImplCopyWithImpl<$Res>
    extends _$CryptoAssetCopyWithImpl<$Res, _$CryptoCurrencyImpl>
    implements _$$CryptoCurrencyImplCopyWith<$Res> {
  __$$CryptoCurrencyImplCopyWithImpl(
      _$CryptoCurrencyImpl _value, $Res Function(_$CryptoCurrencyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? blockchainType = null,
    Object? name = null,
    Object? symbol = null,
    Object? imageUrl = freezed,
    Object? imageSource = null,
    Object? balance = null,
    Object? priceUsd = freezed,
    Object? priceChangePercentage24h = freezed,
    Object? marketCap = freezed,
    Object? isCustom = null,
    Object? decimals = null,
  }) {
    return _then(_$CryptoCurrencyImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CryptoAssetType,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blockchainType: null == blockchainType
          ? _value.blockchainType
          : blockchainType // ignore: cast_nullable_to_non_nullable
              as BlockchainType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageSource: null == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      priceUsd: freezed == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as String?,
      priceChangePercentage24h: freezed == priceChangePercentage24h
          ? _value.priceChangePercentage24h
          : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
              as String?,
      marketCap: freezed == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as double?,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoCurrencyImpl extends CryptoCurrency with _CryptoCurrency {
  _$CryptoCurrencyImpl(
      {required this.type,
      required this.id,
      @JsonKey(name: 'blockchain_type') required this.blockchainType,
      this.name = '',
      this.symbol = '',
      @JsonKey(name: 'image_url') this.imageUrl,
      this.imageSource = ImageSource.network,
      this.balance = 0,
      @JsonKey(name: 'price_usd') this.priceUsd,
      @JsonKey(name: 'price_change_percentage_24h')
      this.priceChangePercentage24h,
      @JsonKey(name: 'market_cap') this.marketCap,
      this.isCustom = false,
      this.decimals = 0})
      : super._();

  factory _$CryptoCurrencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoCurrencyImplFromJson(json);

  @override
  final CryptoAssetType type;
  @override
  final String id;
  @override
  @JsonKey(name: 'blockchain_type')
  final BlockchainType blockchainType;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String symbol;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey()
  final ImageSource imageSource;
  @override
  @JsonKey()
  final double balance;
  @override
  @JsonKey(name: 'price_usd')
  final String? priceUsd;
  @override
  @JsonKey(name: 'price_change_percentage_24h')
  final String? priceChangePercentage24h;
  @override
  @JsonKey(name: 'market_cap')
  final double? marketCap;
  @override
  @JsonKey()
  final bool isCustom;
// NFT does not have any decimals thus 0
  @override
  @JsonKey()
  final int decimals;

  @override
  String toString() {
    return 'CryptoAsset.currency(type: $type, id: $id, blockchainType: $blockchainType, name: $name, symbol: $symbol, imageUrl: $imageUrl, imageSource: $imageSource, balance: $balance, priceUsd: $priceUsd, priceChangePercentage24h: $priceChangePercentage24h, marketCap: $marketCap, isCustom: $isCustom, decimals: $decimals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoCurrencyImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blockchainType, blockchainType) ||
                other.blockchainType == blockchainType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageSource, imageSource) ||
                other.imageSource == imageSource) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(
                    other.priceChangePercentage24h, priceChangePercentage24h) ||
                other.priceChangePercentage24h == priceChangePercentage24h) &&
            (identical(other.marketCap, marketCap) ||
                other.marketCap == marketCap) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      blockchainType,
      name,
      symbol,
      imageUrl,
      imageSource,
      balance,
      priceUsd,
      priceChangePercentage24h,
      marketCap,
      isCustom,
      decimals);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoCurrencyImplCopyWith<_$CryptoCurrencyImpl> get copyWith =>
      __$$CryptoCurrencyImplCopyWithImpl<_$CryptoCurrencyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)
        currency,
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)
        token,
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)
        nft,
  }) {
    return currency(
        type,
        id,
        blockchainType,
        name,
        symbol,
        imageUrl,
        imageSource,
        balance,
        priceUsd,
        priceChangePercentage24h,
        marketCap,
        isCustom,
        decimals);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)?
        currency,
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)?
        token,
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)?
        nft,
  }) {
    return currency?.call(
        type,
        id,
        blockchainType,
        name,
        symbol,
        imageUrl,
        imageSource,
        balance,
        priceUsd,
        priceChangePercentage24h,
        marketCap,
        isCustom,
        decimals);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)?
        currency,
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)?
        token,
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)?
        nft,
    required TResult orElse(),
  }) {
    if (currency != null) {
      return currency(
          type,
          id,
          blockchainType,
          name,
          symbol,
          imageUrl,
          imageSource,
          balance,
          priceUsd,
          priceChangePercentage24h,
          marketCap,
          isCustom,
          decimals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CryptoCurrency value) currency,
    required TResult Function(CryptoToken value) token,
    required TResult Function(NFT value) nft,
  }) {
    return currency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CryptoCurrency value)? currency,
    TResult? Function(CryptoToken value)? token,
    TResult? Function(NFT value)? nft,
  }) {
    return currency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CryptoCurrency value)? currency,
    TResult Function(CryptoToken value)? token,
    TResult Function(NFT value)? nft,
    required TResult orElse(),
  }) {
    if (currency != null) {
      return currency(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoCurrencyImplToJson(
      this,
    );
  }
}

abstract class CryptoCurrency extends CryptoAsset
    implements Currencies, _CryptoCurrency {
  factory CryptoCurrency(
      {required final CryptoAssetType type,
      required final String id,
      @JsonKey(name: 'blockchain_type')
      required final BlockchainType blockchainType,
      final String name,
      final String symbol,
      @JsonKey(name: 'image_url') final String? imageUrl,
      final ImageSource imageSource,
      final double balance,
      @JsonKey(name: 'price_usd') final String? priceUsd,
      @JsonKey(name: 'price_change_percentage_24h')
      final String? priceChangePercentage24h,
      @JsonKey(name: 'market_cap') final double? marketCap,
      final bool isCustom,
      final int decimals}) = _$CryptoCurrencyImpl;
  CryptoCurrency._() : super._();

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) =
      _$CryptoCurrencyImpl.fromJson;

  @override
  CryptoAssetType get type;
  @override
  String get id;
  @override
  @JsonKey(name: 'blockchain_type')
  BlockchainType get blockchainType;
  @override
  String get name;
  @override
  String get symbol;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  ImageSource get imageSource;
  @override
  double get balance;
  @override
  @JsonKey(name: 'price_usd')
  String? get priceUsd;
  @override
  @JsonKey(name: 'price_change_percentage_24h')
  String? get priceChangePercentage24h;
  @override
  @JsonKey(name: 'market_cap')
  double? get marketCap;
  @override
  bool get isCustom; // NFT does not have any decimals thus 0
  int get decimals;
  @override
  @JsonKey(ignore: true)
  _$$CryptoCurrencyImplCopyWith<_$CryptoCurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CryptoTokenImplCopyWith<$Res>
    implements $CryptoAssetCopyWith<$Res> {
  factory _$$CryptoTokenImplCopyWith(
          _$CryptoTokenImpl value, $Res Function(_$CryptoTokenImpl) then) =
      __$$CryptoTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CryptoAssetType type,
      String id,
      @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
      String name,
      String symbol,
      @JsonKey(name: 'image_url') String? imageUrl,
      ImageSource imageSource,
      double balance,
      @JsonKey(name: 'price_usd') String? priceUsd,
      @JsonKey(name: 'price_change_percentage_24h')
      String? priceChangePercentage24h,
      @JsonKey(name: 'market_cap') double? marketCap,
      bool isCustom,
      int decimals,
      @JsonKey(name: 'contract_address') String contractAddress});
}

/// @nodoc
class __$$CryptoTokenImplCopyWithImpl<$Res>
    extends _$CryptoAssetCopyWithImpl<$Res, _$CryptoTokenImpl>
    implements _$$CryptoTokenImplCopyWith<$Res> {
  __$$CryptoTokenImplCopyWithImpl(
      _$CryptoTokenImpl _value, $Res Function(_$CryptoTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? blockchainType = null,
    Object? name = null,
    Object? symbol = null,
    Object? imageUrl = freezed,
    Object? imageSource = null,
    Object? balance = null,
    Object? priceUsd = freezed,
    Object? priceChangePercentage24h = freezed,
    Object? marketCap = freezed,
    Object? isCustom = null,
    Object? decimals = null,
    Object? contractAddress = null,
  }) {
    return _then(_$CryptoTokenImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CryptoAssetType,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blockchainType: null == blockchainType
          ? _value.blockchainType
          : blockchainType // ignore: cast_nullable_to_non_nullable
              as BlockchainType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageSource: null == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      priceUsd: freezed == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as String?,
      priceChangePercentage24h: freezed == priceChangePercentage24h
          ? _value.priceChangePercentage24h
          : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
              as String?,
      marketCap: freezed == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as double?,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      contractAddress: null == contractAddress
          ? _value.contractAddress
          : contractAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoTokenImpl extends CryptoToken with _CryptoToken {
  _$CryptoTokenImpl(
      {required this.type,
      required this.id,
      @JsonKey(name: 'blockchain_type') required this.blockchainType,
      this.name = '',
      this.symbol = '',
      @JsonKey(name: 'image_url') this.imageUrl,
      this.imageSource = ImageSource.network,
      this.balance = 0,
      @JsonKey(name: 'price_usd') this.priceUsd,
      @JsonKey(name: 'price_change_percentage_24h')
      this.priceChangePercentage24h,
      @JsonKey(name: 'market_cap') this.marketCap,
      this.isCustom = false,
      this.decimals = 0,
      @JsonKey(name: 'contract_address') required this.contractAddress})
      : super._();

  factory _$CryptoTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoTokenImplFromJson(json);

  @override
  final CryptoAssetType type;
  @override
  final String id;
  @override
  @JsonKey(name: 'blockchain_type')
  final BlockchainType blockchainType;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String symbol;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey()
  final ImageSource imageSource;
  @override
  @JsonKey()
  final double balance;
  @override
  @JsonKey(name: 'price_usd')
  final String? priceUsd;
  @override
  @JsonKey(name: 'price_change_percentage_24h')
  final String? priceChangePercentage24h;
  @override
  @JsonKey(name: 'market_cap')
  final double? marketCap;
  @override
  @JsonKey()
  final bool isCustom;
// NFT does not have any decimals thus 0
  @override
  @JsonKey()
  final int decimals;
  @override
  @JsonKey(name: 'contract_address')
  final String contractAddress;

  @override
  String toString() {
    return 'CryptoAsset.token(type: $type, id: $id, blockchainType: $blockchainType, name: $name, symbol: $symbol, imageUrl: $imageUrl, imageSource: $imageSource, balance: $balance, priceUsd: $priceUsd, priceChangePercentage24h: $priceChangePercentage24h, marketCap: $marketCap, isCustom: $isCustom, decimals: $decimals, contractAddress: $contractAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoTokenImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blockchainType, blockchainType) ||
                other.blockchainType == blockchainType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageSource, imageSource) ||
                other.imageSource == imageSource) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(
                    other.priceChangePercentage24h, priceChangePercentage24h) ||
                other.priceChangePercentage24h == priceChangePercentage24h) &&
            (identical(other.marketCap, marketCap) ||
                other.marketCap == marketCap) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.contractAddress, contractAddress) ||
                other.contractAddress == contractAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      blockchainType,
      name,
      symbol,
      imageUrl,
      imageSource,
      balance,
      priceUsd,
      priceChangePercentage24h,
      marketCap,
      isCustom,
      decimals,
      contractAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoTokenImplCopyWith<_$CryptoTokenImpl> get copyWith =>
      __$$CryptoTokenImplCopyWithImpl<_$CryptoTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)
        currency,
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)
        token,
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)
        nft,
  }) {
    return token(
        type,
        id,
        blockchainType,
        name,
        symbol,
        imageUrl,
        imageSource,
        balance,
        priceUsd,
        priceChangePercentage24h,
        marketCap,
        isCustom,
        decimals,
        contractAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)?
        currency,
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)?
        token,
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)?
        nft,
  }) {
    return token?.call(
        type,
        id,
        blockchainType,
        name,
        symbol,
        imageUrl,
        imageSource,
        balance,
        priceUsd,
        priceChangePercentage24h,
        marketCap,
        isCustom,
        decimals,
        contractAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)?
        currency,
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)?
        token,
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)?
        nft,
    required TResult orElse(),
  }) {
    if (token != null) {
      return token(
          type,
          id,
          blockchainType,
          name,
          symbol,
          imageUrl,
          imageSource,
          balance,
          priceUsd,
          priceChangePercentage24h,
          marketCap,
          isCustom,
          decimals,
          contractAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CryptoCurrency value) currency,
    required TResult Function(CryptoToken value) token,
    required TResult Function(NFT value) nft,
  }) {
    return token(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CryptoCurrency value)? currency,
    TResult? Function(CryptoToken value)? token,
    TResult? Function(NFT value)? nft,
  }) {
    return token?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CryptoCurrency value)? currency,
    TResult Function(CryptoToken value)? token,
    TResult Function(NFT value)? nft,
    required TResult orElse(),
  }) {
    if (token != null) {
      return token(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoTokenImplToJson(
      this,
    );
  }
}

abstract class CryptoToken extends CryptoAsset implements _CryptoToken {
  factory CryptoToken(
      {required final CryptoAssetType type,
      required final String id,
      @JsonKey(name: 'blockchain_type')
      required final BlockchainType blockchainType,
      final String name,
      final String symbol,
      @JsonKey(name: 'image_url') final String? imageUrl,
      final ImageSource imageSource,
      final double balance,
      @JsonKey(name: 'price_usd') final String? priceUsd,
      @JsonKey(name: 'price_change_percentage_24h')
      final String? priceChangePercentage24h,
      @JsonKey(name: 'market_cap') final double? marketCap,
      final bool isCustom,
      final int decimals,
      @JsonKey(name: 'contract_address')
      required final String contractAddress}) = _$CryptoTokenImpl;
  CryptoToken._() : super._();

  factory CryptoToken.fromJson(Map<String, dynamic> json) =
      _$CryptoTokenImpl.fromJson;

  @override
  CryptoAssetType get type;
  @override
  String get id;
  @override
  @JsonKey(name: 'blockchain_type')
  BlockchainType get blockchainType;
  @override
  String get name;
  @override
  String get symbol;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  ImageSource get imageSource;
  @override
  double get balance;
  @override
  @JsonKey(name: 'price_usd')
  String? get priceUsd;
  @override
  @JsonKey(name: 'price_change_percentage_24h')
  String? get priceChangePercentage24h;
  @override
  @JsonKey(name: 'market_cap')
  double? get marketCap;
  @override
  bool get isCustom; // NFT does not have any decimals thus 0
  int get decimals;
  @JsonKey(name: 'contract_address')
  String get contractAddress;
  @override
  @JsonKey(ignore: true)
  _$$CryptoTokenImplCopyWith<_$CryptoTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NFTImplCopyWith<$Res> implements $CryptoAssetCopyWith<$Res> {
  factory _$$NFTImplCopyWith(_$NFTImpl value, $Res Function(_$NFTImpl) then) =
      __$$NFTImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CryptoAssetType type,
      String id,
      @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
      String name,
      String symbol,
      @JsonKey(name: 'image_url') String? imageUrl,
      ImageSource imageSource,
      double balance,
      @JsonKey(name: 'price_usd') String? priceUsd,
      @JsonKey(name: 'price_change_percentage_24h')
      String? priceChangePercentage24h,
      @JsonKey(name: 'market_cap') double? marketCap,
      bool isCustom,
      @JsonKey(name: 'contract_address') String contractAddress,
      String? description,
      String? uri,
      List<Trait>? metadata,
      @JsonKey(name: 'token_id') String? tokenId});
}

/// @nodoc
class __$$NFTImplCopyWithImpl<$Res>
    extends _$CryptoAssetCopyWithImpl<$Res, _$NFTImpl>
    implements _$$NFTImplCopyWith<$Res> {
  __$$NFTImplCopyWithImpl(_$NFTImpl _value, $Res Function(_$NFTImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? blockchainType = null,
    Object? name = null,
    Object? symbol = null,
    Object? imageUrl = freezed,
    Object? imageSource = null,
    Object? balance = null,
    Object? priceUsd = freezed,
    Object? priceChangePercentage24h = freezed,
    Object? marketCap = freezed,
    Object? isCustom = null,
    Object? contractAddress = null,
    Object? description = freezed,
    Object? uri = freezed,
    Object? metadata = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_$NFTImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CryptoAssetType,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      blockchainType: null == blockchainType
          ? _value.blockchainType
          : blockchainType // ignore: cast_nullable_to_non_nullable
              as BlockchainType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageSource: null == imageSource
          ? _value.imageSource
          : imageSource // ignore: cast_nullable_to_non_nullable
              as ImageSource,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      priceUsd: freezed == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as String?,
      priceChangePercentage24h: freezed == priceChangePercentage24h
          ? _value.priceChangePercentage24h
          : priceChangePercentage24h // ignore: cast_nullable_to_non_nullable
              as String?,
      marketCap: freezed == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as double?,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      contractAddress: null == contractAddress
          ? _value.contractAddress
          : contractAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as List<Trait>?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NFTImpl extends NFT with _NFT {
  _$NFTImpl(
      {required this.type,
      required this.id,
      @JsonKey(name: 'blockchain_type') required this.blockchainType,
      this.name = '',
      this.symbol = '',
      @JsonKey(name: 'image_url') this.imageUrl,
      this.imageSource = ImageSource.network,
      this.balance = 0,
      @JsonKey(name: 'price_usd') this.priceUsd,
      @JsonKey(name: 'price_change_percentage_24h')
      this.priceChangePercentage24h,
      @JsonKey(name: 'market_cap') this.marketCap,
      this.isCustom = false,
      @JsonKey(name: 'contract_address') required this.contractAddress,
      this.description,
      this.uri,
      final List<Trait>? metadata,
      @JsonKey(name: 'token_id') this.tokenId})
      : _metadata = metadata,
        super._();

  factory _$NFTImpl.fromJson(Map<String, dynamic> json) =>
      _$$NFTImplFromJson(json);

  @override
  final CryptoAssetType type;
  @override
  final String id;
  @override
  @JsonKey(name: 'blockchain_type')
  final BlockchainType blockchainType;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String symbol;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey()
  final ImageSource imageSource;
  @override
  @JsonKey()
  final double balance;
  @override
  @JsonKey(name: 'price_usd')
  final String? priceUsd;
  @override
  @JsonKey(name: 'price_change_percentage_24h')
  final String? priceChangePercentage24h;
  @override
  @JsonKey(name: 'market_cap')
  final double? marketCap;
  @override
  @JsonKey()
  final bool isCustom;
  @override
  @JsonKey(name: 'contract_address')
  final String contractAddress;
  @override
  final String? description;
  @override
  final String? uri;
  final List<Trait>? _metadata;
  @override
  List<Trait>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableListView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'token_id')
  final String? tokenId;

  @override
  String toString() {
    return 'CryptoAsset.nft(type: $type, id: $id, blockchainType: $blockchainType, name: $name, symbol: $symbol, imageUrl: $imageUrl, imageSource: $imageSource, balance: $balance, priceUsd: $priceUsd, priceChangePercentage24h: $priceChangePercentage24h, marketCap: $marketCap, isCustom: $isCustom, contractAddress: $contractAddress, description: $description, uri: $uri, metadata: $metadata, tokenId: $tokenId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.blockchainType, blockchainType) ||
                other.blockchainType == blockchainType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageSource, imageSource) ||
                other.imageSource == imageSource) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd) &&
            (identical(
                    other.priceChangePercentage24h, priceChangePercentage24h) ||
                other.priceChangePercentage24h == priceChangePercentage24h) &&
            (identical(other.marketCap, marketCap) ||
                other.marketCap == marketCap) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.contractAddress, contractAddress) ||
                other.contractAddress == contractAddress) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      blockchainType,
      name,
      symbol,
      imageUrl,
      imageSource,
      balance,
      priceUsd,
      priceChangePercentage24h,
      marketCap,
      isCustom,
      contractAddress,
      description,
      uri,
      const DeepCollectionEquality().hash(_metadata),
      tokenId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTImplCopyWith<_$NFTImpl> get copyWith =>
      __$$NFTImplCopyWithImpl<_$NFTImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)
        currency,
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)
        token,
    required TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)
        nft,
  }) {
    return nft(
        type,
        id,
        blockchainType,
        name,
        symbol,
        imageUrl,
        imageSource,
        balance,
        priceUsd,
        priceChangePercentage24h,
        marketCap,
        isCustom,
        contractAddress,
        description,
        uri,
        metadata,
        tokenId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)?
        currency,
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)?
        token,
    TResult? Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)?
        nft,
  }) {
    return nft?.call(
        type,
        id,
        blockchainType,
        name,
        symbol,
        imageUrl,
        imageSource,
        balance,
        priceUsd,
        priceChangePercentage24h,
        marketCap,
        isCustom,
        contractAddress,
        description,
        uri,
        metadata,
        tokenId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals)?
        currency,
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            int decimals,
            @JsonKey(name: 'contract_address') String contractAddress)?
        token,
    TResult Function(
            CryptoAssetType type,
            String id,
            @JsonKey(name: 'blockchain_type') BlockchainType blockchainType,
            String name,
            String symbol,
            @JsonKey(name: 'image_url') String? imageUrl,
            ImageSource imageSource,
            double balance,
            @JsonKey(name: 'price_usd') String? priceUsd,
            @JsonKey(name: 'price_change_percentage_24h')
            String? priceChangePercentage24h,
            @JsonKey(name: 'market_cap') double? marketCap,
            bool isCustom,
            @JsonKey(name: 'contract_address') String contractAddress,
            String? description,
            String? uri,
            List<Trait>? metadata,
            @JsonKey(name: 'token_id') String? tokenId)?
        nft,
    required TResult orElse(),
  }) {
    if (nft != null) {
      return nft(
          type,
          id,
          blockchainType,
          name,
          symbol,
          imageUrl,
          imageSource,
          balance,
          priceUsd,
          priceChangePercentage24h,
          marketCap,
          isCustom,
          contractAddress,
          description,
          uri,
          metadata,
          tokenId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CryptoCurrency value) currency,
    required TResult Function(CryptoToken value) token,
    required TResult Function(NFT value) nft,
  }) {
    return nft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CryptoCurrency value)? currency,
    TResult? Function(CryptoToken value)? token,
    TResult? Function(NFT value)? nft,
  }) {
    return nft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CryptoCurrency value)? currency,
    TResult Function(CryptoToken value)? token,
    TResult Function(NFT value)? nft,
    required TResult orElse(),
  }) {
    if (nft != null) {
      return nft(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NFTImplToJson(
      this,
    );
  }
}

abstract class NFT extends CryptoAsset implements _NFT {
  factory NFT(
      {required final CryptoAssetType type,
      required final String id,
      @JsonKey(name: 'blockchain_type')
      required final BlockchainType blockchainType,
      final String name,
      final String symbol,
      @JsonKey(name: 'image_url') final String? imageUrl,
      final ImageSource imageSource,
      final double balance,
      @JsonKey(name: 'price_usd') final String? priceUsd,
      @JsonKey(name: 'price_change_percentage_24h')
      final String? priceChangePercentage24h,
      @JsonKey(name: 'market_cap') final double? marketCap,
      final bool isCustom,
      @JsonKey(name: 'contract_address') required final String contractAddress,
      final String? description,
      final String? uri,
      final List<Trait>? metadata,
      @JsonKey(name: 'token_id') final String? tokenId}) = _$NFTImpl;
  NFT._() : super._();

  factory NFT.fromJson(Map<String, dynamic> json) = _$NFTImpl.fromJson;

  @override
  CryptoAssetType get type;
  @override
  String get id;
  @override
  @JsonKey(name: 'blockchain_type')
  BlockchainType get blockchainType;
  @override
  String get name;
  @override
  String get symbol;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  ImageSource get imageSource;
  @override
  double get balance;
  @override
  @JsonKey(name: 'price_usd')
  String? get priceUsd;
  @override
  @JsonKey(name: 'price_change_percentage_24h')
  String? get priceChangePercentage24h;
  @override
  @JsonKey(name: 'market_cap')
  double? get marketCap;
  @override
  bool get isCustom;
  @JsonKey(name: 'contract_address')
  String get contractAddress;
  String? get description;
  String? get uri;
  List<Trait>? get metadata;
  @JsonKey(name: 'token_id')
  String? get tokenId;
  @override
  @JsonKey(ignore: true)
  _$$NFTImplCopyWith<_$NFTImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Trait _$TraitFromJson(Map<String, dynamic> json) {
  return _Trait.fromJson(json);
}

/// @nodoc
mixin _$Trait {
  @JsonKey(name: 'trait_type')
  String get traitType => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TraitCopyWith<Trait> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TraitCopyWith<$Res> {
  factory $TraitCopyWith(Trait value, $Res Function(Trait) then) =
      _$TraitCopyWithImpl<$Res, Trait>;
  @useResult
  $Res call({@JsonKey(name: 'trait_type') String traitType, String value});
}

/// @nodoc
class _$TraitCopyWithImpl<$Res, $Val extends Trait>
    implements $TraitCopyWith<$Res> {
  _$TraitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? traitType = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      traitType: null == traitType
          ? _value.traitType
          : traitType // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TraitImplCopyWith<$Res> implements $TraitCopyWith<$Res> {
  factory _$$TraitImplCopyWith(
          _$TraitImpl value, $Res Function(_$TraitImpl) then) =
      __$$TraitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'trait_type') String traitType, String value});
}

/// @nodoc
class __$$TraitImplCopyWithImpl<$Res>
    extends _$TraitCopyWithImpl<$Res, _$TraitImpl>
    implements _$$TraitImplCopyWith<$Res> {
  __$$TraitImplCopyWithImpl(
      _$TraitImpl _value, $Res Function(_$TraitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? traitType = null,
    Object? value = null,
  }) {
    return _then(_$TraitImpl(
      traitType: null == traitType
          ? _value.traitType
          : traitType // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TraitImpl implements _Trait {
  _$TraitImpl(
      {@JsonKey(name: 'trait_type') this.traitType = '', this.value = ''});

  factory _$TraitImpl.fromJson(Map<String, dynamic> json) =>
      _$$TraitImplFromJson(json);

  @override
  @JsonKey(name: 'trait_type')
  final String traitType;
  @override
  @JsonKey()
  final String value;

  @override
  String toString() {
    return 'Trait(traitType: $traitType, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TraitImpl &&
            (identical(other.traitType, traitType) ||
                other.traitType == traitType) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, traitType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TraitImplCopyWith<_$TraitImpl> get copyWith =>
      __$$TraitImplCopyWithImpl<_$TraitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TraitImplToJson(
      this,
    );
  }
}

abstract class _Trait implements Trait {
  factory _Trait(
      {@JsonKey(name: 'trait_type') final String traitType,
      final String value}) = _$TraitImpl;

  factory _Trait.fromJson(Map<String, dynamic> json) = _$TraitImpl.fromJson;

  @override
  @JsonKey(name: 'trait_type')
  String get traitType;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$TraitImplCopyWith<_$TraitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
