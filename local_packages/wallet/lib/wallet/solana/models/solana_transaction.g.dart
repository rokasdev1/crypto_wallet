// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solana_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolanaTransactionImpl _$$SolanaTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$SolanaTransactionImpl(
      feePayer: json['feePayer'] as String,
      instructions: (json['instructions'] as List<dynamic>)
          .map((e) => SolInstruction.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentBlockhash: json['recentBlockhash'] as String,
      signatures: (json['signatures'] as List<dynamic>)
          .map((e) => Signature.fromJson(e as Map<String, dynamic>))
          .toList(),
      transaction: json['transaction'] as String,
    );

Map<String, dynamic> _$$SolanaTransactionImplToJson(
        _$SolanaTransactionImpl instance) =>
    <String, dynamic>{
      'feePayer': instance.feePayer,
      'instructions': instance.instructions.map((e) => e.toJson()).toList(),
      'recentBlockhash': instance.recentBlockhash,
      'signatures': instance.signatures.map((e) => e.toJson()).toList(),
      'transaction': instance.transaction,
    };

_$SolInstructionImpl _$$SolInstructionImplFromJson(Map<String, dynamic> json) =>
    _$SolInstructionImpl(
      programId: json['programId'] as String,
      data: (json['data'] as List<dynamic>).map((e) => e as int).toList(),
      keys: (json['keys'] as List<dynamic>)
          .map((e) => Key.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SolInstructionImplToJson(
        _$SolInstructionImpl instance) =>
    <String, dynamic>{
      'programId': instance.programId,
      'data': instance.data,
      'keys': instance.keys.map((e) => e.toJson()).toList(),
    };

_$KeyImpl _$$KeyImplFromJson(Map<String, dynamic> json) => _$KeyImpl(
      isSigner: json['isSigner'] as bool,
      isWritable: json['isWritable'] as bool,
      pubkey: json['pubkey'] as String,
    );

Map<String, dynamic> _$$KeyImplToJson(_$KeyImpl instance) => <String, dynamic>{
      'isSigner': instance.isSigner,
      'isWritable': instance.isWritable,
      'pubkey': instance.pubkey,
    };

_$SignatureImpl _$$SignatureImplFromJson(Map<String, dynamic> json) =>
    _$SignatureImpl(
      publicKey: json['publicKey'] as String,
      signature: json['signature'] as String?,
    );

Map<String, dynamic> _$$SignatureImplToJson(_$SignatureImpl instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'signature': instance.signature,
    };
