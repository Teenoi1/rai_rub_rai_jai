class LocalDbService {
  Future<void> insertTransaction() async {
    // TODO: Implement the logic to insert a transaction into the local database
  }

  Future<List> fetchTransactions({int limit = 30, int offset = 0}) async {
    // TODO: Implement the logic to fetch transactions from the local database (query by pagination)
    return [];
  }

  Future<double> getBalance() async {
    // TODO: sum income - expense
    return 0.0;
  }

  Future<void> deleteTransaction() async { 
    // TODO: Implement the logic to delete a transaction from the local database
  }
}