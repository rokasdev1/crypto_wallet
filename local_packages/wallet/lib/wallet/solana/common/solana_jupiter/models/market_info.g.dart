// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketInfo _$MarketInfoFromJson(Map<String, dynamic> json) => MarketInfo(
      json['id'] as String,
      json['label'] as String,
      json['inputMint'] as String,
      json['outputMint'] as String,
      json['notEnoughLiquidity'] as bool,
      json['inAmount'] as int,
      json['outAmount'] as int,
      (json['priceImpactPct'] as num?)?.toDouble(),
      Fee.fromJson(json['lpFee'] as Map<String, dynamic>),
      Fee.fromJson(json['platformFee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarketInfoToJson(MarketInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'inputMint': instance.inputMint,
      'outputMint': instance.outputMint,
      'notEnoughLiquidity': instance.notEnoughLiquidity,
      'inAmount': instance.inAmount,
      'outAmount': instance.outAmount,
      'priceImpactPct': instance.priceImpactPct,
      'lpFee': instance.lpFee.toJson(),
      'platformFee': instance.platformFee.toJson(),
    };
