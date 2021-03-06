import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CartScreen> {
  int _productQty = 2;

  @override
  Widget build(BuildContext context) {
    print('[CartScreen] build');
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView(
        children: [
          _cartItemWidget('Smart Home Speaker', 1100, _productQty,
              'lib/images/img_product1.png'),
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
          _buttonWidget
        ],
      ),
    );
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
          _increaseQtyButton,
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

  Widget get _buttonWidget {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: onCheckOutButtonClick, child: Text('CHECKOUT')),
    );
  }

  void onCheckOutButtonClick() {
    print('You click checkout!');
  }

  Widget get _increaseQtyButton {
    return GestureDetector(onTap: _onIncreaseQtyClick, child: Text('+'));
  }

  void _onIncreaseQtyClick() {
    setState(() {
      _productQty++;
    });
  }
}
