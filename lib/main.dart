
import 'package:course/appbar/MyAppBar.dart';
import 'package:course/pages/pulse/PulsePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottomnavigation/Bottom.dart';
import 'bottomnavigation/BottomModel.dart';

void main() => runApp(ChangeNotifierProvider<BottomNavigationModel>.value(
      value: BottomNavigationModel(),
      child: Diary(),
    ));

class Diary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  List<Widget> tabs = [
    PulseCalendarPage(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BottomNavigationModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:MyAppBar(),
          body: tabs[model.currentIndex], bottomNavigationBar: Bottom()),
    );
  }
}
