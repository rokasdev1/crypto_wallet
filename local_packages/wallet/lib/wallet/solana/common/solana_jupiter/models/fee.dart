import 'package:json_annotation/json_annotation.dart';
part 'fee.g.dart';

@JsonSerializable(explicitToJson: true)
class Fee {
  final double amount;
  final String mint;
  final double? pct;

  Fee({
    required this.amount,
    required this.mint,
    required this.pct,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => _$FeeFromJson(json);

  Map<String, dynamic> toJson() => _$FeeToJson(this);
}
