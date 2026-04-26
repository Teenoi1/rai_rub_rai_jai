import 'package:flutter/material.dart';
import '../widgets/category_carousel.dart';

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
      backgroundColor: const Color(0xFF702663),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              _header(),
              Expanded(child: _body()),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddPopup() {
    showModalBottomSheet(
      context: context,
      builder: (_) => const SizedBox(
        height: 200,
        child: Center(child: Text('Add Transaction')),
      ),
    );
  }


  Widget _header() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'คงเหลือ',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/history',
                    arguments: {'balance': balance},
                  );
                },
                child: Text(
                  '${balance.toStringAsFixed(2)} บาท',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40), // ขยายพื้นที่ header
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -28,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: _showAddPopup,
                  icon: const Icon(Icons.add, color: Color(0xFF7B3E70), size: 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _body() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBFB),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(
                  child: Text('Summary '),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: PageView(
                  children: [
                    CategoryCarousel(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Center(
                        child: Text('Category Carousel'),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Center(
                        child: Text('Spending Chart'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _footer() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF702663),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/add');
              },
              icon: const Icon(Icons.edit, size: 24, color: Color(0xFFFFFFFF)),
              label: const Text('Edit', style: TextStyle(color: Color(0xFFFFFFFF))),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B3E70),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/scan');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDFEAEE),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Icon(Icons.camera_alt, size: 24, color: Color(0xFF000000)),
            ),
          ),
        ],
      ),
    );
  }
}