import 'package:flutter/material.dart';

class ScanReceiptScreen extends StatelessWidget {
  const ScanReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Receipt')),
      body: const Center(
        child: Text('Scan your receipt / Upload Image')),
    );
  }
}