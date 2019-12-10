import 'dart:io';

import 'package:course/dao/DatabaseCreator.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class SQLiteDB implements DatabaseCreator{
  static const dayTable = 'day';
  static const date = 'date';
  static const pulse = 'pulse';
  Database db;
  @override
  Future<void> createDayTable() async {
    final daySql = '''CREATE TABLE $dayTable
    (
    $date DATETIME PRIMARE KEY
    $pulse int
    )
    ''';
    await db.execute(daySql);
  }

  @override
  Future<String> getDatabasePath(String dbName) async{
    final databasePath = await getDatabasePath(dbName);
    final path = databasePath + dbName;
    if(await Directory(path).exists()){
      //await deleteDatabase(path);
    } else {
      await Directory(path).create(recursive: true);
    }
    return path;
  }

  @override
  Future<void> initDatabase() async{
    final path = await getDatabasePath('diary_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async{
    await createDayTable();
  }

  @override
  Future<Database> openDB()async{
    if(db == null){
      await initDatabase();
    }
    return db;
  }
}