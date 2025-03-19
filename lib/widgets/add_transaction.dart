import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/transaction_provider.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  bool _isIncome = true;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    Provider.of<TransactionProvider>(context, listen: false).addTransaction(
      enteredTitle,
      enteredAmount,
      _isIncome,
    );

    Navigator.of(context).pop();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(labelText: 'Amount'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Income',
              style: TextStyle(color: _isIncome == true? Colors.green : DefaultSelectionStyle.defaultColor),),
              Switch(
                value: _isIncome,
                onChanged: (value) {
                  setState(() {
                    _isIncome = value;
                  });
                },
              ),
              Text('Expenses',
              style: TextStyle(color: _isIncome == false? Colors.red : DefaultSelectionStyle.defaultColor),),
            ],
          ),
          ElevatedButton(
            onPressed: _submitData,
            child: const Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
