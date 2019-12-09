import 'package:course/bottomnavigation/bottomitem.dart';
import 'package:course/bottomnavigation/bottommodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
            icon: FontAwesomeIcons.heartbeat
          ),
          BottomItem(
            index: 1,
            icon: FontAwesomeIcons.clipboard,
          ),
          BottomItem(
            index: 2,
            icon: Icons.change_history,
          ),
          BottomItem(
            index: 3,
            icon: Icons.account_circle,
          )
        ],
      ),
    );
  }
}
