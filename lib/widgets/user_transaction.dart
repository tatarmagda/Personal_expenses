import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransations extends StatefulWidget {
  UserTransations({Key? key}) : super(key: key);

  @override
  State<UserTransations> createState() => _UserTransationsState();
}

class _UserTransationsState extends State<UserTransations> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: "zakupy",
      amount: 11.22,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t13",
      title: "kupy",
      amount: 71.24,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTX = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTX);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
