import 'package:crypto_wallet/pages/verify_mnemonic_page.dart';
import 'package:crypto_wallet/providers/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class GenerateMnemonicPage extends StatelessWidget {
  const GenerateMnemonicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    final mnemonic = walletProvider.generateMnemonic();
    final mnemonicWords = mnemonic.split(' ');

    void copyToClipboard() {
      Clipboard.setData(ClipboardData(text: mnemonic));
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mnemonic copied to clipboard')));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyMnemonicPage(
              mnemonic: mnemonic,
            ),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Mnemonic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Store this mnemonic phrase safely:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...mnemonicWords.map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '${mnemonicWords.indexOf(e) + 1}. $e',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  copyToClipboard();
                },
                child: const Text('Copy to clipboard'))
          ],
        ),
      ),
    );
  }
}
