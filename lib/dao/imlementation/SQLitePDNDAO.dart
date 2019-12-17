import 'package:course/dao/fields/Fields.dart';
import 'package:course/dao/interfaces/IPDNDao.dart';
import 'package:course/entity/PDN.dart';
import 'package:sqflite/sqflite.dart';

class SQLitePDNDao implements PDNDao{
  Future<Database> _db;

  SQLitePDNDao(this._db);
  @override
  Future<void> delete(PDN entity) async{
    final db = await _db;
    try{
      db.delete(Fields.PDN_TABLE, where: "${Fields.PDN_DATE} = ?", whereArgs: [entity.date.toString()]);
    } catch(e){
      print(e);
    }
  }

  @override
  Future<List<PDN>> getAll() async{
    final db = await _db;
    List<Map> maps = [];
    try{
      maps = await db.query(Fields.PDN_TABLE);
    } catch(e){
      print(e);
    }
    List<PDN> pdns = [];
    if(maps.length > 0){
      for(int i = 0; i < maps.length; i++){
        pdns.add(PDN.fromJson(maps[i]));
      }
    }
    return pdns;
  }

  @override
  Future<void> save(PDN entity) async{
    print(entity);
    var db = await _db;
    try {
      await db.rawInsert('INSERT INTO ${Fields.PDN_TABLE}'
          '(${Fields.PDN_DATE},${Fields.INDEX_PDN})'
          ' VALUES(\'${entity.date.toString()}\', ${entity.countIndexPDN()})');
      print("Saved ${entity.toString()}");
    } catch(e){
      update(entity);
      print(e.toString());
    }
  }

  @override
  Future<void> update(PDN entity) async{
    var db = await _db;
    try {
      await db.rawUpdate("UPDATE ${Fields.PDN_TABLE} SET ${Fields.INDEX_PDN} = ${entity.countIndexPDN()} WHERE ${Fields.PDN_DATE} = \'${entity.date.toString()}\'");
      print('updated $entity');
    }catch (e){
      print(e.toString());
    }
  }

}