import 'dart:convert';
import 'dart:core';
import 'dart:core' as prefix0;

import 'package:course/entity/Lesson.dart';
import 'package:course/styles/consts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleParsingService {
  final String ALL_LESSONS_BY_GROUP_URL =
      "http://api.rozklad.org.ua/v2/groups/group_name/lessons";

  Future<String> _getSchedule(String groupName) async {
    http.Response response;
    try {
      response = await http.get(_prepareUrl(groupName));
    } catch (e) {
      prefix0.print(response);
      print(e);
    }
    return response.body;
  }

  Future<List<Lesson>> getLessonsList() async {
    String groupName = await getGroupName();
    String json = await _getSchedule(groupName);
    dynamic resp = jsonDecode(json);
    List<dynamic> data = resp["data"];
    List<Lesson> list = data.map((a) => Lesson.fromJson(a)).toList();
    return list;
  }

  String _prepareUrl(String groupName) =>
      ALL_LESSONS_BY_GROUP_URL.replaceAll("group_name", groupName);

  Future<bool> isGroupExists(String groupName) async{
    http.Response resp = await http.get("http://api.rozklad.org.ua/v2/groups/$groupName");
    print(resp.statusCode);
    return resp.statusCode == 200;
  }

  Future<String> getGroupName() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(Constants.SHARED_PREFS_GROUP);
  }
}
