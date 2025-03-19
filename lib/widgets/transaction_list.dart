import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/transaction_provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<TransactionProvider>(context).transactions.length,
        itemBuilder: (ctx, index) {
          final tx = Provider.of<TransactionProvider>(context).transactions[index];
          return GestureDetector(
            onLongPress: () {
              Provider.of<TransactionProvider>(context, listen: false).deleteTransaction(tx.id);
            },
            child: ListTile(
              title: Text(tx.title),
              subtitle: Text(tx.date.toString()),
              trailing: Text(
                '\$${tx.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: tx.isIncome ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
          );

        },
      );
  }
}
