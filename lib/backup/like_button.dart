import 'package:flutter/material.dart';

// Widget class
class LikeButton extends StatefulWidget {
  bool isLike;
  void Function(bool) onClickListener;

  LikeButton(this.onClickListener, {this.isLike = false});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

// State class
class _State extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    print('[LikeButton] build');
    return GestureDetector(
      onTap: _onLikeButtonClick,
      child: Icon(
        widget.isLike ? Icons.thumb_up : Icons.thumb_up_off_alt,
        size: 24,
      ),
    );
  }

  void _onLikeButtonClick() {
    setState(() {
      widget.isLike = !widget.isLike;
    });
    widget.onClickListener(widget.isLike);
  }
}
