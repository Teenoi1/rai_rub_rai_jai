import 'package:flutter/material.dart';

// เพิ่ม หน้าจอล็อคเพื่อความปลอดภัย โดยใช้ PIN หรือ Biometric
class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  // Mockup tap to unlock, in real app should implement PIN or biometric authentication
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: const Text('Tap to Unlock'),
        ),
      ),
    );
  }
}


//   // เป็นหน้าจอ pin 1 2 3 4 5 6 7 8 9 0 และปุ่มลบ และปุ่มยืนยัน (length = 6)
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Enter PIN to Unlock'),
//             const SizedBox(height: 20),
//             //_buildPinInput(),
//             const SizedBox(height: 20),
//             //_buildKeypad(context),
//           ],
//         ),
//       ),
//     );
//   }
// }               