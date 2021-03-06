import 'package:flutter/material.dart';
import 'like_button2.dart';

class StartupScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<StartupScreen2> {
  bool _isLike = false;

  @override
  Widget build(BuildContext context) {
    print('[StartupScreen] build');
    return Scaffold(
      body: _body,
    );
  }

  Widget get _body {
    final likeButton = GestureDetector(
      onTap: _onLikeButtonClick,
      child: LikeButton2(
        isLike: _isLike,
      ),
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Welcome to MITE'), likeButton],
      ),
    );
  }

  void _onLikeButtonClick() {
    setState(() {
      _isLike = !_isLike;
    });
  }
}
