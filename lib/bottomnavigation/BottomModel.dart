import 'package:flutter/cupertino.dart';

class BottomNavigationModel extends ChangeNotifier{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int indexOfItem){
    _currentIndex = indexOfItem;
    notifyListeners();
  }
}