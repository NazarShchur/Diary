import 'package:course/dao/fields/Fields.dart';

class Genchi{
  int breathLessTime;
  DateTime date;
  Genchi({this.date, this.breathLessTime});

  factory Genchi.fromJson(Map<String, dynamic> json){
    return Genchi(
      breathLessTime: json[Fields.BREATH_LESS_TIME],
      date: DateTime.tryParse(json[Fields.GENCHI_DATE]),
    );
  }

  String get dateString{
    return "${date.year}-${date.month}-${date.day}";
  }

  @override
  String toString() {
    return 'Genchi{breathLessTime: $breathLessTime, date: $date}';
  }


}