import 'package:course/dao/DatabaseCreator.dart';
import 'package:course/entity/day.dart';

class DayDao{
  final DatabaseCreator databaseCreator;
  DayDao(this.databaseCreator);
  static DayDao dao;

  add(Day day) async {
    final db = await databaseCreator.openDB();
    var res = await db.insert('Day', day.toJson());
    return res;
  }

  get(DateTime date) async{
    final db = await databaseCreator.openDB();
    var res = await db.query("Day", where: "date = ?", whereArgs: [date]);
    res.isNotEmpty ? Day.fromJson(res.first) : null;
  }

  Future <List<Day>> getAll() async {
    final db = await databaseCreator.openDB();
    var res = await db.query("Day");
    return res.isNotEmpty ? res.map((d)=> Day.fromJson(d)).toList() : [];
  }
}