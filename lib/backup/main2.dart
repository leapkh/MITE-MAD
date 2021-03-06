import 'package:flutter/material.dart';

void main() {
  final buttonWidget = Align(
    alignment: Alignment.centerRight,
    child: ElevatedButton(
        onPressed: onCheckOutButtonClick, child: Text('CHECKOUT')),
  );
  /*final buttonWidget = ElevatedButton(onPressed: () {
    print('You click checkout!');
  }, child: null);*/

  // Create body for home screen
  final body = Padding(
    padding: EdgeInsets.all(8),
    child: ListView(
      children: [
        _cartItemWidget(
            'Smart Home Speaker', 1100, 2, 'lib/images/img_product1.png'),
        _cartItemWidget('BackPack', 210, 2, 'lib/images/img_product2.png'),
        Divider(),
        Text(
          'Have a promo code?',
        ),
        _keyValueWidget('Subtotal', 3950),
        _keyValueWidget('Discount', 50),
        _keyValueWidget('Shipping', 1.5),
        Divider(),
        _keyValueWidget('total', 5000),
        buttonWidget
      ],
    ),
  );

  // Create a home screen
  final homeScreen = Scaffold(
    body: body,
  );

  // Create an application
  final app = MaterialApp(
    title: 'Mite App',
    home: homeScreen,
    theme: ThemeData(primarySwatch: Colors.purple),
  );

  // Run the app
  runApp(app);
}

Widget _cartItemWidget(String title, int price, int qty, String imagePath) {
// Image widget
  final imageWidget = Padding(
    padding: EdgeInsets.all(16),
    child: Image.asset(
      imagePath,
      width: 80,
      height: 80,
    ),
  );

  final qtyWidget = Container(
    padding: EdgeInsets.symmetric(horizontal: 8),
    color: Colors.grey,
    child: Row(
      children: [
        Text('+'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Text('$qty'),
        ),
        Text('-')
      ],
    ),
  );

  final infoWidget = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title),
      Padding(
        padding: EdgeInsets.only(top: 4, bottom: 8),
        child: Text(
          '\$$price',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      qtyWidget
    ],
  );

  return Row(
    children: [imageWidget, infoWidget],
  );
}

Widget _keyValueWidget(String key, double value) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key),
        Text(
          '\$$value',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

void onCheckOutButtonClick() {
  print('You click checkout!');
}
