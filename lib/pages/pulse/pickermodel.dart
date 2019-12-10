import 'package:flutter/cupertino.dart';

class PulsePageModel extends ChangeNotifier{
  DateTime _date = DateTime.now();
  DateTime get date => _date;
  Map<DateTime, int> _pulses = new Map();
  int currentPicker = 0;

  void setCurrentPicker(int i){
    currentPicker = i;
    notifyListeners();
  }
  int pulse(DateTime dateTime){
    return _pulses[dateTime];
  }
  void setPulse(DateTime dateTime, int pulse){
    _pulses[dateTime] = pulse;
    notifyListeners();
  }
  void setDate(DateTime date){
    _date = date;
    notifyListeners();
  }


}