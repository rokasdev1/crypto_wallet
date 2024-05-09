library base58check.base58;

import 'dart:convert';
import 'dart:typed_data';

class Base58Codec extends Codec<List<int>, String> {
  final String alphabet;

  const Base58Codec(this.alphabet);

  @override
  Converter<List<int>, String> get encoder => Base58Encoder(alphabet);

  @override
  Converter<String, List<int>> get decoder => Base58Decoder(alphabet);
}

class Base58Encoder extends Converter<List<int>, String> {
  final String alphabet;

  const Base58Encoder(this.alphabet);

  @override
  String convert(List<int> input) {
    if (input.isEmpty) return '';

    // copy bytes because we are going to change it
    input = Uint8List.fromList(input);

    // count number of leading zeros
    int leadingZeroes = 0;
    while (leadingZeroes < input.length && input[leadingZeroes] == 0) {
      leadingZeroes++;
    }

    String output = '';
    int startAt = leadingZeroes;
    while (startAt < input.length) {
      int mod = _divmod58(input, startAt);
      if (input[startAt] == 0) startAt++;
      output = alphabet[mod] + output;
    }

    if (output.isNotEmpty) {
      while (output[0] == alphabet[0]) {
        output = output.substring(1, output.length);
      }
    }
    while (leadingZeroes-- > 0) {
      output = alphabet[0] + output;
    }

    return output;
  }

  static int _divmod58(List<int> number, int startAt) {
    int remaining = 0;
    for (int i = startAt; i < number.length; i++) {
      int num = (0xFF & remaining) * 256 + number[i];
      number[i] = num ~/ 58;
      remaining = num % 58;
    }
    return remaining;
  }
}

class Base58Decoder extends Converter<String, List<int>> {
  final String alphabet;

  const Base58Decoder(this.alphabet);

  @override
  List<int> convert(String input) {
    if (input.isEmpty) return Uint8List(0);

    // generate base 58 index list from input string
    var input58 = List<int>.filled(input.length, 0);
    for (int i = 0; i < input.length; i++) {
      int charint = alphabet.indexOf(input[i]);
      if (charint < 0) {
        throw const FormatException(
          'Invalid input formatting for Base58 decoding.',
        );
      }
      input58[i] = charint;
    }

    // count leading zeroes
    int leadingZeroes = 0;
    while (leadingZeroes < input58.length && input58[leadingZeroes] == 0) {
      leadingZeroes++;
    }

    // decode
    Uint8List output = Uint8List(input.length);
    int j = output.length;
    int startAt = leadingZeroes;
    while (startAt < input58.length) {
      int mod = _divmod256(input58, startAt);
      if (input58[startAt] == 0) startAt++;
      output[--j] = mod;
    }

    // remove unnecessary leading zeroes
    while (j < output.length && output[j] == 0) {
      j++;
    }
    return output.sublist(j - leadingZeroes);
  }

  static int _divmod256(List<int> number58, int startAt) {
    int remaining = 0;
    for (int i = startAt; i < number58.length; i++) {
      int num = 58 * remaining + (number58[i] & 0xFF);
      number58[i] = num ~/ 256;
      remaining = num % 256;
    }
    return remaining;
  }
}
