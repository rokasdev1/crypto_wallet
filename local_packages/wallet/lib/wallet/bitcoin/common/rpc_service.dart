import 'dart:async';
import 'dart:convert';

import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:http/http.dart';

// ignore: one_member_abstracts

class BitcoinRpcService {
  BitcoinRpcService(this.url, this.client);

  final Client client;
  final String url;

  int _currentRequestId = 1;

  Future<RPCResponse> _call(String function, [List<dynamic>? params]) async {
    params ??= [];

    final requestPayload = {
      'BitcoinRpcService': '1.0',
      'method': function,
      'params': params,
      'id': _currentRequestId++,
    };
    print('response: $url');
    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(requestPayload),
    );
    print('response: ${response.statusCode}');
    print('response: ${response.body}');

    final data = json.decode(response.body) as Map<String, dynamic>;

    if (data.containsKey('error')) {
      final error = data['error'];

      final code = error['code'] as int;
      final message = error['message'] as String;
      final errorData = error['data'];

      throw RPCError(code, message, errorData);
    }

    final id = data['id'] as int;
    final result = data['result'];
    return RPCResponse(id, result);
  }

  Future<List<UtxoWithAddress>> getAccountUtxo(
    UtxoAddressDetails owner,
  ) async {
    final response = await _call('listunspent', [
      0,
      9999999,
      [owner.address.toAddress(BitcoinNetwork.mainnet)],
      true,
    ]);
    final result = response.result as List<dynamic>;
    return result
        .map(
          (dynamic e) => UtxoWithAddress(
            ownerDetails: owner,
            utxo: BitcoinUtxo(
              // TODO(RIMAS): Shouldn't be dynamic
              txHash: e['txid'] as String,
              value: BigInt.from(e['amount'] as double),
              vout: e['vout'] as int,
              scriptType: owner.address.type,
              blockHeight: 1,
            ),
          ),
        )
        .toList();
  }

  Future<BigInt> getNetworkFeeRate() async {
    final response = await _call('estimatesmartfee', [6]);
    final result = response.result as Map<String, dynamic>;
    final feeRate = result['feerate'] as double;
    final satoshi = BigInt.from(100000000);
    return BigInt.from(feeRate * 100000000) ~/ satoshi;
  }

  Future<String> sendRawTransaction(String rawTx) async {
    final response = await _call('sendrawtransaction', [rawTx]);
    final result = response.result as String;
    return result;
  }

  void dispose() async {
    client.close();
  }
}

/// Response from the server to an rpc request. Contains the id of the request
/// and the corresponding result as sent by the server.
class RPCResponse {
  /// Constructor.
  const RPCResponse(this.id, this.result);

  /// Id.
  final int id;

  /// Result.
  final dynamic result;
}

/// Exception thrown when an the server returns an error code to an rpc request.
class RPCError implements Exception {
  /// Constructor.
  const RPCError(this.errorCode, this.message, this.data);

  /// Error code.
  final int errorCode;

  /// Message.
  final String message;

  /// Data.
  final dynamic data;

  @override
  String toString() {
    return 'RPCError: got code $errorCode with msg "$message".';
  }
}
