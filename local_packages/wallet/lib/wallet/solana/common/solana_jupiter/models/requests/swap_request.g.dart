// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swap_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwapRequest _$SwapRequestFromJson(Map<String, dynamic> json) => SwapRequest(
      route: Route.fromJson(json['route'] as Map<String, dynamic>),
      userPublicKey: json['userPublicKey'] as String,
      wrapUnwrapSOL: json['wrapUnwrapSOL'] as bool? ?? true,
      feeAccount: json['feeAccount'] as String?,
      tokenLedger: json['tokenLedger'] as String?,
    );

Map<String, dynamic> _$SwapRequestToJson(SwapRequest instance) {
  final val = <String, dynamic>{
    'route': instance.route.toJson(),
    'userPublicKey': instance.userPublicKey,
    'wrapUnwrapSOL': instance.wrapUnwrapSOL,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('feeAccount', instance.feeAccount);
  writeNotNull('tokenLedger', instance.tokenLedger);
  return val;
}
