import 'package:course/bottomnavigation/BottomItem.dart';
import 'package:course/styles/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:course/presentation/my_flutter_app_icons.dart' as CustomIcons;
class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Styles.mainColor,
            width: 10
          )
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: Styles.globalSidePadding,
          right: Styles.globalSidePadding
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomItem(
              index: 0,
              icon: CustomIcons.MyFlutterApp.heart
            ),
            BottomItem(
              index: 1,
              icon: CustomIcons.MyFlutterApp.clipboards
            ),
            BottomItem(
              index: 2,
              icon: CustomIcons.MyFlutterApp.gym,
            ),
            BottomItem(
              index: 3,
              icon: CustomIcons.MyFlutterApp.ruler,
            )
          ],
        ),
      ),
    );
  }
}
