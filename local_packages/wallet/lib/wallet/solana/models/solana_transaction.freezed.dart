// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solana_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolanaTransaction _$SolanaTransactionFromJson(Map<String, dynamic> json) {
  return _SolanaTransaction.fromJson(json);
}

/// @nodoc
mixin _$SolanaTransaction {
  String get feePayer => throw _privateConstructorUsedError;
  List<SolInstruction> get instructions => throw _privateConstructorUsedError;
  String get recentBlockhash => throw _privateConstructorUsedError;
  List<Signature> get signatures => throw _privateConstructorUsedError;
  String get transaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolanaTransactionCopyWith<SolanaTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolanaTransactionCopyWith<$Res> {
  factory $SolanaTransactionCopyWith(
          SolanaTransaction value, $Res Function(SolanaTransaction) then) =
      _$SolanaTransactionCopyWithImpl<$Res, SolanaTransaction>;
  @useResult
  $Res call(
      {String feePayer,
      List<SolInstruction> instructions,
      String recentBlockhash,
      List<Signature> signatures,
      String transaction});
}

/// @nodoc
class _$SolanaTransactionCopyWithImpl<$Res, $Val extends SolanaTransaction>
    implements $SolanaTransactionCopyWith<$Res> {
  _$SolanaTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feePayer = null,
    Object? instructions = null,
    Object? recentBlockhash = null,
    Object? signatures = null,
    Object? transaction = null,
  }) {
    return _then(_value.copyWith(
      feePayer: null == feePayer
          ? _value.feePayer
          : feePayer // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<SolInstruction>,
      recentBlockhash: null == recentBlockhash
          ? _value.recentBlockhash
          : recentBlockhash // ignore: cast_nullable_to_non_nullable
              as String,
      signatures: null == signatures
          ? _value.signatures
          : signatures // ignore: cast_nullable_to_non_nullable
              as List<Signature>,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolanaTransactionImplCopyWith<$Res>
    implements $SolanaTransactionCopyWith<$Res> {
  factory _$$SolanaTransactionImplCopyWith(_$SolanaTransactionImpl value,
          $Res Function(_$SolanaTransactionImpl) then) =
      __$$SolanaTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String feePayer,
      List<SolInstruction> instructions,
      String recentBlockhash,
      List<Signature> signatures,
      String transaction});
}

/// @nodoc
class __$$SolanaTransactionImplCopyWithImpl<$Res>
    extends _$SolanaTransactionCopyWithImpl<$Res, _$SolanaTransactionImpl>
    implements _$$SolanaTransactionImplCopyWith<$Res> {
  __$$SolanaTransactionImplCopyWithImpl(_$SolanaTransactionImpl _value,
      $Res Function(_$SolanaTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feePayer = null,
    Object? instructions = null,
    Object? recentBlockhash = null,
    Object? signatures = null,
    Object? transaction = null,
  }) {
    return _then(_$SolanaTransactionImpl(
      feePayer: null == feePayer
          ? _value.feePayer
          : feePayer // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value._instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<SolInstruction>,
      recentBlockhash: null == recentBlockhash
          ? _value.recentBlockhash
          : recentBlockhash // ignore: cast_nullable_to_non_nullable
              as String,
      signatures: null == signatures
          ? _value._signatures
          : signatures // ignore: cast_nullable_to_non_nullable
              as List<Signature>,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolanaTransactionImpl
    with DiagnosticableTreeMixin
    implements _SolanaTransaction {
  _$SolanaTransactionImpl(
      {required this.feePayer,
      required final List<SolInstruction> instructions,
      required this.recentBlockhash,
      required final List<Signature> signatures,
      required this.transaction})
      : _instructions = instructions,
        _signatures = signatures;

  factory _$SolanaTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SolanaTransactionImplFromJson(json);

  @override
  final String feePayer;
  final List<SolInstruction> _instructions;
  @override
  List<SolInstruction> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  @override
  final String recentBlockhash;
  final List<Signature> _signatures;
  @override
  List<Signature> get signatures {
    if (_signatures is EqualUnmodifiableListView) return _signatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_signatures);
  }

  @override
  final String transaction;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolanaTransaction(feePayer: $feePayer, instructions: $instructions, recentBlockhash: $recentBlockhash, signatures: $signatures, transaction: $transaction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SolanaTransaction'))
      ..add(DiagnosticsProperty('feePayer', feePayer))
      ..add(DiagnosticsProperty('instructions', instructions))
      ..add(DiagnosticsProperty('recentBlockhash', recentBlockhash))
      ..add(DiagnosticsProperty('signatures', signatures))
      ..add(DiagnosticsProperty('transaction', transaction));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SolanaTransactionImpl &&
            (identical(other.feePayer, feePayer) ||
                other.feePayer == feePayer) &&
            const DeepCollectionEquality()
                .equals(other._instructions, _instructions) &&
            (identical(other.recentBlockhash, recentBlockhash) ||
                other.recentBlockhash == recentBlockhash) &&
            const DeepCollectionEquality()
                .equals(other._signatures, _signatures) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      feePayer,
      const DeepCollectionEquality().hash(_instructions),
      recentBlockhash,
      const DeepCollectionEquality().hash(_signatures),
      transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolanaTransactionImplCopyWith<_$SolanaTransactionImpl> get copyWith =>
      __$$SolanaTransactionImplCopyWithImpl<_$SolanaTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolanaTransactionImplToJson(
      this,
    );
  }
}

abstract class _SolanaTransaction implements SolanaTransaction {
  factory _SolanaTransaction(
      {required final String feePayer,
      required final List<SolInstruction> instructions,
      required final String recentBlockhash,
      required final List<Signature> signatures,
      required final String transaction}) = _$SolanaTransactionImpl;

  factory _SolanaTransaction.fromJson(Map<String, dynamic> json) =
      _$SolanaTransactionImpl.fromJson;

  @override
  String get feePayer;
  @override
  List<SolInstruction> get instructions;
  @override
  String get recentBlockhash;
  @override
  List<Signature> get signatures;
  @override
  String get transaction;
  @override
  @JsonKey(ignore: true)
  _$$SolanaTransactionImplCopyWith<_$SolanaTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SolInstruction _$SolInstructionFromJson(Map<String, dynamic> json) {
  return _SolInstruction.fromJson(json);
}

/// @nodoc
mixin _$SolInstruction {
  String get programId => throw _privateConstructorUsedError;
  List<int> get data => throw _privateConstructorUsedError;
  List<Key> get keys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolInstructionCopyWith<SolInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolInstructionCopyWith<$Res> {
  factory $SolInstructionCopyWith(
          SolInstruction value, $Res Function(SolInstruction) then) =
      _$SolInstructionCopyWithImpl<$Res, SolInstruction>;
  @useResult
  $Res call({String programId, List<int> data, List<Key> keys});
}

/// @nodoc
class _$SolInstructionCopyWithImpl<$Res, $Val extends SolInstruction>
    implements $SolInstructionCopyWith<$Res> {
  _$SolInstructionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programId = null,
    Object? data = null,
    Object? keys = null,
  }) {
    return _then(_value.copyWith(
      programId: null == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>,
      keys: null == keys
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<Key>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolInstructionImplCopyWith<$Res>
    implements $SolInstructionCopyWith<$Res> {
  factory _$$SolInstructionImplCopyWith(_$SolInstructionImpl value,
          $Res Function(_$SolInstructionImpl) then) =
      __$$SolInstructionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String programId, List<int> data, List<Key> keys});
}

/// @nodoc
class __$$SolInstructionImplCopyWithImpl<$Res>
    extends _$SolInstructionCopyWithImpl<$Res, _$SolInstructionImpl>
    implements _$$SolInstructionImplCopyWith<$Res> {
  __$$SolInstructionImplCopyWithImpl(
      _$SolInstructionImpl _value, $Res Function(_$SolInstructionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programId = null,
    Object? data = null,
    Object? keys = null,
  }) {
    return _then(_$SolInstructionImpl(
      programId: null == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<int>,
      keys: null == keys
          ? _value._keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<Key>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolInstructionImpl
    with DiagnosticableTreeMixin
    implements _SolInstruction {
  _$SolInstructionImpl(
      {required this.programId,
      required final List<int> data,
      required final List<Key> keys})
      : _data = data,
        _keys = keys;

  factory _$SolInstructionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SolInstructionImplFromJson(json);

  @override
  final String programId;
  final List<int> _data;
  @override
  List<int> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final List<Key> _keys;
  @override
  List<Key> get keys {
    if (_keys is EqualUnmodifiableListView) return _keys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keys);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolInstruction(programId: $programId, data: $data, keys: $keys)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SolInstruction'))
      ..add(DiagnosticsProperty('programId', programId))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('keys', keys));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SolInstructionImpl &&
            (identical(other.programId, programId) ||
                other.programId == programId) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._keys, _keys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      programId,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_keys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolInstructionImplCopyWith<_$SolInstructionImpl> get copyWith =>
      __$$SolInstructionImplCopyWithImpl<_$SolInstructionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolInstructionImplToJson(
      this,
    );
  }
}

abstract class _SolInstruction implements SolInstruction {
  factory _SolInstruction(
      {required final String programId,
      required final List<int> data,
      required final List<Key> keys}) = _$SolInstructionImpl;

  factory _SolInstruction.fromJson(Map<String, dynamic> json) =
      _$SolInstructionImpl.fromJson;

  @override
  String get programId;
  @override
  List<int> get data;
  @override
  List<Key> get keys;
  @override
  @JsonKey(ignore: true)
  _$$SolInstructionImplCopyWith<_$SolInstructionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Key _$KeyFromJson(Map<String, dynamic> json) {
  return _Key.fromJson(json);
}

/// @nodoc
mixin _$Key {
  bool get isSigner => throw _privateConstructorUsedError;
  bool get isWritable => throw _privateConstructorUsedError;
  String get pubkey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeyCopyWith<Key> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyCopyWith<$Res> {
  factory $KeyCopyWith(Key value, $Res Function(Key) then) =
      _$KeyCopyWithImpl<$Res, Key>;
  @useResult
  $Res call({bool isSigner, bool isWritable, String pubkey});
}

/// @nodoc
class _$KeyCopyWithImpl<$Res, $Val extends Key> implements $KeyCopyWith<$Res> {
  _$KeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSigner = null,
    Object? isWritable = null,
    Object? pubkey = null,
  }) {
    return _then(_value.copyWith(
      isSigner: null == isSigner
          ? _value.isSigner
          : isSigner // ignore: cast_nullable_to_non_nullable
              as bool,
      isWritable: null == isWritable
          ? _value.isWritable
          : isWritable // ignore: cast_nullable_to_non_nullable
              as bool,
      pubkey: null == pubkey
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeyImplCopyWith<$Res> implements $KeyCopyWith<$Res> {
  factory _$$KeyImplCopyWith(_$KeyImpl value, $Res Function(_$KeyImpl) then) =
      __$$KeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSigner, bool isWritable, String pubkey});
}

/// @nodoc
class __$$KeyImplCopyWithImpl<$Res> extends _$KeyCopyWithImpl<$Res, _$KeyImpl>
    implements _$$KeyImplCopyWith<$Res> {
  __$$KeyImplCopyWithImpl(_$KeyImpl _value, $Res Function(_$KeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSigner = null,
    Object? isWritable = null,
    Object? pubkey = null,
  }) {
    return _then(_$KeyImpl(
      isSigner: null == isSigner
          ? _value.isSigner
          : isSigner // ignore: cast_nullable_to_non_nullable
              as bool,
      isWritable: null == isWritable
          ? _value.isWritable
          : isWritable // ignore: cast_nullable_to_non_nullable
              as bool,
      pubkey: null == pubkey
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeyImpl with DiagnosticableTreeMixin implements _Key {
  _$KeyImpl(
      {required this.isSigner, required this.isWritable, required this.pubkey});

  factory _$KeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeyImplFromJson(json);

  @override
  final bool isSigner;
  @override
  final bool isWritable;
  @override
  final String pubkey;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Key(isSigner: $isSigner, isWritable: $isWritable, pubkey: $pubkey)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Key'))
      ..add(DiagnosticsProperty('isSigner', isSigner))
      ..add(DiagnosticsProperty('isWritable', isWritable))
      ..add(DiagnosticsProperty('pubkey', pubkey));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyImpl &&
            (identical(other.isSigner, isSigner) ||
                other.isSigner == isSigner) &&
            (identical(other.isWritable, isWritable) ||
                other.isWritable == isWritable) &&
            (identical(other.pubkey, pubkey) || other.pubkey == pubkey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isSigner, isWritable, pubkey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyImplCopyWith<_$KeyImpl> get copyWith =>
      __$$KeyImplCopyWithImpl<_$KeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeyImplToJson(
      this,
    );
  }
}

abstract class _Key implements Key {
  factory _Key(
      {required final bool isSigner,
      required final bool isWritable,
      required final String pubkey}) = _$KeyImpl;

  factory _Key.fromJson(Map<String, dynamic> json) = _$KeyImpl.fromJson;

  @override
  bool get isSigner;
  @override
  bool get isWritable;
  @override
  String get pubkey;
  @override
  @JsonKey(ignore: true)
  _$$KeyImplCopyWith<_$KeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Signature _$SignatureFromJson(Map<String, dynamic> json) {
  return _Signature.fromJson(json);
}

/// @nodoc
mixin _$Signature {
  String get publicKey => throw _privateConstructorUsedError;
  String? get signature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignatureCopyWith<Signature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignatureCopyWith<$Res> {
  factory $SignatureCopyWith(Signature value, $Res Function(Signature) then) =
      _$SignatureCopyWithImpl<$Res, Signature>;
  @useResult
  $Res call({String publicKey, String? signature});
}

/// @nodoc
class _$SignatureCopyWithImpl<$Res, $Val extends Signature>
    implements $SignatureCopyWith<$Res> {
  _$SignatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicKey = null,
    Object? signature = freezed,
  }) {
    return _then(_value.copyWith(
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignatureImplCopyWith<$Res>
    implements $SignatureCopyWith<$Res> {
  factory _$$SignatureImplCopyWith(
          _$SignatureImpl value, $Res Function(_$SignatureImpl) then) =
      __$$SignatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String publicKey, String? signature});
}

/// @nodoc
class __$$SignatureImplCopyWithImpl<$Res>
    extends _$SignatureCopyWithImpl<$Res, _$SignatureImpl>
    implements _$$SignatureImplCopyWith<$Res> {
  __$$SignatureImplCopyWithImpl(
      _$SignatureImpl _value, $Res Function(_$SignatureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicKey = null,
    Object? signature = freezed,
  }) {
    return _then(_$SignatureImpl(
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignatureImpl with DiagnosticableTreeMixin implements _Signature {
  _$SignatureImpl({required this.publicKey, this.signature});

  factory _$SignatureImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignatureImplFromJson(json);

  @override
  final String publicKey;
  @override
  final String? signature;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Signature(publicKey: $publicKey, signature: $signature)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Signature'))
      ..add(DiagnosticsProperty('publicKey', publicKey))
      ..add(DiagnosticsProperty('signature', signature));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignatureImpl &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            (identical(other.signature, signature) ||
                other.signature == signature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, publicKey, signature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignatureImplCopyWith<_$SignatureImpl> get copyWith =>
      __$$SignatureImplCopyWithImpl<_$SignatureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignatureImplToJson(
      this,
    );
  }
}

abstract class _Signature implements Signature {
  factory _Signature(
      {required final String publicKey,
      final String? signature}) = _$SignatureImpl;

  factory _Signature.fromJson(Map<String, dynamic> json) =
      _$SignatureImpl.fromJson;

  @override
  String get publicKey;
  @override
  String? get signature;
  @override
  @JsonKey(ignore: true)
  _$$SignatureImplCopyWith<_$SignatureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
