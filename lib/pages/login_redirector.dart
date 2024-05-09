import 'package:crypto_wallet/pages/create_import_page.dart';
import 'package:crypto_wallet/pages/wallet_page.dart';
import 'package:crypto_wallet/providers/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginRedirector extends StatelessWidget {
  const LoginRedirector({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    if (walletProvider.privateKey == null) {
      return const CreateImportPage();
    } else {
      return const WalletPage();
    }
  }
}
