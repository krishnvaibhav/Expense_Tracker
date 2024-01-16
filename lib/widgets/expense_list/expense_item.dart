import 'package:flutter/material.dart';

import '../../model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical:16),
        child: Column(
          children: [
            Text(expense.name),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('₹${expense.cost.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
