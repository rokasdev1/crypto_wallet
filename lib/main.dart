import 'package:crypto_wallet/pages/login_redirector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/wallet_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Load the private key
  WalletProvider walletProvider = WalletProvider();
  await walletProvider.setPrivateKey(
      '0xaabf2eabaaf5dfb134e40cd23bed5f6c05ef4ce18afcb22c3c25691d96733161');
  await walletProvider.loadPrivateKey();

  runApp(
    ChangeNotifierProvider<WalletProvider>.value(
      value: walletProvider,
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Inter',
          brightness: Brightness.dark,
        ),
        home: const LoginRedirector(),
      ),
    ),
  );
}
