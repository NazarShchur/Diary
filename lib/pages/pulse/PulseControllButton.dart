import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayControlButton extends StatelessWidget {
  final Function onTap;
  final String text;

  DayControlButton(this.onTap, this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: 50, height: 50, color: Colors.red, child: Text(text)));
  }
}
