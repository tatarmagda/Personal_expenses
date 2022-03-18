import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20.0),
      child: Card(
        elevation: 30,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            FlatButton(
              child: Text("+ dodaj"),
              onPressed: () {
                addTx(titleController.text, amountController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
