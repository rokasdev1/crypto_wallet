import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solana_transaction.freezed.dart';
part 'solana_transaction.g.dart';

@freezed
class SolanaTransaction with _$SolanaTransaction {
  factory SolanaTransaction({
    required String feePayer,
    required List<SolInstruction> instructions,
    required String recentBlockhash,
    required List<Signature> signatures,
    required String transaction,
  }) = _SolanaTransaction;

  factory SolanaTransaction.fromJson(Map<String, dynamic> json) =>
      _$SolanaTransactionFromJson(json);
}

@freezed
class SolInstruction with _$SolInstruction {
  factory SolInstruction({
    required String programId,
    required List<int> data,
    required List<Key> keys,
  }) = _SolInstruction;

  factory SolInstruction.fromJson(Map<String, dynamic> json) =>
      _$SolInstructionFromJson(json);
}

@freezed
class Key with _$Key {
  factory Key({
    required bool isSigner,
    required bool isWritable,
    required String pubkey,
  }) = _Key;

  factory Key.fromJson(Map<String, dynamic> json) => _$KeyFromJson(json);
}

@freezed
class Signature with _$Signature {
  factory Signature({
    required String publicKey,
    String? signature,
  }) = _Signature;

  factory Signature.fromJson(Map<String, dynamic> json) =>
      _$SignatureFromJson(json);
}
