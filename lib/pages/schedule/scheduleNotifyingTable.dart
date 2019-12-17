import 'package:course/pages/schedule/schedulePageModel.dart';
import 'package:course/styles/Styles.dart';
import 'package:course/styles/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleNotifyingTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SchedulePageModel>(context);
    if (model.physLessonsDays.keys.contains(model.selected)) {
      return Container(
        margin: EdgeInsets.only(
            top: Constants.SCHEDULE_OBJECTS_MARGIN
        ),
        decoration: BoxDecoration(
          boxShadow:[
            Styles.boxShadow
          ],
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Styles.mainColor,
              padding: const EdgeInsets.all(Constants.DATE_SCHEDULE_PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.all(Constants.DATE_SCHEDULE_PADDING),
                    child: Text(
                      model.physLessonsDays[model.selected].dayName,
                      style: TextStyle(
                          fontSize: Constants.DAY_NAME_SCHEDULE_FONT_SIZE,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(Constants.DATE_SCHEDULE_PADDING),
                    child: Text(
                      "${model.selected.day}.${model.selected.month}.${model.selected.year}",
                      style: TextStyle(
                          fontSize: Constants.DATE_SCHEDULE_FONT_SIZE,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(Constants.SCHEDULE_NAME_DATE_PADDING),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.physLessonsDays[model.selected].lessonName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Constants.LESSON_NAME_SCHEDULE_FONT_SIZE),
                    ),
                    Text(
                      "${model.physLessonsDays[model.selected].timeStart}-${model.physLessonsDays[model.selected].timeEnd}",
                      style: TextStyle(
                          color: Styles.mainColor,
                          fontSize: Constants.LESSON_TIME_FONT_SIZE),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: Constants.SCHEDULE_OBJECTS_MARGIN),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Constants.NO_PHYS_TODAY,
              style: TextStyle(
                  fontSize: Constants.NO_PHYS_FONT_SIZE, //todo центрувати
                  color: Colors.black),
            ),
          ],
        ),
      );
    }
  }
}
