// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePIcker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                child: Column(
                  children: [
                    _selectedDate == null
                        ? Text("Nie wybrano daty!",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 170, 25, 25),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center)
                        : Text(
                            "Wybrana data: \n ${DateFormat.yMd().format(_selectedDate!)}",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                    (RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      textColor: Theme.of(context).colorScheme.primary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Wybierz datę",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Icon(Icons.calendar_month),
                        ],
                      ),
                      onPressed: () {
                        _presentDatePIcker();
                      },
                    ))
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(50),
              alignment: AlignmentDirectional.bottomEnd,
              child: FlatButton(
                child: Text("+ dodaj",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                color: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  _submitData;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
