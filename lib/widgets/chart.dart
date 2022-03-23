import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTranactions;

  Chart(this.recentTranactions);

  Iterable<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (var i = 0; i < recentTranactions.length; i++) {
        if (recentTranactions[i].date!.day == weekDay.day &&
            recentTranactions[i].date!.month == weekDay.month &&
            recentTranactions[i].date!.year == weekDay.year) {
          totalSum += recentTranactions[i].amount!;
        }
      }

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum,
      };
    });
  }

  double get moneySpending {
    return groupedTransactionValues.fold(0.0, (
      sum,
      item,
    ) {
      return sum + (item["amount"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shadowColor: Theme.of(context).colorScheme.secondary,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  data["day"] as String,
                  data["amount"] as double,
                  moneySpending == 0
                      ? 0
                      : (data["amount"] as double) / moneySpending,
                ),
              );
            }).toList(),
          ),
        ));
  }
}
