import 'dart:async';
import 'dart:ffi';

import 'package:crypto_wallet/providers/wallet_provider.dart';
import 'package:crypto_wallet/utils/eth_client.dart';
import 'package:flutter/material.dart';
import 'package:og_wallet_sdk/og_wallet_sdk.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({super.key});

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  double balance = 0;
  late WalletProvider walletProvider;
  late String? privateKey;
  late EthereumAddress address;
  late Timer _timer;

  Future<void> loadBalance() async {
    EtherAmount etherBalance = await ethClient.getBalance(address);
    setState(() {
      balance = etherBalance.getValueInUnit(EtherUnit.ether);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    walletProvider = Provider.of<WalletProvider>(context);
    privateKey = walletProvider.privateKey;
    address = await walletProvider.getPublicKey(privateKey!);

    loadBalance();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      loadBalance();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ξ${balance.toStringAsFixed(4)}',
      style: const TextStyle(
        fontSize: 60,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
