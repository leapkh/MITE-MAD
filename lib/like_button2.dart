import 'package:flutter/material.dart';

// Widget class
class LikeButton2 extends StatelessWidget {
  bool isLike;

  LikeButton2({this.isLike = false});

  @override
  Widget build(BuildContext context) {
    print('[LikeButton] build');
    return Icon(
      isLike ? Icons.thumb_up : Icons.thumb_up_off_alt,
      size: 24,
    );
  }
}
