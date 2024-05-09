import 'package:json_annotation/json_annotation.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/route.dart';
part 'swap_request.g.dart';

@JsonSerializable(explicitToJson: true)
class SwapRequest {
  final Route route;
  final String userPublicKey;
  final bool wrapUnwrapSOL;
  @JsonKey(includeIfNull: false)
  final String? feeAccount;
  @JsonKey(includeIfNull: false)
  final String? tokenLedger;

  SwapRequest({
    required this.route,
    required this.userPublicKey,
    this.wrapUnwrapSOL = true,
    this.feeAccount,
    this.tokenLedger,
  });

  factory SwapRequest.fromJson(Map<String, dynamic> json) =>
      _$SwapRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SwapRequestToJson(this);
}
