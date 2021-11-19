import 'package:flutter/material.dart';

class LevelOfEvent extends ChangeNotifier{
  List<String> levels = [
    "Urgent",
    "Basic",
    "Important"
  ];
  int selected = 0;
  String get levelChoosen => levels[selected];
  void chooseLevel(int index){
    selected = index;
    notifyListeners();
  }
}