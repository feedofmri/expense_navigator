import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/transaction_provider.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
        child: Column(
      children: [
      const Text('Monthly Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),

        Column(
          children: [
            const Text('Total Income:', style: TextStyle(fontSize: 16)),
            Text('\$${Provider.of<TransactionProvider>(context).totalIncome.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: Colors.green)),
            const Text('Total Expense:', style: TextStyle(fontSize: 16)),
            Text('\$${Provider.of<TransactionProvider>(context).totalExpenses.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: Colors.red)),
          ],
        ),

        const SizedBox(height: 10),
        const Text('Remaining:', style: TextStyle(fontSize: 16)),
        Text('\$${Provider.of<TransactionProvider>(context).remainingBalance.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: Provider.of<TransactionProvider>(context).remainingBalance >= 0 ? Colors.green : Colors.red)),
      ],
    ),
      ),
    );
  }
}
