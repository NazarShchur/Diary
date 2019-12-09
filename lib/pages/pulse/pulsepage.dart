import 'package:course/pages/pulse/calendar.dart';
import 'package:course/pages/pulse/pickermodel.dart';
import 'package:course/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class PulseCalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PulseCalendarPageState();
}

class _PulseCalendarPageState extends State<PulseCalendarPage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PulsePageModel>(context);
    return DefaultTabController(
        length: 12,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Styles.mainColor,
              bottom: TabBar(
                tabs: [
                  Tab(text: "січ",),
                  Tab(text: "лют",),
                  Tab(text: "бер",),
                  Tab(text: "кві",),
                  Tab(text: "тра",),
                  Tab(text: "чер",),
                  Tab(text: "лип",),
                  Tab(text: "сер",),
                  Tab(text: "вер",),
                  Tab(text: "жов",),
                  Tab(text: "лис",),
                  Tab(text: "гру",),
                ],
              ),
            ),
            body: Column(
                children: [
                  Expanded(child: Calendar()),
                  NumberPicker.integer(
                      initialValue: model.pulse(model.date) == null ? 0 : model.pulse(model.date),
                      minValue: 0,
                      maxValue: 200,
                      onChanged: (num){
                        model.setPulse(model.date, num);
                      })

                ]
            )
        ),
      );
  }

}
