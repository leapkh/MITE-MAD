import 'package:flutter/material.dart';
import 'package:miteapp/main_screen.dart';
import 'package:miteapp/screen/product_detail_screen.dart';

void main() {
  // Using push() of Navigation
  final app = MaterialApp(
    title: 'MITE App',
    home: MainScreen(),
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
  );

  // Using pushName of Navigation
  /*final app = MaterialApp(
    title: 'MITE App',
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
    routes: {
      '/': (context) => MainScreen(),
      '/productDetail': (context) => ProductDetailScreen()
    },
  );*/

  runApp(app);
}
