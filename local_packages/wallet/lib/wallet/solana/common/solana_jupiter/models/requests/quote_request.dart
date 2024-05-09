import 'package:json_annotation/json_annotation.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/enums/swap_mode.dart';

part 'quote_request.g.dart';

@JsonSerializable()
class QuoteRequest {
  final String inputMint;
  final String outputMint;
  @JsonKey(name: 'amount')
  final int amountInLowestUnit;
  final SwapMode swapMode;
  final bool onlyDirectRoutes;
  @JsonKey(includeIfNull: false)
  final double? slippage;
  @JsonKey(includeIfNull: false)
  final double? feeBps;

  QuoteRequest({
    required this.inputMint,
    required this.outputMint,
    required this.amountInLowestUnit,
    required this.swapMode,
    this.onlyDirectRoutes = false,
    this.slippage,
    this.feeBps,
  });

  factory QuoteRequest.fromJson(Map<String, dynamic> json) =>
      _$QuoteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteRequestToJson(this);
}
