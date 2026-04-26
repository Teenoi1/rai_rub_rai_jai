class TransactionModel {
  final String id;
  final String title;
  final double amount;
  final String category;
  final String type; // 'income' or 'expense'
  final DateTime createdAt;
  final String? description;
  final bool isSynced;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.type,
    required this.createdAt,
    this.description,
    this.isSynced = false,
  });
}