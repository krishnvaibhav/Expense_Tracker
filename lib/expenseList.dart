import 'package:flutter/material.dart';

import 'model/expense.dart';

class ExpenseList extends StatelessWidget {
   const ExpenseList({required this.expenses ,super.key});
   final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {

        Expense expense = expenses[index];
        String expenseInfo =
            '${expense.name} - ${expense.cost} - ${expense.date} - ${expense.category}';

        // Display the information in a Text widget
        return Text(expenseInfo);
      },
      itemCount: expenses.length,
    );
  }
}
