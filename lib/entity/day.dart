
import 'package:course/dao/test.dart';

class Day{
  int pulse;
  DateTime dateTime;
  Day({this.pulse, this.dateTime});
  factory Day.fromJson(Map<String, dynamic> json) => Day(
    pulse: json[DBHelper.PULSE],
    dateTime: DateTime.tryParse(json[DBHelper.DATE])
  );

  String get dateString{
    return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  }

  Map<String, dynamic> toJson() => {
    'pulse' : pulse,
    'date' : dateTime
  };

  @override
  String toString() {
    return 'Day{pulse: $pulse, dateTime: $dateTime}';
  }


}