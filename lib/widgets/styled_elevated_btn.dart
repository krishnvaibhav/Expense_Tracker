import 'package:expense_tracker/Constants/colors.dart';
import 'package:flutter/material.dart';

class StyledElevatedButton extends StatelessWidget {
  const StyledElevatedButton(
      {required this.onPressed, required this.label, required this.primary})
      : super(key: const Key('StyledElevatedButton'));

  final VoidCallback onPressed;
  final String label;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // backgroundColor: primary? MyColors.primary : MyColors.secondary,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        // style:
        // TextStyle(color: primary ? MyColors.secondary : MyColors.primary),
      ),
    );
  }
}
