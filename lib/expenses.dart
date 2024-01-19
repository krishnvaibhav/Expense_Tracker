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
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return NewExpense(
          onAddExpense: addExpense,
        );
      },
    );
  }

  final List<Expense> _registeredExpenses = [
    Expense(Category.food,
        cost: 180, name: 'Biriyani', date: DateTime(2023, 11, 01, 1)),
    Expense(Category.food,
        cost: 206, name: 'Movie', date: DateTime(2023, 10, 21, 1)),
    Expense(Category.food,
        cost: 650, name: 'AC', date: DateTime(2023, 09, 01, 1)),
    Expense(Category.food, cost: 350, name: 'Petrol', date: DateTime.now()),
  ];

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void deleteExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: Text("Deleted Expense"),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          // backgroundColor: MyColors.primary,
          title: const Text(
            "Expense Tracker",
            // style: TextStyle(color: MyColors.secondary),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                onPressed: () => _openAddExpenseOverlay(),
                icon: const Icon(
                  Icons.add,
                  size: 25,
                ),
                // style:
                //     IconButton.styleFrom(foregroundColor: MyColors.secondary),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            _registeredExpenses.isNotEmpty
                ? Expanded(
                    child: ExpenseList(
                      expenses: _registeredExpenses,
                      onDeleteExpense: deleteExpense,
                    ),
                  )
                : const Expanded(
                    child: Center(child: Text("No Current Expenses"))),
          ],
        ));
  }
}
