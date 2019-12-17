import 'package:course/dao/imlementation/SQLiteDAOFactory.dart';
import 'package:course/dao/interfaces/GenchiDAO.dart';
import 'package:course/dao/interfaces/IDayDao.dart';
import 'package:course/entity/Lesson.dart';

import 'interfaces/IPDNDao.dart';

abstract class DaoFactory{
  static DaoFactory _daoFactory;

  DayDao createDayDao();
  PDNDao createPDNDao();
  GenchiDAO createGenchiDao();
  static DaoFactory getInstance(){
    if(_daoFactory == null){
      _daoFactory = SQLiteDaoFactory();
    }
    return _daoFactory;
  }
}