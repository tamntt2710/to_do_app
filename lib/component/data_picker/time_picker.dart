import 'package:flutter/material.dart';
class DatePickerDState extends ChangeNotifier{
  DateTime selectedDate = DateTime.now();
  DateTime firstDate = DateTime(2020);
  DateTime lastDate= DateTime(2025);
  void chooseDate(DateTime picked){
    if (picked != null && picked != selectedDate)
        selectedDate = picked;
    notifyListeners();
  }
  DateTime get dateSelect => selectedDate;
}
