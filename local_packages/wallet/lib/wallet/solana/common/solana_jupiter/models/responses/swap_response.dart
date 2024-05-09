import 'package:json_annotation/json_annotation.dart';
part 'swap_response.g.dart';

@JsonSerializable()
class SwapResponse {
  @JsonKey(name: 'setupTransaction')
  final String? setupTransactionBase64;
  @JsonKey(name: 'swapTransaction')
  final String swapTransactionBase64;
  @JsonKey(name: 'cleanupTransaction')
  final String? cleanupTransactionBase64;

  SwapResponse({
    required this.setupTransactionBase64,
    required this.swapTransactionBase64,
    required this.cleanupTransactionBase64,
  });

  factory SwapResponse.fromJson(Map<String, dynamic> json) => _$SwapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SwapResponseToJson(this);
}
