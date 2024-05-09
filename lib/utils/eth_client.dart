import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:og_wallet_sdk/og_wallet_sdk.dart';
import 'package:web3dart/web3dart.dart';

var apiUrl = dotenv.env['API_KEY'];

var httpClient = Client();
var ethClient = Web3Client(apiUrl!, httpClient);
