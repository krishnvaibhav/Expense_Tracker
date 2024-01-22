import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var kColorScheme =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 97, 59, 181));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData().copyWith(
        //     useMaterial3: true,
        //     colorScheme: kColorScheme,
        //     appBarTheme: const AppBarTheme().copyWith(
        //         backgroundColor: kColorScheme.onPrimaryContainer,
        //         foregroundColor: kColorScheme.primaryContainer),
        //     cardTheme: const CardTheme().copyWith(
        //         color: kColorScheme.secondaryContainer,
        //         margin:
        //             const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
        //     elevatedButtonTheme: ElevatedButtonThemeData(
        //         style: ElevatedButton.styleFrom(
        //             backgroundColor: kColorScheme.primaryContainer)),
        //     textTheme: ThemeData().textTheme.copyWith(
        //         titleLarge: TextStyle(
        //             fontWeight: FontWeight.normal,
        //             color: kColorScheme.onSecondaryContainer,
        //             fontSize: 18))),
        theme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const Expenses());
  }
}
