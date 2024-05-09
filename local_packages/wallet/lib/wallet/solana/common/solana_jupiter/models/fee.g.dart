// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fee _$FeeFromJson(Map<String, dynamic> json) => Fee(
      amount: (json['amount'] as num).toDouble(),
      mint: json['mint'] as String,
      pct: (json['pct'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FeeToJson(Fee instance) => <String, dynamic>{
      'amount': instance.amount,
      'mint': instance.mint,
      'pct': instance.pct,
    };
