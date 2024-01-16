import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  travel,
  work,
  entertainment,
}

class Expense {
  Expense(this.category,
      {required this.cost,
      required this.name,
      required this.date,
      })
  : id = uuid.v4()
  ;

  final double cost;
  final String name;
  final DateTime date;
  final String id;
  final Category category;

}
