
import 'package:course/pages/tests/PDNPage.dart';
import 'package:course/styles/Styles.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GanchiPage.dart';

class TestsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestsPageState();
}

class _TestsPageState extends State<TestsPage> {
  List<Widget> tabs = [Tab(text: Constants.PDN), Tab(text: Constants.GENCHI),];
  List<Widget> pages = [
    PDNPage(),
    GenchiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          labelColor: Styles.mainColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Styles.mainColor,
          tabs: tabs,
        ),
        body: TabBarView(
        children: pages,
      ),
    ),);
  }
}
