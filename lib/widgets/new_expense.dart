import 'dart:math';

import 'package:expense_tracker/model/expense.dart' as model;
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/styled_elevated_btn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _nameController = TextEditingController();
  final _amtController = TextEditingController();
  DateTime? selectedDate;
  model.Category selectedCategory = model.Category.travel;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 10, now.month, now.day);
    final lastDate = DateTime(now.year + 10, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void sumbitExpenseData() {
    final enteredAmount = double.tryParse(_amtController.text);

    final amountIsInValid = enteredAmount == null || enteredAmount <= 0;

    if (_nameController.text.trim().isEmpty ||
        amountIsInValid ||
        selectedDate == null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text(
                    "Please make sure a valid Date, Amount and Category was entered"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Okay"))
                ],
              ));
      return;
    }
    final expenseData = Expense(selectedCategory,
        cost: enteredAmount, name: _nameController.text, date: selectedDate!);
    widget.onAddExpense(expenseData);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amtController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text('Add Expense', style: TextStyle(fontSize: 20))),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  label: Text("Title"),
                ),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amtController,
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      decoration: const InputDecoration(
                          label: Text("Amount"),
                          prefixText: "₹ ",
                          counterText: ''),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(selectedDate == null
                            ? "No Date Selected"
                            : model.formatter.format(selectedDate!)),
                        IconButton(
                            onPressed: () => _presentDatePicker(),
                            icon: const Icon(Icons.date_range))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: selectedCategory,
                    items: model.Category.values
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name.toUpperCase()),
                            ))
                        .toList(),
                    onChanged: (category) {
                      if (selectedCategory != null) {
                        setState(() {
                          selectedCategory = category!;
                        });
                      }
                    },
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StyledElevatedButton(
                        onPressed: () {
                          sumbitExpenseData();
                        },
                        label: "Add",
                        primary: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StyledElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        label: "Cancel",
                        primary: false),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
