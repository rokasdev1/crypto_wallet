// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteRequest _$QuoteRequestFromJson(Map<String, dynamic> json) => QuoteRequest(
      inputMint: json['inputMint'] as String,
      outputMint: json['outputMint'] as String,
      amountInLowestUnit: json['amount'] as int,
      swapMode: $enumDecode(_$SwapModeEnumMap, json['swapMode']),
      onlyDirectRoutes: json['onlyDirectRoutes'] as bool? ?? false,
      slippage: (json['slippage'] as num?)?.toDouble(),
      feeBps: (json['feeBps'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$QuoteRequestToJson(QuoteRequest instance) {
  final val = <String, dynamic>{
    'inputMint': instance.inputMint,
    'outputMint': instance.outputMint,
    'amount': instance.amountInLowestUnit,
    'swapMode': _$SwapModeEnumMap[instance.swapMode]!,
    'onlyDirectRoutes': instance.onlyDirectRoutes,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('slippage', instance.slippage);
  writeNotNull('feeBps', instance.feeBps);
  return val;
}

const _$SwapModeEnumMap = {
  SwapMode.exactIn: 'ExactIn',
  SwapMode.exactOut: 'ExactOut',
};
