
import 'package:course/styles/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Settings.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Styles.mainColor,

      title: Text(
          "My Journal",
      ),
      actions: [
            SettingsButton()
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 57);

}