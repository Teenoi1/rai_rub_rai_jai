import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ScrollController _controller = ScrollController();
  final List transactions = [];
  bool isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.position.pixels >= _controller.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  void _loadMore() {
    if (isLoading) return;
    setState(() => isLoading = true);

    // TODO: load more transactions from local storage

    setState(() => isLoading = false);
  }

  void _openSort() {
    showModalBottomSheet(
      context: context,
      builder: (_) => const SizedBox(
        height: 200,
        child: Center(child: Text('Sort options')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Records'),
        actions: [
          IconButton(
            onPressed: _openSort,
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: transactions.length + (isLoading ? 1 : 0),
        itemBuilder: (_, index) {
          if (index < transactions.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return const ListTile(title: Text('Transaction item'));
        },
      ),
    );
  }
}