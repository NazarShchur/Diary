import 'package:course/bottomnavigation/bottommodel.dart';
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
        color: Color.fromRGBO(239, 65, 94, model.currentIndex == index ? 1 : 0)
      ),
        child: IconButton(
          icon: Icon(icon),
          onPressed: (){
            model.setCurrentIndex(index);
          },
        ),
    );
  }
}
