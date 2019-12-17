import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationModel extends ChangeNotifier {
  int _currentIndex = 0;
  int _previousIndex = 0;
  int get currentIndex => _currentIndex;
  IconButton button;

  IconButton _settingsButton () => IconButton(
    icon: Icon(Icons.settings),
    onPressed: () {
      setCurrentIndex(4);
    },
  );

  IconButton _backButton()=>IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: (){
      setCurrentIndex(_previousIndex);
    },
  );

  NavigationModel(){
    button = _settingsButton();
  }
  void setCurrentIndex(int indexOfItem) {
    button = indexOfItem > 3 ? _backButton() : _settingsButton();
    _previousIndex = _currentIndex;
    _currentIndex = indexOfItem;
    notifyListeners();
  }
  void setButton(IconButton button){
    this.button = button;
    notifyListeners();
  }
}
