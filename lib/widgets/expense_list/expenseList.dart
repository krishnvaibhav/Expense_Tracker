import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../../model/expense.dart';

class ExpenseList extends StatelessWidget {
   const ExpenseList({required this.expenses ,super.key});
   final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(

        itemBuilder: (context, index) {
          // Display the information in a Text widget
          return ExpenseItem(expense: expenses[index]);
        },
        itemCount: expenses.length,
      ),
    );
  }
}
