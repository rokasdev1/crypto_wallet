import 'package:json_annotation/json_annotation.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/enums/swap_mode.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/market_info.dart';

part 'route.g.dart';

@JsonSerializable(explicitToJson: true)
class Route {
  final int inAmount;
  final int outAmount;
  final int amount;
  final int otherAmountThreshold;
  final SwapMode swapMode;
  final double? priceImpactPct;
  @JsonKey(defaultValue: [])
  final List<MarketInfo> marketInfos;

  Route(
    this.inAmount,
    this.outAmount,
    this.amount,
    this.otherAmountThreshold,
    this.swapMode,
    this.priceImpactPct,
    this.marketInfos,
  );

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  Map<String, dynamic> toJson() => _$RouteToJson(this);

  String get marketInfoNames {
    final names = marketInfos.map((e) => e.label).toList();
    final formattedNames = names.join(' x ');

    return formattedNames;
  }

  String? get priceImpactFormatted {
    final localPriceImpactPct = priceImpactPct;
    if (localPriceImpactPct == null) return null;

    return '${(localPriceImpactPct * 100).toStringAsFixed(2)}%';
  }
}
