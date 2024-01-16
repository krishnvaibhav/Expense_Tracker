import 'package:expense_tracker/expenseList.dart';
import 'package:flutter/material.dart';

import 'model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(Category.food, cost: 180, name: 'Biriyani', date: DateTime(2023,11, 1, 1)),
    Expense(Category.entertainment, cost: 206, name: 'Movie', date: DateTime(2023,10, 21, 1)),
    Expense(Category.work, cost: 650, name: 'AC', date: DateTime(2023,09, 1, 1)),
    Expense(Category.travel, cost: 350, name: 'Petrol', date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions:  [Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
        )],
      ),
      body:
          Column(
            children: [
              Expanded(
                child: ExpenseList(expenses: registeredExpenses),
              ),
            ],
          )
    );
  }
}


