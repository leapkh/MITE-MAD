import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miteapp/main_screen.dart';
import 'package:miteapp/products_screen.dart';
import 'package:miteapp/startup_screen2.dart';

void main() {
  runApp(app);
}

Widget get app {
  return MaterialApp(
    title: 'Bottom Navigation',
    theme: ThemeData(primarySwatch: Colors.purple),
    home: StartupScreen2(),
  );
}

Widget get homeScreen {
  return MainScreen();
}

Widget get appBar {
  return AppBar(
    title: Text('Bottom Navigation'),
  );
}

Widget get body {
  return Center(
      child: Checkbox(
    onChanged: (state) {},
    value: false,
  ));
}

Widget get bottomNavigationBar {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Group'),
      BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.facebookF), label: 'Social'),
    ],
  );
}

Widget get deliveryContentWidget {
  return Container(
    width: 100,
    height: 100,
    color: Colors.grey,
    child: Center(
      child: Text('Delivery'),
    ),
  );
}

Widget get addressContentWidget {
  return Container(
    width: 100,
    height: 100,
    color: Colors.blueAccent,
    child: Center(
      child: Text('Address'),
    ),
  );
}

Widget get paymentContentWidget {
  return Container(
    width: 100,
    height: 100,
    color: Colors.black,
    child: Center(
      child: Text('Payment'),
    ),
  );
}

void onSearchClick() {}
