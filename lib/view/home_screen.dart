import 'package:flutter/material.dart';

import '../widgets/add_transaction.dart';
import '../widgets/summary_card.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Expense Navigator')),
      ),
      body:
      Column(
        children: [
          SummaryCard(),
          Expanded(child: const TransactionList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddTransaction();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
