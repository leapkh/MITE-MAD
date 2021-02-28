import 'package:flutter/material.dart';
import 'package:miteapp/like_button.dart';

class StartupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('[StartupScreen] build');
    return Scaffold(
      body: _body,
    );
  }

  Widget get _body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to MITE'),
          LikeButton(
            _onLikeButtonClick,
            isLike: true,
          )
        ],
      ),
    );
  }

  void _onLikeButtonClick(isLike) {
    print('Like button is click: $isLike');
  }
}
