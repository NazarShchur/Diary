
import 'package:course/dao/DatabaseCreator.dart';
import 'package:course/dao/sqllitedb.dart';

class Day{
  int pulse;
  DateTime dateTime;
  Day({this.pulse, this.dateTime});
  factory Day.fromJson(Map<String, dynamic> json) => Day(
    pulse: json[SQLiteDB.pulse],
    dateTime: json[SQLiteDB.date]
  );

  Map<String, dynamic> toJson() => {
    'pulse' : pulse,
    'date' : dateTime
  };

}