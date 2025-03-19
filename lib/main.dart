import 'package:expense_navigator/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider (
      create: (context) => TransactionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Navigator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}


