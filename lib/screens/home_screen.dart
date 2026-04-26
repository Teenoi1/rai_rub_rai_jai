import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double balance = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(child: _body()),
            _footer(),
          ],
        ),
      ),
    );
  }


  Widget _header() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/history');
      },
      child: Column(
        children: [
          const Text('คงเหลือ'),

          Text(balance.toString()),
          IconButton(
            onPressed: _showAddPopup,
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }

  void _showAddPopup() {
    showModalBottomSheet(
      context: context,
      builder: (_) => const SizedBox(
        height: 300,
        child: Center(child: Text('เพิ่มรายการใหม่')),
      ),
    );
  }


  Widget _body() {
    return ListView(
      children: const [
        SizedBox(height: 200, child: Center(child: Text('รายการที่ 1'))),
        SizedBox(height: 200, child: Center(child: Text('รายการที่ 2'))),
      ],
    );
  }


  Widget _footer() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/scan');
            }, 
            child: const Icon(Icons.qr_code),
            ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            }, 
            child: const Icon(Icons.add),
            ),
        ),
      ],
    );
  }
}