import 'package:flutter/material.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(8.0),
      child: PageView(
        children: [
          _categoryPage([
            _categoryItem('อาหาร', 40,Colors.red),
            _categoryItem('เดินทาง', 30, Colors.green),
            _categoryItem('ค่าใช้จ่ายรายเดือน', 20, Colors.blue),
          ]),
          _categoryPage([
            _categoryItem('ฟุ่มเฟือย', 10, Colors.purple),
            _categoryItem('ท่องเที่ยว', 5, Colors.orange),
            _categoryItem('ค่ารักษา', 15, Colors.teal),
          ]),
        ],
      ),
    );
  }
}

Widget _categoryPage(List<Widget> items) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: items,
  );
}

Widget _categoryItem(String name, double percent, Color color) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text('${percent.toInt()}%'),
        ),
      ),
      const SizedBox(height: 8),
      Text(name),
    ],
  );
}