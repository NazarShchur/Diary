
class Lesson{
  int lessonId;
  int groupId;
  int dayNumber;
  String dayName;
  String lessonName;
  int lessonNumber;
  String lessonRoom;
  String lessonType;
  String teacherName;
  int lessonWeek;
  String timeStart;
  String timeEnd;


  Lesson({this.lessonId, this.groupId, this.dayNumber, this.dayName,
      this.lessonName, this.lessonNumber, this.lessonRoom, this.lessonType,
      this.teacherName, this.lessonWeek, this.timeStart, this.timeEnd});

  factory Lesson.fromJson(Map<String, dynamic> json){
    return Lesson(
      lessonId: int.parse(json["lesson_id"]),
      groupId: int.parse(json["group_id"]),
      dayNumber: int.parse(json["day_number"]),
      dayName: json["day_name"],
      lessonName: json["lesson_name"],
      lessonNumber: int.parse(json["lesson_number"]),
      lessonRoom: json["lesson_room"],
      lessonType: json["lesson_type"],
      lessonWeek: int.parse(json["lesson_week"]),
      teacherName: json["teacher_name"],
      timeEnd: json["time_end"],
      timeStart: json["time_start"]
    );
  }

  @override
  String toString() {
    return '{$lessonName}\n';
  }


}