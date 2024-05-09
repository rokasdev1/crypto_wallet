import 'dart:typed_data';

import 'package:blockchain_utils/hex/hex.dart';
import 'package:json_annotation/json_annotation.dart';

enum EVMNFTContractType {
  @JsonValue('ERC721')
  erc721,
  @JsonValue('ERC1155')
  erc1155,
  @JsonValue('KIP21')
  kip721,
  @JsonValue('KIP1155')
  kip1155,
}

extension NFTContractTypeX on EVMNFTContractType {
  String get text {
    switch (this) {
      case EVMNFTContractType.erc721:
        return 'ERC721';
      case EVMNFTContractType.erc1155:
        return 'ERC1155';
      case EVMNFTContractType.kip721:
        return 'KIP721';
      case EVMNFTContractType.kip1155:
        return 'KIP1155';
    }
  }

  Uint8List get interfaceId {
    switch (this) {
      case EVMNFTContractType.erc721:
        const idString = '0x80ac58cd';
        return Uint8List.fromList(hex.decode(idString));
      case EVMNFTContractType.erc1155:
        const idString = '0xd9b67a26';
        return Uint8List.fromList(hex.decode(idString));
      case EVMNFTContractType.kip721:
        const idString = '0x65787371';
        return Uint8List.fromList(hex.decode(idString));
      case EVMNFTContractType.kip1155:
        const idString = '0x0e89341c';
        return Uint8List.fromList(hex.decode(idString));
    }
  }
}
