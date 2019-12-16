import 'package:course/dao/imlementation/SQLiteDAOFactory.dart';
import 'package:course/dao/interfaces/IDayDao.dart';
import 'package:course/entity/Lesson.dart';

abstract class DaoFactory{
  static DaoFactory _daoFactory;

  DayDao createDayDao();

  static DaoFactory getInstance(){
    if(_daoFactory == null){
      _daoFactory = SQLiteDaoFactory();
    }
    return _daoFactory;
  }
}