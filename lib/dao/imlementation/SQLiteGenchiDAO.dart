import 'package:course/dao/fields/Fields.dart';
import 'package:course/dao/interfaces/GenchiDAO.dart';
import 'package:course/entity/Genchi.dart';
import 'package:sqflite/sqlite_api.dart';

class SQLiteGenchiDAO implements GenchiDAO{

  SQLiteGenchiDAO(this._db);

  Future<Database> _db;

  @override
  Future<void> delete(Genchi entity) {
    // TODO: implement delete
    return null;
  }

  @override
  Future<List<Genchi>> getAll() async{
    var db = await _db;
    List<Map> maps = [];
    try {
      maps = await db.query(
          Fields.GENCHI_TABLE);
    } catch (e) {
      print(e);
    }
    List<Genchi> days = [];
    if(maps.length > 0){
      for(int i = 0; i< maps.length; i++){
        days.add(Genchi.fromJson(maps[i]));
      }
    }
    return days;
  }

  @override
  Future<void> save(Genchi entity) async{
    var db = await _db;
    try {
      await db.rawInsert('INSERT INTO ${Fields.GENCHI_TABLE}(${Fields.GENCHI_DATE}, ${Fields.BREATH_LESS_TIME}) VALUES(\'${entity.date.toString()}\', ${entity.breathLessTime.toString()})');
      print("Saved ${entity.toString()}");
    } catch(e){
      update(entity);
      print(e.toString());
    }
  }

  @override
  Future<void> update(Genchi entity) async{
    var db = await _db;
    try {
      await db.rawUpdate("UPDATE ${Fields.GENCHI_TABLE} SET ${Fields.BREATH_LESS_TIME} = ${entity.breathLessTime} WHERE ${Fields.GENCHI_DATE} = \'${entity.date}\'");
      print('updated $entity');
    }catch (e){
      print(e.toString());
    }
  }
}