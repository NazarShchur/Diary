import 'package:course/dao/fields/Fields.dart';
import 'package:course/dao/interfaces/IDayDao.dart';
import 'package:course/entity/Day.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDayDao implements DayDao{
  Future<Database> _db;

  SQLiteDayDao(this._db);
  @override
  Future<void> delete(Day entity) async {
    var dbDay = await _db;
    try {
      dbDay.delete(
          Fields.DAY_TABLE, where: "${Fields.DATE} = ?", whereArgs: [entity.dateTime.toString()]);
      print('deleted $entity');
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Future<List<Day>> getAll() async {
    var dbDay = await _db;
    List<Map> maps = [];
    try {
       maps = await dbDay.query(
          Fields.DAY_TABLE, columns: [Fields.DATE, Fields.PULSE]);
    } catch (e) {
      print(e);
    }
      List<Day> days = [];
      if(maps.length > 0){
        for(int i = 0; i< maps.length; i++){
          days.add(Day.fromJson(maps[i]));
        }
      }
      return days;
    }

  @override
  Future<void> save(Day entity) async {
    var dbDay = await _db;
    try {
      await dbDay.rawInsert('INSERT INTO ${Fields.DAY_TABLE}(${Fields.DATE}, ${Fields.PULSE}) VALUES(\'${entity.dateTime.toString()}\', ${entity.pulse.toString()})');
      print("Saved ${entity.toString()}");
    } catch(e){
      update(entity);
      print(e.toString());
    }
  }

  @override
  Future<void> update(Day entity) async{
    var dbDay = await _db;
    try {
      // await dbDay.update(DAY_TABLE, day.toJson(), where: "$DATE = ?", whereArgs: [day.dateTime]);
      await dbDay.rawUpdate("UPDATE ${Fields.DAY_TABLE} SET ${Fields.PULSE} = ${entity.pulse} WHERE ${Fields.DATE} = \'${entity.dateTime}\'");
      print('updated $entity');
    }catch (e){
      print(e.toString());
    }
  }

}