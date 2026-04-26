import 'package:flutter/material.dart';

class BalanceHeader extends StatelessWidget {
  final double balance;
  
  const BalanceHeader({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          const Text('คงเหลือ'),
          Text(balance.toStringAsFixed(2)),
      ],
    );
  }
}