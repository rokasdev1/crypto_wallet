// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      json['inAmount'] as int,
      json['outAmount'] as int,
      json['amount'] as int,
      json['otherAmountThreshold'] as int,
      $enumDecode(_$SwapModeEnumMap, json['swapMode']),
      (json['priceImpactPct'] as num?)?.toDouble(),
      (json['marketInfos'] as List<dynamic>?)
              ?.map((e) => MarketInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'inAmount': instance.inAmount,
      'outAmount': instance.outAmount,
      'amount': instance.amount,
      'otherAmountThreshold': instance.otherAmountThreshold,
      'swapMode': _$SwapModeEnumMap[instance.swapMode]!,
      'priceImpactPct': instance.priceImpactPct,
      'marketInfos': instance.marketInfos.map((e) => e.toJson()).toList(),
    };

const _$SwapModeEnumMap = {
  SwapMode.exactIn: 'ExactIn',
  SwapMode.exactOut: 'ExactOut',
};
