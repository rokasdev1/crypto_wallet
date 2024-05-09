import 'package:crypto_wallet/pages/wallet_page.dart';
import 'package:crypto_wallet/providers/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyMnemonicPage extends StatefulWidget {
  const VerifyMnemonicPage({super.key, required this.mnemonic});
  final String mnemonic;

  @override
  State<VerifyMnemonicPage> createState() => _VerifyMnemonicPageState();
}

class _VerifyMnemonicPageState extends State<VerifyMnemonicPage> {
  bool isVerified = false;
  final textController = TextEditingController();

  void verifyMnemonic() {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    String verificationText = textController.text;
    if (verificationText.trim() == widget.mnemonic.trim()) {
      walletProvider
          .setPrivateKey(textController.text)
          .then((privateKey) => setState(() {
                isVerified = true;
              }));
    }
  }

  void navigateToWalletPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WalletPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {
                  verifyMnemonic();
                },
                child: const Text('Verify')),
            ElevatedButton(
                onPressed: isVerified ? navigateToWalletPage : null,
                child: const Text('Next')),
          ],
        ),
      ),
    );
  }
}
