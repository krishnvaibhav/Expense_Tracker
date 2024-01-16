import 'package:expense_tracker/widgets/styled_elevated_btn.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _nameController = TextEditingController();
  final _amtController = TextEditingController();

  void _presentDatePicker (){
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 10,now.month ,now.day);
    final lastDate = DateTime(now.year + 10,now.month,now.day);
    showDatePicker(context: context,initialDate: now, firstDate: firstDate, lastDate: lastDate);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amtController.dispose();
    super.dispose();
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
                          label: Text("Amount"), prefixText: "₹ ",counterText: ''),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Select the Date"),
                        IconButton(onPressed: () => _presentDatePicker(), icon: const Icon(Icons.date_range))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StyledElevatedButton(
                        onPressed: () => print(
                            '${_nameController.text} + ${_amtController.text} '),
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
