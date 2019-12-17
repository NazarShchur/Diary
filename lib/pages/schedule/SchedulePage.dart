import 'package:course/entity/Lesson.dart';
import 'package:course/pages/schedule/scheduleDayPicker.dart';
import 'package:course/pages/schedule/scheduleNotifyingTable.dart';
import 'package:course/pages/schedule/schedulePageModel.dart';
import 'package:course/service/scheduleParsingService.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> { //todo save map to sharedprefs
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SchedulePageModel>(context);
    return FutureBuilder<String>(
      future: ScheduleParsingService().getGroupName(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          if (model.hasPhysLessons()) {
            return ListView(
                children: <Widget>[
                  ScheduleDayPicker(model.physLessons),
                  ScheduleNotifyingTable()
                ]);
          }
          return FutureBuilder<List<Lesson>>(
            future: model.getPhysLessons(snapshot.data),
            builder: (context, snapshotB) {
              if (snapshotB.hasData) {
                return ListView(
                  children: <Widget>[
                    ScheduleDayPicker(snapshotB.data),
                    ScheduleNotifyingTable()
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        } else {
          return Center(child: Text("input group"));
        }
      },
    );

  }
}
