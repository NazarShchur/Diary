import 'package:course/entity/Lesson.dart';
import 'package:course/pages/schedule/scheduleDayPicker.dart';
import 'package:course/pages/schedule/scheduleNotifyingTable.dart';
import 'package:course/pages/schedule/schedulePageModel.dart';
import 'package:course/service/scheduleParsingService.dart';
import 'package:course/styles/textConsts.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SchedulePageModel>(context);
    if (model.hasPhysLessons()) {
      return ListView(children: <Widget>[
        ScheduleDayPicker(model.physLessons),
        ScheduleNotifyingTable()
      ]);
    }
    return FutureBuilder<List<Lesson>>(
      future: model.getPhysLessons(("ТЯ-81")),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: <Widget>[
              ScheduleDayPicker(snapshot.data),
              ScheduleNotifyingTable()
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
