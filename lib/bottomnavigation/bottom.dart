import 'package:course/bottomnavigation/bottomitem.dart';
import 'package:course/bottomnavigation/bottommodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BottomItem(
          index: 0,
          icon: Icons.account_circle,
        ),
        BottomItem(
          index: 1,
          icon: Icons.account_circle,
        ),
        BottomItem(
          index: 2,
          icon: Icons.account_circle,
        ),
        BottomItem(
          index: 3,
          icon: Icons.account_circle,
        )
      ],
    );
  }
}
