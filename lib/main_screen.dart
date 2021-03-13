import 'package:flutter/material.dart';
import 'package:miteapp/subscreen/account_screen.dart';
import 'package:miteapp/subscreen/cart_screen.dart';
import 'package:miteapp/subscreen/home_screen.dart';
import 'package:miteapp/subscreen/more_screen.dart';
import 'package:miteapp/subscreen/search_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MainScreen> {
  int _navBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('[MainScreen] build()');
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _body() {
    Widget bodyWidget;
    if (_navBarIndex == 0) {
      bodyWidget = HomeScreen();
    } else if (_navBarIndex == 1) {
      bodyWidget = SearchScreen();
    } else if (_navBarIndex == 2) {
      bodyWidget = CartScreen();
    } else if (_navBarIndex == 3) {
      bodyWidget = AccountScreen();
    } else {
      bodyWidget = MoreScreen();
    }
    return bodyWidget;
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _navBarIndex,
        onTap: _onBottomNavBarClick,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More')
        ]);
  }

  void _onBottomNavBarClick(int index) {
    print('You click on item: $index');

    setState(() {
      _navBarIndex = index;
    });
  }
}
