import 'package:course/styles/Styles.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function onTap;
  SubmitButton({@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Styles.mainColor)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: Constants.CONFIRM_BUTTON_LEFT_RIGHT_PADDING,
            right: Constants.CONFIRM_BUTTON_LEFT_RIGHT_PADDING,
            top: Constants.CONFIRM_BUTTON_TOP_BOT_PADDING,
            bottom: Constants.CONFIRM_BUTTON_TOP_BOT_PADDING,
          ),
          child: Text(
            Constants.CONFIRM,
            style: TextStyle(
                color: Styles.mainColor,
                fontSize: Constants.CONFIRM_BUTTON_FONT_SIZE),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
