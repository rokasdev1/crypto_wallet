import 'dart:math';

import 'package:collection/collection.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart';

extension AccountExtension on Account {
  double get sol => this.lamports / lamportsPerSol;
}

extension TransactionDetailsExtension on TransactionDetails {
  DateTime? get finalizedAt {
    final localBlockTime = blockTime;
    if (localBlockTime == null) return null;

    return DateTime.fromMillisecondsSinceEpoch(localBlockTime * 1000);
  }

  List<ParsedInstruction> get parsedInstructions {
    if (transaction is! ParsedInstruction) return [];
    return (transaction as ParsedTransaction)
        .message
        .instructions
        .whereType<ParsedInstruction>()
        .where((ParsedInstruction parsedInstruction) {
      return parsedInstruction.maybeMap(
        orElse: () => false,
        system: (systemTransfer) => systemTransfer.parsed.maybeMap(
          orElse: () => false,
          transfer: (_) => true,
          transferChecked: (_) => true,
        ),
        splToken: (splTransfer) => splTransfer.parsed.maybeMap(
          orElse: () => false,
          transfer: (_) => true,
          transferChecked: (_) => true,
        ),
      );
    }).toList();
  }

  List<ParsedInstruction> get parsedInnerInstructions {
    final innerInstructions = meta?.innerInstructions;
    if (innerInstructions == null) return [];

    final instructions =
        innerInstructions.map((e) => e.instructions).flattened.toList();
    final parsedInstructions = instructions
        .whereType<ParsedInstruction>()
        .where((ParsedInstruction parsedInstruction) {
      return parsedInstruction.maybeMap(
        orElse: () => false,
        system: (systemTransfer) => systemTransfer.parsed.maybeMap(
          orElse: () => false,
          transfer: (_) => true,
          transferChecked: (_) => true,
        ),
        splToken: (splTransfer) => splTransfer.parsed.maybeMap(
          orElse: () => false,
          transfer: (_) => true,
          transferChecked: (_) => true,
        ),
      );
    }).toList();

    return parsedInstructions;
  }
}

extension TokenAmountExtension on TokenAmount {
  bool get isNFT => decimals == 0 && int.tryParse(amount) == 1;

  double? get amountInHighestUnit {
    final intAmount = int.tryParse(amount);
    if (intAmount == null) return null;

    return intAmount / pow(10, decimals);
  }
}

extension ParsedInstructionExtension on ParsedInstruction {
  String? get senderAccountAddress {
    return map(
      system: (systemInstruction) => systemInstruction.parsed.map(
        transfer: (transfer) => transfer.info.source,
        transferChecked: (transferChecked) => transferChecked.info.source,
        unsupported: (_) => null,
      ),
      splToken: (splTokenInstruction) => splTokenInstruction.parsed.map(
        transfer: (transfer) => transfer.info.source,
        transferChecked: (transferChecked) => transferChecked.info.source,
        generic: (_) => null,
      ),
      memo: (_) => null,
      unsupported: (_) => null,
    );
  }

  String? getType() {
    return map(
      system: (systemInstruction) => systemInstruction.parsed.type,
      splToken: (splTokenInstruction) => splTokenInstruction.parsed.type,
      memo: (_) => null,
      unsupported: (dsa) => null,
    );
  }

  String? get receiverAccountAddress {
    return map(
      system: (systemInstruction) => systemInstruction.parsed.map(
        transfer: (transfer) => transfer.info.destination,
        transferChecked: (transferChecked) => transferChecked.info.destination,
        unsupported: (_) => null,
      ),
      splToken: (splTokenInstruction) => splTokenInstruction.parsed.map(
        transfer: (transfer) => transfer.info.destination,
        transferChecked: (transferChecked) => transferChecked.info.destination,
        generic: (_) => null,
      ),
      memo: (_) => null,
      unsupported: (_) => null,
    );
  }

  num? get amountInLowestUnit {
    return map(
      system: (systemInstruction) => systemInstruction.parsed.map(
        transfer: (transfer) => transfer.info.lamports,
        transferChecked: (transferChecked) => transferChecked.info.lamports,
        unsupported: (_) => null,
      ),
      splToken: (splTokenInstruction) => splTokenInstruction.parsed.map(
        transfer: (transfer) => num.tryParse(transfer.info.amount),
        transferChecked: (transferChecked) =>
            num.tryParse(transferChecked.info.tokenAmount.amount),
        generic: (_) => null,
      ),
      memo: (_) => null,
      unsupported: (_) => null,
    );
  }
}
