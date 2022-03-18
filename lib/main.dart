// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
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

  String? titleInput;
  String? amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter app"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Color.fromARGB(255, 228, 164, 164),
              child: Text("chart"),
              elevation: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20.0),
            child: Card(
              elevation: 30,
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "title"),
                    onChanged: (val) {
                      titleInput = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    onChanged: (val) => amountInput = val,
                  ),
                  FlatButton(
                    child: Text("+ dodaj"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transaction.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(13),
                      child: Text(
                        " \$ ${tx.amount}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          DateFormat.yMMMEd().format(tx.date!),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
