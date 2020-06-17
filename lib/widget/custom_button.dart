import 'package:flutter/material.dart';

enum CustomButtonState { initial, pressed }

class CustomButton extends StatefulWidget {
  final String title;
  final Function onPressed;

  CustomButton({@required this.title, this.onPressed});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  CustomButtonState _buttonState = CustomButtonState.initial;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        print('Tap Down');
        setState(() {
          _buttonState = CustomButtonState.pressed;
        });
      },
      onTapUp: (_) {
        print('Tap Up');
        setState(() {
          _buttonState = CustomButtonState.initial;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        print('Tap Cancel');
        setState(() {
          _buttonState = CustomButtonState.initial;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _buttonState == CustomButtonState.pressed
                ? Colors.blue.withOpacity(0.5)
                : Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(18.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0.75, 1.5),
                spreadRadius: 2.0,
                blurRadius: 1.5,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .button, //TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
