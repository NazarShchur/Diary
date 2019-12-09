import 'package:course/bottomnavigation/bottomitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:course/presentation/my_flutter_app_icons.dart' as CustomIcons;
class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(239, 65, 94, 1),
            width: 10
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}
