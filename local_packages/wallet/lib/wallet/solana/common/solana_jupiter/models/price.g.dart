// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      json['id'] as String,
      json['mintSymbol'] as String,
      json['vsToken'] as String,
      json['vsTokenSymbol'] as String,
      (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'id': instance.id,
      'mintSymbol': instance.mintSymbol,
      'vsToken': instance.vsToken,
      'vsTokenSymbol': instance.vsTokenSymbol,
      'price': instance.price,
    };
