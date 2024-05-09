import 'package:crypto_wallet/pages/generate_mnemonic_page.dart';
import 'package:crypto_wallet/pages/import_wallet.dart';
import 'package:flutter/material.dart';

class CreateImportPage extends StatelessWidget {
  const CreateImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kripto',
              style: TextStyle(fontSize: 60),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GenerateMnemonicPage(),
                    ));
              },
              child: const Text('Create wallet'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImportWalletPage(),
                    ));
              },
              child: const Text('Import from seed'),
            )
          ],
        ),
      ),
    );
  }
}
