import 'package:json_annotation/json_annotation.dart';
part 'price_request.g.dart';

@JsonSerializable()
class PriceRequest {
  final String id;
  final String vsToken;
  final double amount;

  PriceRequest({required this.id, required this.vsToken, required this.amount});

  PriceRequest.onlyCoins({required this.id, required this.vsToken}) : amount = 1;

  factory PriceRequest.fromJson(Map<String, dynamic> json) => _$PriceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PriceRequestToJson(this);
}
