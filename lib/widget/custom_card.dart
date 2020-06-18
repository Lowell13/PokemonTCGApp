import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Widget viewCard;
  final Function onPressed;

  CustomCard({this.viewCard, this.onPressed});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {},
      onTapUp: (_) {
        widget.onPressed();
      },
      onTapCancel: () {},
      child: widget.viewCard,
    );
  }
}
