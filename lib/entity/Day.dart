
import 'package:course/dao/fields/Fields.dart';

class Day{
  int pulse;
  DateTime dateTime;
  Day({this.pulse, this.dateTime});
  factory Day.fromJson(Map<String, dynamic> json) => Day(
    pulse: json[Fields.PULSE],
    dateTime: DateTime.tryParse(json[Fields.DATE])
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