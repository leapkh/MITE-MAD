import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ProductsScreen> {
  bool _isLike = false;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(body: _body());
  }

  Widget _body() {
    final iconData = _isLike ? Icons.thumb_up_alt : Icons.thumb_up_off_alt;
    return Center(
      child: GestureDetector(
        onTap: _onLikeButtonClick,
        child: Icon(
          iconData,
          size: 256,
        ),
      ),
    );
  }

  void _onLikeButtonClick() {
    print('You click me');
    setState(() {
      _isLike = !_isLike;
    });
  }
}
