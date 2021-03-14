import 'package:flutter/material.dart';
import 'package:miteapp/model/product.dart';
import 'package:miteapp/screen/product_detail_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CartScreen> {
  List<Product> _products = [
    Product(1, 'Smart Home Speaker', 100,
        'https://rupp-ite.s3-ap-southeast-1.amazonaws.com/sok-sao.jpg', 2),
    Product(2, 'BackPack', 200,
        'https://rupp-ite.s3-ap-southeast-1.amazonaws.com/sok-sao.jpg', 1)
  ];

  @override
  Widget build(BuildContext context) {
    print('[CartScreen] build');
    final List<Widget> listViewItemWidgets = [];

    // Generate product list items
    final productItemWidgets = _products.map((product) {
      return _cartItemWidget(product);
    }).toList();

    // Add product list items to listview items
    listViewItemWidgets.addAll(productItemWidgets);

    // Add static items to listview items
    listViewItemWidgets.addAll([
      Divider(),
      Text(
        'Have a promo code?',
      ),
      _keyValueWidget('Subtotal', _subtotal),
      _keyValueWidget('Discount', 50),
      _keyValueWidget('Shipping', 1.5),
      Divider(),
      _keyValueWidget('total', _total),
      _buttonWidget
    ]);

    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView(
        children: listViewItemWidgets,
      ),
    );
  }

  Widget _cartItemWidget(Product product) {
// Image widget
    final imageWidget = Padding(
      padding: EdgeInsets.all(16),
      child: FadeInImage.assetNetwork(
        image: product.imageUrl,
        placeholder: 'lib/images/img_product1.png',
        width: 80,
        height: 80,
      ),
    );

    final qtyWidget = Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.grey,
      child: Row(
        children: [
          _increaseQtyButton(product.id),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Text('${product.qty}'),
          ),
          _increaseQtyButton(product.id, reversed: true)
        ],
      ),
    );

    final infoWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name),
        Padding(
          padding: EdgeInsets.only(top: 4, bottom: 8),
          child: Text(
            '\$${product.price}',
            style: TextStyle(color: Colors.orange),
          ),
        ),
        qtyWidget
      ],
    );

    return GestureDetector(
      onTap: () {
        _moveToProductDetailScreen(product);
      },
      child: Row(
        children: [imageWidget, infoWidget],
      ),
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

  Widget _increaseQtyButton(int productId, {bool reversed = false}) {
    return GestureDetector(
        onTap: () {
          _products.forEach((element) {
            if (element.id == productId) {
              setState(() {
                if (reversed) {
                  if (element.qty == 1) {
                    // Remove the product
                    _products.remove(element);
                  } else {
                    // Decrease qty
                    element.qty--;
                  }
                } else {
                  element.qty++;
                }
              });
            }
          });
        },
        child: Text(reversed ? '-' : '+'));
  }

  double get _subtotal {
    double subtotal = 0;
    _products.forEach((product) {
      subtotal += product.price * product.qty;
    });
    return subtotal;
  }

  double get _total {
    return _subtotal - 50 + 1.5;
  }

  void _moveToProductDetailScreen(Product product) {
    // Using push()
    final route =
        MaterialPageRoute(builder: (context) => ProductDetailScreen(product));
    Navigator.push(context, route);

    // Using pushNamed()
    //Navigator.pushNamed(context, '/productDetail', arguments: product);
  }
}
