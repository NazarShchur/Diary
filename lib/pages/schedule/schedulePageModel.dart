import 'package:course/entity/Lesson.dart';
import 'package:course/service/scheduleParsingService.dart';
import 'package:course/styles/textConsts.dart';
import 'package:flutter/cupertino.dart';

class SchedulePageModel extends ChangeNotifier{
  DateTime selected = DateTime.now();
  Map<DateTime, bool> isDateHasPhys;
  List<Lesson> physLessons;
  void setSelected(DateTime date){
      selected = date;
      notifyListeners();
  }
  Future<List<Lesson>> getPhysLessons(String groupName) async{
    List<Lesson> list = [];
    try{
      list = await ScheduleParsingService().getLessonsList(groupName);
    } catch(e){
      print(e);
    }
    physLessons = list.where((a)=>a.lessonName.contains(TextConstants.PHYS_LESSON_NAME)).toList();
    return physLessons;
  }
  bool hasPhysLessons(){
    return physLessons != null;
  }
}