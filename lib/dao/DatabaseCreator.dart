import 'dart:io';

import 'package:sqflite/sqflite.dart';

abstract class DatabaseCreator{
  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectedQueryResult, int insertAndUpdateQueryResult]){
    print(functionName);
    print(sql);
    if(selectedQueryResult != null){
      print(selectedQueryResult);
    } else if( insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createDayTable();

  Future<String> getDatabasePath(String dbName);
  Future<Database> openDB();
  Future<void> initDatabase();

}