
import 'package:course/pages/appbar/MyAppBar.dart';
import 'package:course/pages/bottomnavigation/Bottom.dart';
import 'package:course/pages/bottomnavigation/BottomModel.dart';
import 'package:course/pages/pulse/PulsePage.dart';
import 'package:course/pages/schedule/SchedulePage.dart';
import 'package:course/pages/schedule/schedulePageModel.dart';
import 'package:course/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
    ChangeNotifierProvider<SchedulePageModel>.value(value: SchedulePageModel(), child: SchedulePage()),
  ];

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BottomNavigationModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:MyAppBar(),
          body: Padding(
            padding:  EdgeInsets.only(
              left: Styles.globalSidePadding,
              right: Styles.globalSidePadding
            ),
            child: tabs[model.currentIndex],
          ),
          bottomNavigationBar: Bottom()),
    );
  }
}
