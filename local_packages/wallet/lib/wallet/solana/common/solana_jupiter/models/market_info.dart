import 'package:json_annotation/json_annotation.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/fee.dart';
part 'market_info.g.dart';

@JsonSerializable(explicitToJson: true)
class MarketInfo {
  final String id;
  final String label;
  final String inputMint;
  final String outputMint;
  final bool notEnoughLiquidity;
  final int inAmount;
  final int outAmount;
  final double? priceImpactPct;
  final Fee lpFee;
  final Fee platformFee;

  MarketInfo(
    this.id,
    this.label,
    this.inputMint,
    this.outputMint,
    this.notEnoughLiquidity,
    this.inAmount,
    this.outAmount,
    this.priceImpactPct,
    this.lpFee,
    this.platformFee,
  );

  factory MarketInfo.fromJson(Map<String, dynamic> json) =>
      _$MarketInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MarketInfoToJson(this);
}
