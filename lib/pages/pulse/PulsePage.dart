import 'dart:async';
import 'package:course/dao/DAOFactory.dart';
import 'package:course/dao/interfaces/IDayDao.dart';
import 'package:course/entity/Day.dart';
import 'package:course/pages/pulse/PulseControllButton.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PulseCalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PulseCalendarPageState();
}

class _PulseCalendarPageState extends State<PulseCalendarPage> {
  DayDao dao = DaoFactory.getInstance().createDayDao();
  Future<Map<DateTime, int>> futureMap;
  DateTime currentDate;
  int currentInt = 0;
  Map<DateTime, int> currentMap;
  Map<DateTime, int> map;
  Future<Map<DateTime, int>> getMap() async{
    List<Day> days = await dao.getAll();
    Map<DateTime, int> map = {};
    days.forEach((d) => map[d.dateTime] = d.pulse);
    return map;
  }
  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    futureMap = getMap();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<DateTime, int>>(
        future: futureMap,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            map = map ?? {...snapshot.data};
            currentMap = currentMap ?? {...snapshot.data};
            NumberPicker picker = NumberPicker.integer(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
                initialValue: map[currentDate] ?? 0,
                minValue: 0,
                maxValue: 200,
                onChanged: (num) {
                  setState(() {
                    currentInt = num;
                    map[currentDate] = num;
                  });
                });
            return ListView(
              children: <Widget>[
                Container(
                  child: dp.DayPicker(
                    datePickerStyles: dp.DatePickerRangeStyles(
                        defaultDateTextStyle: TextStyle(color: Colors.white),
                        currentDateStyle: TextStyle(color: Colors.white),
                        selectedSingleDateDecoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue)),
                    eventDecorationBuilder: (DateTime date) =>
                        dp.EventDecoration(
                            boxDecoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentMap[date] == null
                                    ? Colors.red
                                    : Colors.green)),
                    selectableDayPredicate: (DateTime date) =>
                        !date.isAfter(DateTime.now()),
                    selectedDate: currentDate,
                    onChanged: (date) {
                      setState(() {
                        currentDate = date;
                      });
                      picker.animateInt(currentMap[date] ?? 0);
                    },
                    firstDate: DateTime(2019, 9, 1),//todo user input
                    lastDate: DateTime(2020, 5, 31),
                  ),
                ),
                picker,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DayControlButton(_onTapCreate, "CREATE/UPDATE"),
                    DayControlButton(_onTapDelete, "DELETE")
                  ],
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  void _onTapDelete(){
    dao.delete(Day(
        pulse: map[currentDate], dateTime: currentDate));
    currentMap.remove(currentDate);
  }
  void _onTapCreate(){
    dao.save(Day(
        pulse: currentInt, dateTime: currentDate));
    currentMap[currentDate] = currentInt;
  }
}

