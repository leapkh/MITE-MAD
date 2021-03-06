import 'package:flutter/material.dart';
import 'package:miteapp/main_screen.dart';

void main() {
  final app = MaterialApp(
    title: 'MITE App',
    home: MainScreen(),
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
  );
  runApp(app);
}
