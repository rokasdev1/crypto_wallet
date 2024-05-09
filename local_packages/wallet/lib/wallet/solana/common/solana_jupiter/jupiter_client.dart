import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/exceptions/jupiter_exception.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/indexed_route_map.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/price.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/requests/indexed_route_map_request.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/requests/price_request.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/requests/quote_request.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/requests/swap_request.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/responses/swap_response.dart';
import 'package:og_wallet_sdk/wallet/solana/common/solana_jupiter/models/route.dart';

class JupiterClient {
  static const _kApiHostQuote = 'quote-api.jup.ag';
  static const _kApiHostPrice = 'price.jup.ag';
  static const _kApiRoot = '/v1';
  static const _kApiQuote = 'quote';
  static const _kApiPrice = 'price';
  static const _kApiIndexedRouteMap = 'indexed-route-map';
  static const _kApiSwap = 'swap';
  final _kClient = http.Client();

  Future<List<Route>> getQuote(QuoteRequest quoteRequest) async {
    final stringifiedParams = getStringifiedParams(quoteRequest.toJson());
    final url =
        Uri.https(_kApiHostQuote, '$_kApiRoot/$_kApiQuote', stringifiedParams);
    final response = await _kClient.get(url);

    if (response.statusCode != 200) {
      throw JupiterException(response.statusCode, response.body);
    }

    final jsonData = jsonDecode(response.body);

    try {
      final data = jsonData['data'];
      final result = data.map<Route>((e) => Route.fromJson(e)).toList();

      return result;
    } on JupiterException catch (_) {
      rethrow;
    } catch (e, s) {
      throw JupiterException(response.statusCode, e.toString(), s);
    }
  }

  Future<Price> getPrice(PriceRequest priceRequest) async {
    final stringifiedParams = getStringifiedParams(priceRequest.toJson());
    final url =
        Uri.https(_kApiHostPrice, '$_kApiRoot/$_kApiPrice', stringifiedParams);
    final response = await _kClient.get(url);

    if (response.statusCode != 200) {
      final statusCode = response.statusCode;
      final String message;
      if (response.statusCode == 400) {
        message =
            'Amount lesser or equals to 0. No routes found for trading pairs';
      } else if (response.statusCode == 404) {
        message = 'Symbol or address not found for either input or vsToken';
      } else if (response.statusCode == 409) {
        message = 'Duplicate symbol found for input or vsToken. '
            'The server will respond an error structure which contains the conflict addresses. '
            'User will have to use address mode instead.';
      } else {
        message = response.body;
      }
      throw JupiterException(statusCode, message);
    }

    final jsonData = jsonDecode(response.body);

    try {
      final result = Price.fromJson(jsonData['data']);
      return result;
    } on JupiterException catch (_) {
      rethrow;
    } catch (e, s) {
      throw JupiterException(response.statusCode, e.toString(), s);
    }
  }

  Future<IndexedRouteMap> getIndexedRouteMap(
    IndexedRouteMapRequest indexedRouteMapRequest,
  ) async {
    final stringifiedParams =
        getStringifiedParams(indexedRouteMapRequest.toJson());
    final url = Uri.https(
      _kApiHostQuote,
      '$_kApiRoot/$_kApiIndexedRouteMap',
      stringifiedParams,
    );
    final response = await _kClient.get(url);

    if (response.statusCode != 200) {
      throw JupiterException(response.statusCode, response.body);
    }

    final jsonData = jsonDecode(response.body);

    try {
      final result = IndexedRouteMap.fromJson(jsonData);
      return result;
    } on JupiterException catch (_) {
      rethrow;
    } catch (e, s) {
      throw JupiterException(response.statusCode, e.toString(), s);
    }
  }

  Future<SwapResponse> swap(SwapRequest swapRequest) async {
    final url = Uri.https(_kApiHostQuote, '$_kApiRoot/$_kApiSwap');
    final response = await _kClient.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(swapRequest.toJson()),
    );

    if (response.statusCode != 200) {
      throw JupiterException(response.statusCode, response.body);
    }

    final jsonData = jsonDecode(response.body);

    try {
      final result = SwapResponse.fromJson(jsonData);
      return result;
    } on JupiterException catch (_) {
      rethrow;
    } catch (e, s) {
      throw JupiterException(response.statusCode, e.toString(), s);
    }
  }

  // /// Get swap serialized transactions for a route
  // /// [userPublicKey] swap user public key
  // /// [route] route (@see [getQuote])
  // Future<JupiterSwapTransactions> getSwapTransactions({
  //   required String userPublicKey,
  //   required JupiterRoute route,
  // }) async {
  //   final url = Uri.https(_kApiHost, '$_kApiRoot/swap');
  //   final response = await _kClient.post(url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'route': route.toJson(),
  //         'userPublicKey': userPublicKey,
  //       }));
  //   return JupiterSwapTransactions.fromJson(jsonDecode(response.body));
  // }

  Map<String, String> getStringifiedParams(Map<String, dynamic> data) {
    return data.map((key, value) => MapEntry(key, value.toString()));
  }
}
