import 'package:course/dao/daydao.dart';
import 'package:course/dao/sqllitedb.dart';
import 'package:course/entity/day.dart';
import 'package:course/pages/pulse/pickermodel.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
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
          NumberPicker picker = NumberPicker.integer(
              initialValue: model.pulse(model.date) ?? 0,
              minValue: 0,
              maxValue: 200,
              onChanged: (num) {
                model.setPulse(model.date, num);
              });
          return Column(
            children: <Widget>[
              Center(
                child: dp.DayPicker(
                  datePickerStyles: dp.DatePickerRangeStyles(
                    defaultDateTextStyle: TextStyle(color: Colors.white),
                    currentDateStyle: TextStyle(color: Colors.white),
                  ),
                  eventDecorationBuilder: (DateTime date) => dp.EventDecoration(
                      boxDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                          model.pulse(date) == null ? Colors.red : Colors.green)),
                  selectableDayPredicate: (DateTime date) =>
                  !date.isAfter(DateTime.now()),
                  selectedDate: model.date,
                  onChanged: (date) {
                    model.setDate(date);
                    picker.animateInt(model.pulse(date) ?? 0);
                  },
                  firstDate: DateTime(2019, 1, 1),
                  lastDate: DateTime(2019, 12, 31),
                ),
              ),
              picker,
            ],
          );
  }
}
