import 'package:expense_tracker/Constants/colors.dart';
import 'package:expense_tracker/widgets/expense_list/expenseList.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  void _openAddExpenseOverlay (){
    showModalBottomSheet(
      context: context,
      builder: (context){
        return   const NewExpense();

      },
    );
  }

  final List<Expense> _registeredExpenses = [
    Expense(Category.food,
        cost: 180, name: 'Biriyani', date: DateTime(2023, 11, 01, 1)),
    Expense(Category.entertainment,
        cost: 206, name: 'Movie', date: DateTime(2023, 10, 21, 1)),
    Expense(Category.work,
        cost: 650, name: 'AC', date: DateTime(2023, 09, 01, 1)),
    Expense(Category.travel, cost: 350, name: 'Petrol', date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.primary,
          title: const Text(
            "Expense Tracker",
            style: TextStyle(color: MyColors.secondary),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                onPressed: () => _openAddExpenseOverlay(),
                icon: const Icon(Icons.add,size: 25,),
                style: IconButton.styleFrom(foregroundColor: MyColors.secondary),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ExpenseList(expenses: _registeredExpenses),
            ),
          ],
        ));
  }
}
