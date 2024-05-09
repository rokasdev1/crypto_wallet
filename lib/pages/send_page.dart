import 'package:crypto_wallet/utils/eth_client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  final recipientController = TextEditingController();
  final amountController = TextEditingController();

  Future<void> sendTransaction(String receiver, EtherAmount value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? privateKey = prefs.getString('privateKey');
    var credentials = EthPrivateKey.fromHex(privateKey!);
    var address = credentials.address;
    BigInt chainId = await ethClient.getChainId();
    ethClient.sendTransaction(
      credentials,
      Transaction(
        from: address,
        to: EthereumAddress.fromHex(receiver),
        gasPrice: await ethClient.getGasPrice(),
        maxGas: 100000,
        value: value,
      ),
      chainId: chainId.toInt(),
    );
  }

  @override
  void dispose() {
    recipientController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: recipientController,
                decoration: const InputDecoration(
                  hintText: 'Recipient address',
                  labelText: 'To',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  hintText: 'Ethereum amount',
                  labelText: 'Amount',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  sendTransaction(
                    // recipientController.text,
                    '0xE25995D2816FDf74AccC777F24Cf8E2247F74CfB',
                    EtherAmount.fromInt(
                      EtherUnit.ether,
                      int.parse(amountController.text),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
