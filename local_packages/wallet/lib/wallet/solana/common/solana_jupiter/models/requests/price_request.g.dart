// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceRequest _$PriceRequestFromJson(Map<String, dynamic> json) => PriceRequest(
      id: json['id'] as String,
      vsToken: json['vsToken'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceRequestToJson(PriceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vsToken': instance.vsToken,
      'amount': instance.amount,
    };
