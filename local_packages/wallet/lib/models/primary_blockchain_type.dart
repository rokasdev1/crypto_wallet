import 'package:json_annotation/json_annotation.dart';

enum PrimaryBlockchainType {
  @JsonValue('ETHEREUM')
  ethereum,
  @JsonValue('BITCOIN')
  bitcoin,
  @JsonValue('SOLANA')
  solana,
}

extension PrimaryBlockchainTypeExtension on PrimaryBlockchainType {
  String get text {
    switch (this) {
      case PrimaryBlockchainType.ethereum:
        return 'Ethereum';
      case PrimaryBlockchainType.solana:
        return 'Solana';
      case PrimaryBlockchainType.bitcoin:
        return 'Bitcoin';
    }
  }
}
