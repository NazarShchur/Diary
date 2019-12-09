import 'package:course/pages/pulse/day.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: List<Widget>.generate(12, (index){
          return GridView.count(
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            crossAxisCount: 7,
            children: List.generate(index%2 == 0 ? 30 : 31, (ind){
              return Day(DateTime(DateTime.now().year, index + 1, ind + 1));
            }),
          );
        })
    );
  }

}