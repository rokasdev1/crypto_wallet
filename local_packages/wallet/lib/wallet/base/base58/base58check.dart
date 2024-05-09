library base58check;

import 'dart:convert';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart' show sha256;

import 'base58.dart';

class Base58CheckPayload {
  final int version;
  final List<int> payload;
  const Base58CheckPayload(this.version, this.payload);
  @override
  bool operator ==(Object other) =>
      other is Base58CheckPayload &&
      version == other.version &&
      const ListEquality().equals(payload, other.payload);
  @override
  int get hashCode => version.hashCode ^ const ListEquality().hash(payload);
}

class Base58CheckCodec extends Codec<Base58CheckPayload, String> {
  static const BITCOIN_ALPHABET =
      '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';

  final String alphabet;

  Base58CheckEncoder _encoder;
  Base58CheckDecoder _decoder;

  Base58CheckCodec(this.alphabet)
      : _encoder = Base58CheckEncoder(alphabet),
        _decoder = Base58CheckDecoder(alphabet);

  /// A codec that works with the Bitcoin alphabet and the SHA256 hash function.
  Base58CheckCodec.bitcoin() : this(BITCOIN_ALPHABET);

  @override
  Converter<Base58CheckPayload, String> get encoder => _encoder;

  @override
  Converter<String, Base58CheckPayload> get decoder => _decoder;

  Base58CheckPayload decodeUnchecked(String encoded) =>
      _decoder.convertUnchecked(encoded);
}

class Base58CheckEncoder extends Converter<Base58CheckPayload, String> {
  final String alphabet;

  const Base58CheckEncoder(this.alphabet);

  @override
  String convert(Base58CheckPayload input) {
    Uint8List bytes = Uint8List(input.payload.length + 1 + 4);
    bytes[0] = 0xFF & input.version;
    bytes.setRange(1, bytes.length - 4, input.payload);
    List<int> checksum = _hash(bytes.sublist(0, bytes.length - 4));
    bytes.setRange(bytes.length - 4, bytes.length, checksum.getRange(0, 4));
    return Base58Encoder(alphabet).convert(bytes);
  }
}

List<int> _hash(List<int> b) => sha256.convert(sha256.convert(b).bytes).bytes;

class Base58CheckDecoder extends Converter<String, Base58CheckPayload> {
  final String alphabet;

  const Base58CheckDecoder(this.alphabet);

  @override
  Base58CheckPayload convert(String input) => _convert(input, true);

  Base58CheckPayload convertUnchecked(String encoded) =>
      _convert(encoded, false);

  Base58CheckPayload _convert(String encoded, bool validateChecksum) {
    List<int> bytes = Base58Decoder(alphabet).convert(encoded);
    if (bytes.length < 5) {
      throw const FormatException(
        'Invalid Base58Check encoded string: must be at least size 5',
      );
    }
    List<int> checksum = _hash(bytes.sublist(0, bytes.length - 4));
    List<int> providedChecksum = bytes.sublist(bytes.length - 4, bytes.length);
    if (validateChecksum &&
        !const ListEquality()
            .equals(providedChecksum, checksum.sublist(0, 4))) {
      throw const FormatException('Invalid checksum in Base58Check encoding.');
    }
    return Base58CheckPayload(bytes[0], bytes.sublist(1, bytes.length - 4));
  }
}

//TODO consider making VersionedBase58heckCodec<List<int>, String>
