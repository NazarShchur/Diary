import 'package:course/styles/Styles.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsElement extends StatelessWidget{
  final IconData icon;
  final String text;
  final Function onTap;
  SettingsElement({@required this.icon, this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Styles.mainColor))
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Constants.SETTINGS_ELEMENT_PADDING,
            bottom: Constants.SETTINGS_ELEMENT_PADDING
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,color: Styles.mainColor,
                size: Constants.SETTINGS_ELEMENT_ICON_SIZE,
              ),
              Padding(
                padding: const EdgeInsets.only(left: Constants.SETTINGS_TEXT_PADDING),
                child: Text(
                    text,
                  style: TextStyle(
                    fontSize: Constants.SETTINGS_ELEMENT_FONT_SIZE
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}