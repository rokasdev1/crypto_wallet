import 'package:json_annotation/json_annotation.dart';
part 'price.g.dart';

@JsonSerializable()
class Price {
  final String id;
  final String mintSymbol;
  final String vsToken;
  final String vsTokenSymbol;
  final double price;

  Price(this.id, this.mintSymbol, this.vsToken, this.vsTokenSymbol, this.price);

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
