import 'package:course/dao/fields/Fields.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
class DatabaseProvider{
  static Database _db;

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDB();
    return _db;
  }
  initDB()async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, Fields.DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
  Future<void>_onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE ${Fields.GENCHI_TABLE} (${Fields.GENCHI_DATE} TEXT PRIMARY KEY, ${Fields.BREATH_LESS_TIME} INTEGER)");
    await db.execute("CREATE TABLE ${Fields.PDN_TABLE} (${Fields.PDN_DATE} TEXT PRIMARY KEY, ${Fields.INDEX_PDN} INTEGER)");
    await db.execute("CREATE TABLE ${Fields.DAY_TABLE} (${Fields.DATE} TEXT PRIMARY KEY, ${Fields.PULSE} INTEGER)");
  }
}