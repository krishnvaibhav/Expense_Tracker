import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category {
  food,
  travel,
  work,
  entertainment,
}

const categoryIcons = {
  Category.food: (Icons.restaurant),
  Category.travel: (Icons.flight),
  Category.work: (Icons.work),
  Category.entertainment: (Icons.music_note),
};

class Expense {
  Expense(
    this.category, {
    required this.cost,
    required this.name,
    required this.date,
  }) : id = uuid.v4();

  final double cost;
  final String name;
  final DateTime date;
  final String id;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
