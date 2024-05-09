// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swap_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwapResponse _$SwapResponseFromJson(Map<String, dynamic> json) => SwapResponse(
      setupTransactionBase64: json['setupTransaction'] as String?,
      swapTransactionBase64: json['swapTransaction'] as String,
      cleanupTransactionBase64: json['cleanupTransaction'] as String?,
    );

Map<String, dynamic> _$SwapResponseToJson(SwapResponse instance) =>
    <String, dynamic>{
      'setupTransaction': instance.setupTransactionBase64,
      'swapTransaction': instance.swapTransactionBase64,
      'cleanupTransaction': instance.cleanupTransactionBase64,
    };
