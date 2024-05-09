import 'package:crypto_wallet/pages/wallet_page.dart';
import 'package:crypto_wallet/providers/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImportWalletPage extends StatefulWidget {
  const ImportWalletPage({super.key});

  @override
  State<ImportWalletPage> createState() => _ImportWalletPageState();
}

class _ImportWalletPageState extends State<ImportWalletPage> {
  bool isVerified = false;
  final textController = TextEditingController();

  void navigateToWalletPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WalletPage(),
        ));
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void verifyMnemonic() async {
      final walletProvider =
          Provider.of<WalletProvider>(context, listen: false);

      await walletProvider.getPrivateKey(textController.text);

      navigateToWalletPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify mnemonic phrase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verify your mnemonic phrase:',
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              controller: textController,
            ),
            ElevatedButton(
                onPressed: verifyMnemonic, child: const Text('Verify')),
            ElevatedButton(
                onPressed: isVerified ? navigateToWalletPage : null,
                child: const Text('Next')),
          ],
        ),
      ),
    );
  }
}
