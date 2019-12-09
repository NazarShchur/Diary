import 'package:flutter/cupertino.dart';

class PulsePageModel extends ChangeNotifier{
  DateTime _date = DateTime.now();
  DateTime get date => _date;
  Map<DateTime, int> _pulses = new Map();

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