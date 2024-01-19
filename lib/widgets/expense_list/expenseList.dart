import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import "package:flutter_slidable/flutter_slidable.dart";

import '../../model/expense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(
      {required this.expenses, super.key, required this.onDeleteExpense});
  final List<Expense> expenses;

  final void Function(Expense expense) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    onPressed: (ctx) {
                      print(ctx);
                      onDeleteExpense(expenses[index]);
                    },
                    icon: (Icons.delete),
                    backgroundColor: Colors.red.shade300,
                  )
                ],
              ),
              child: ExpenseItem(expense: expenses[index]));
        },
        itemCount: expenses.length,
      ),
    );
  }
}
