import 'package:flutter/material.dart';

void main() {
  final app = MaterialApp(
    title: 'MITE',
    theme: ThemeData(primarySwatch: Colors.purple),
    home: homeScreenWidget(),
  );

  runApp(app);
}

Widget homeScreenWidget() {
  return Scaffold(
    appBar: AppBar(
      title: Text('Summary'),
    ),
    body: bodyWidget(),
  );
}

Widget bodyWidget() {
  return Column(
    children: [
      contentWidget(),
      bottomButtonsWidget(),
    ],
  );
}

Widget contentWidget() {
  final productListWidget = Container(
    height: 100,
    color: Colors.grey,
  );
  final listWidget = ListView(
    children: [
      productListWidget,
      keyValueWidget('Subtotal', '\$3950'),
      keyValueWidget('Discount', '-\$50'),
      keyValueWidget('Shipping', '\$1.5'),
      Divider(),
      keyValueWidget('Total', '\$5000', valueColor: Colors.purple),
      Divider(),
      Text('Shipping Address'),
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                  '#123, St. 321, Sangkat #123, St. 321, Sangkat #123, St. 321, Sangkat #123, St. 321, Sangkat #123, St. 321, Sangkat'),
            ),
          ),
          Icon(
            Icons.check_circle,
            color: Colors.purple,
          )
        ],
      ),
      ListTile(
        leading: Icon(Icons.money),
        title: Text('ABA Bank'),
        subtitle: Text('012346677'),
        trailing: Icon(
          Icons.check_circle,
          color: Colors.purple,
        ),
      )
    ],
  );
  return Expanded(child: listWidget);
}

Widget bottomButtonsWidget() {
  final backButtonWidget = Expanded(
      child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: TextButton(onPressed: onBackButtonClick, child: Text('Back')),
  ));
  final buyButtonWidget = Expanded(
      child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: ElevatedButton(onPressed: onBuyButtonClick, child: Text('Buy')),
  ));
  return SafeArea(
    child: Row(
      children: [backButtonWidget, buyButtonWidget],
    ),
  );
}

void onBackButtonClick() {
  print('onBackButtonClick');
}

void onBuyButtonClick() {
  print('onBuyButtonClick');
}

Widget keyValueWidget(String key, String value, {Color valueColor}) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, color: valueColor),
        )
      ],
    ),
  );
}
