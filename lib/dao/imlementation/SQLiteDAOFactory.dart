import 'package:course/dao/DAOFactory.dart';
import 'package:course/dao/imlementation/DatabaseProvider.dart';
import 'package:course/dao/imlementation/SQLiteDayDAO.dart';
import 'package:course/dao/interfaces/GenchiDAO.dart';
import 'package:course/dao/interfaces/IDayDao.dart';
import 'package:sqflite/sqflite.dart';

import 'SQLiteGenchiDAO.dart';
import 'SQLitePDNDAO.dart';

class SQLiteDaoFactory extends DaoFactory {
  DatabaseProvider _provider = DatabaseProvider();

  @override
  DayDao createDayDao() {
    return SQLiteDayDao(getDatabase());
  }


  Future<Database> getDatabase() {
    try {
      return _provider.db;
    } catch (e) {
      print(e);
    }
  }

  @override
  createPDNDao() {
    return SQLitePDNDao(getDatabase());
  }

  @override
  GenchiDAO createGenchiDao() {
    return SQLiteGenchiDAO(getDatabase());
  }
}
