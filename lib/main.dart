import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottomnavigation/bottom.dart';
import 'bottomnavigation/bottommodel.dart';

void main() => runApp(
    ChangeNotifierProvider<BottomNavigationModel>.value(
      value: BottomNavigationModel(),
      child: Diary(),
    ));

class Diary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  List<Widget> tabs = [
    Container(),
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
          body: tabs[model.currentIndex], bottomNavigationBar: Bottom()),
    );
  }
}
