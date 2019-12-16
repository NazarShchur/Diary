import 'package:course/entity/Lesson.dart';
import 'package:course/pages/schedule/schedulePageModel.dart';
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
    return dp.DayPicker(
      datePickerStyles: dp.DatePickerRangeStyles(
          selectedSingleDateDecoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.blue)),
      eventDecorationBuilder: (date) {
        return dp.EventDecoration(
            boxDecoration: BoxDecoration(
              color: physLessons
                          .where((a) => a.dayNumber == date.weekday)
                          .toList()
                          .length ==
                      0
                  ? Colors.white
                  : Colors.green,
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
    );
  }
}
