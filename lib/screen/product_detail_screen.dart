import 'package:flutter/material.dart';

import 'package:miteapp/model/product.dart';

class ProductDetailScreen extends StatelessWidget {
  Product _product;

  ProductDetailScreen(this._product);

  @override
  Widget build(BuildContext context) {
    // Using pushNamed() of Navitator
    //Product product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Product Detail'),
        ),
        body: Center(
          child: Text(_product.name),
        ));
  }
}
