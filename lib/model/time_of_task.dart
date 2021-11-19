import 'package:flutter/material.dart';
class ListItemOfTask extends ChangeNotifier{
  List<String> listTime = [
    'Today',
    'Upcoming',
    'Finished'
  ];
  late int selectedItem = 0;
  String get SelectItem => listTime[selectedItem];
  void goToItem(int index){
    selectedItem = index;
    notifyListeners();
  }
}

