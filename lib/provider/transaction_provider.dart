import 'package:expense_navigator/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  // For calculating the total amount of income
  double get totalIncome => transactions.where((tx) => tx.isIncome).fold(0.0, (sum, tx) => sum + tx.amount);

  // For calculating the total amount of expenses
  double get totalExpenses => transactions.where((tx) => !tx.isIncome).fold(0.0, (sum, tx) => sum + tx.amount);

  // For the remaining balance
  double get remainingBalance => totalIncome - totalExpenses;

  // Method to add a new transaction
  void addTransaction(String title, double amount, bool isIncome) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
      isIncome: isIncome,
    );

    _transactions.insert(0, newTransaction);
    notifyListeners();
  }

  // Method to delete a transaction
  void deleteTransaction(String id) {
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }

}