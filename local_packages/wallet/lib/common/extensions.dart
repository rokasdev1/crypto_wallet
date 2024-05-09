import 'package:intl/intl.dart';

extension NumberExtension on num {
  /// Makes number to fixed amount of [decimals] and then parses back to double.
  /// If number has leading zeros, they are ignored
  ///
  /// For example:
  /// 10.000 => 10.0
  /// 0.01230000 => 0.0123
  /// 1.234566789 => 1.234568
  double? getDoubleFormattedAmount({int decimals = 4}) {
    return double.tryParse(toStringAsFixed(decimals));
  }

  /// Makes number to fixed amount of [decimals] if number is small (<1000). Otherwise returns formatted number.
  /// If number has leading zeros, they are ignored
  ///
  /// For example:
  /// 10.000 => 10.0
  /// 0.01230000 => 0.0123
  /// 1.234566789 => 1.234568
  /// 123456789 => 123M.4
  String getFormattedAmount({int decimalDigits = 4}) {
    const kThreshold = 1000;

    if (this == 0) return '0.00';

    if (this < kThreshold) {
      final formattedAmount = this.toStringAsFixed(decimalDigits);
      return formattedAmount;
    }

    final format = NumberFormat.compactSimpleCurrency(
      name: '',
      decimalDigits: decimalDigits,
      // locale: 'en_US',
    );
    final formattedAmount = format.format(this);
    return formattedAmount;
  }
}
