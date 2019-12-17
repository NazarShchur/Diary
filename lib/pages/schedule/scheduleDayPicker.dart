import 'package:course/entity/Lesson.dart';
import 'package:course/pages/schedule/schedulePageModel.dart';
import 'package:course/styles/Styles.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:provider/provider.dart';

class ScheduleDayPicker extends StatelessWidget {
  final List<Lesson> physLessons;
  ScheduleDayPicker(this.physLessons);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SchedulePageModel>(context);
    return Container(
      margin: EdgeInsets.only(
        top: Constants.SCHEDULE_OBJECTS_MARGIN
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          Styles.boxShadow
        ]
      ),
      child: dp.DayPicker(
        datePickerStyles: dp.DatePickerRangeStyles(
            selectedSingleDateDecoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue)),
        eventDecorationBuilder: (date) {
          Lesson current = physLessons
              .firstWhere((a) => a.dayNumber == date.weekday, orElse: ()=>null);
          if(current != null){
            model.addPhysLessonDay(date, current);
          }
          return dp.EventDecoration(
              boxDecoration: BoxDecoration(
                color: model.physLessonsDays.keys.contains(date)
                    ? Colors.green
                    : Colors.white,
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
              ),
              textStyle: TextStyle(
                  color: physLessons
                              .where((a) => a.dayNumber == date.weekday)
                              .toList()
                              .length ==
                          0
                      ? Colors.black
                      : Colors.white));
        },
        firstDate: DateTime(2019, 9, 1),
        onChanged: (DateTime value) {
          model.setSelected(value);
        },
        lastDate: DateTime(2020, 5, 31),
        selectedDate: model.selected,
      ),
    );
  }
}
