import 'dart:convert';
import 'dart:core';
import 'dart:core' as prefix0;

import 'package:course/entity/Lesson.dart';
import 'package:http/http.dart' as http;

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

  Future<List<Lesson>> getLessonsList(String groupName) async {
    String json = await _getSchedule(groupName);
    dynamic resp = jsonDecode(json);
    print(resp["data"].runtimeType);
    List<dynamic> data = resp["data"];
    List<Lesson> list = data.map((a) => Lesson.fromJson(a)).toList();

    return list;
  }

  String _prepareUrl(String groupName) =>
      ALL_LESSONS_BY_GROUP_URL.replaceAll("group_name", groupName);
}
