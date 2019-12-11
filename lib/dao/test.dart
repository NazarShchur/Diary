import 'dart:io' as io;
import 'dart:async';
import 'package:course/entity/day.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper{
  static Database _db;
  static const String DAY_TABLE = 'Day';
  static const String DATE = "date";
  static const String PULSE = "pulse";
  static const String DB_NAME = "diary.db";

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDB();
    return _db;
  }
  initDB()async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate:  _onCreate);
    return db;
  }
  _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE $DAY_TABLE ($DATE TEXT PRIMARY KEY, $PULSE INTEGER)");
  }

  Future<void> save(Day day) async{
    var dbDay = await db;
    try {
      //await dbDay.insert(DAY_TABLE, day.toJson());
      await dbDay.rawInsert('INSERT INTO $DAY_TABLE($DATE, $PULSE) VALUES(\'${day.dateTime.toString()}\', ${day.pulse.toString()})');
      print("Saved ${day.toString()}");
    } catch(e){
      updateDay(day);
      print(e.toString());
    }
  }

  Future<List<Day>> getAllDays() async{
    var dbDay = await db;
    List<Map> maps = await dbDay.query(DAY_TABLE, columns: [DATE, PULSE]);
    List<Day> days = [];
    if(maps.length > 0){
      for(int i = 0; i< maps.length; i++){
        days.add(Day.fromJson(maps[i]));
      }
    }
    print(days);
    return days;
  }

  Future<void> updateDay(Day day) async{
      var dbDay = await db;
      try {
       // await dbDay.update(DAY_TABLE, day.toJson(), where: "$DATE = ?", whereArgs: [day.dateTime]);
        await dbDay.rawUpdate("UPDATE $DAY_TABLE SET $PULSE = ${day.pulse} WHERE $DATE = \'${day.dateTime}\'");
        print('updated $day');
      }catch (e){
        print(e.toString());
      }
  }

  Future<void> deleteDay(Day day) async{
    var dbDay = await db;
    try {
      dbDay.delete(
          DAY_TABLE, where: "$DATE = ?", whereArgs: [day.dateTime.toString()]);
    }catch(e){
      print(e.toString());
    }
  }

  Future close() async{
    var dbDay = await db;
    dbDay.close();
  }
}