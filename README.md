# 💰 My Wallet - แอปบันทึกรายรับ-รายจ่ายส่วนตัว

แอปสำหรับบันทึกรายรับและรายจ่ายส่วนตัว ทำใช้เองจ้า

## ✨ Core Feature

### 🏠 หน้าแรก (Home)
- ✅ แสดงยอดคงเหลือ
- ✅ กราฟแสดงสรุปข้อมูล
- ✅ สรุปตามหมวดหมู่
- ✅ ปุ่มเพิ่มรายรับแบบ manual
- ✅ ปุ่มสแกนใบเสร็จ (OCR)
- ✅ ปุ่มเพิ่มรายจ่ายแบบ manual

### 📋 หน้าประวัติ (History)
- ✅ รายการย้อนหลังทั้งหมด
- ✅ Pagination (30 รายการต่อหน้า)
- ✅ ปุ่ม Sort (เดือน/วัน/หมวดหมู่)
- ✅ แก้ไขรายการได้
- ✅ ลบรายการได้

### 🔒 หน้าล็อค (Lock)
- ✅ PIN 6 หลัก
- ✅ Biometric (Fingerprint/Face)
- ✅ ปลดล็อคเมื่อเปิดแอป

### 📊 หน้าสรุป (Summary)
- ✅ เลือกช่วงเวลา (สัปดาห์/เดือน/ปี)
- ✅ รายรับ vs รายจ่าย
- ✅ สรุปตามหมวดหมู่

## 🔐 ความปลอดภัยและเป็นส่วนตัว

### หลักการออกแบบ:
1. **ข้อมูลเก็บในเครื่อง** - ไม่มี backend ส่วนกลาง
2. **Sync เป็นตัวเลือก** - ปุ่ม Sync ด้วยตนเอง
3. **เข้ารหัสด้วย PIN/Biometric** - ป้องกันการเข้าถึงโดยไม่อนุญาต

## 🚀 เริ่มต้นใช้งาน

### ติดตั้ง

```bash
# Clone repo
git clone <repo-url>
cd rai_rub_rai_jai

# ติดตั้ง dependencies
flutter pub get

# รัน
flutter run
```

### ตั้งค่า Google Sheets (ไม่บังคับ)

ดูเอกสาร: [GOOGLE_SHEETS_SETUP.md](GOOGLE_SHEETS_SETUP.md)

## 📁 โครงสร้างโปรเจกต์

```
lib/
├── main.dart                 # Entry point
├── models/transaction.dart   # Model ข้อมูล
├── screens/                  # หน้าแต่ละอัน
├── services/                 # Services (API, Sync, OCR)
└── widgets/                  # Widgets ที่ใช้ซ้ำ
```


## 📚 การใช้งาน

### เพิ่มรายการ

```dart
import 'models/transaction.dart';

final transaction = Transaction(
  title: '7-11',
  amount: 100.0,
  type: 'expense',
  category: 'food',
  date: DateTime.now(),
);

// บันทึกในเครื่อง
await apiService.saveTransactionLocal(transaction);
```

### ซิงค์กับ Google Sheets

```dart
// ใช้ปุ่มใน UI เพื่อเรียก
final sheetsService = GoogleSheetsService(
  spreadsheetId: spreadsheetId,
  sheetName: 'Transactions',
  apiKey: apiKey,
);

await sheetsService.addTransaction(transaction);
```

### สแกนใบเสร็จ

```dart
final ocrService = OcrService(apiKey: 'YOUR_GEMINI_API_KEY');
final transaction = await ocrService.scanReceipt('/path/to/receipt.jpg');
```

## 🛠️ การพัฒนา

### ตรวจสอบไฟล์

```bash
# Lint
flutter analyze

# Format
dart format lib/
```

### ทดสอบ

```bash
flutter test
```

## 📦 Dependencies หลัก

- `flutter` - Framework
- `provider` - State management
- `image_picker` - เลือกรูป
- `camera` - ถ่ายรูป
- `fl_chart` - กราฟ
- `googleapis` - Google API
- `intl` - จัดรูปแบบวันที่

## 🐛 Troubleshooting

### เมื่อมีปัญหา:

1. **ลบ cache**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **ตรวจสอบ dependencies**
   ```bash
   flutter pub upgrade
   ```

3. **ดูข้อมูลข้อผิดพลาด**
   ```bash
   flutter run -v
   ```

## 📝 TODO

- [ ] Local database (sqflite/hive)
- [ ] OCR สมบูรณ์
- [ ] Pie chart
- [ ] Biometric authentication
- [ ] Unit tests
- [ ] UI animations

---

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
