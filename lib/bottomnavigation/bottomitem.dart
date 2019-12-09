import 'package:course/bottomnavigation/bottommodel.dart';
import 'package:course/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomItem extends StatelessWidget {
  final IconData icon;
  final int index;

  BottomItem({this.icon, this.index});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BottomNavigationModel>(context);
    return Container(
      decoration: BoxDecoration(
          color: model.currentIndex == index ? Styles.mainColor : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(35),
            topLeft: Radius.circular(35),
          )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Styles.mainColor,
          iconSize: 40,
          icon: Icon(
            icon,
          ),
          onPressed: () {
            model.setCurrentIndex(index);
          },
        ),
      ),
    );
  }
}
