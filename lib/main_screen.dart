import 'package:flutter/material.dart';
import 'package:miteapp/subscreen/account_screen.dart';
import 'package:miteapp/subscreen/cart_screen.dart';
import 'package:miteapp/subscreen/home_screen.dart';
import 'package:miteapp/subscreen/more_screen.dart';
import 'package:miteapp/subscreen/search_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MainScreen> {
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('[MainScreen] build');
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar,
      body: _body,
    );
  }

  Widget get _bottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: _currentNavIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Account'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
      onTap: _onBottomNavBarItemClick,
    );
  }

  Widget get _body {
    if (_currentNavIndex == 0) {
      return HomeScreen();
    } else if (_currentNavIndex == 1) {
      return SearchScreen();
    } else if (_currentNavIndex == 2) {
      return CartScreen();
    } else if (_currentNavIndex == 3) {
      return AccountScreen();
    } else {
      return MoreScreen();
    }
  }

  void _onBottomNavBarItemClick(int clickIndex) {
    setState(() {
      _currentNavIndex = clickIndex;
    });
  }
}
