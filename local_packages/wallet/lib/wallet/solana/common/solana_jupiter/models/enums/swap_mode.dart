import 'package:json_annotation/json_annotation.dart';

enum SwapMode {
  @JsonValue('ExactIn')
  exactIn,
  @JsonValue('ExactOut')
  exactOut,
}
