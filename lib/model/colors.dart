import 'package:flutter/material.dart';
class BackGroundColor extends ChangeNotifier{
  List<Color> listColors = [
    Color(0xFFF3F600),
    Color(0xFF11FAD5),
    Color(0xFF11CEFF),
    Color(0xFFC18EFF),
    Color(0xFFFFA3C2),
    Color(0xFFF87C4B),
    Color(0xFF4A5CFF),
    Color(0xFFB500C1),
  ];
  int selectedColor = 1;
  Color get itemColor => listColors[selectedColor];
  void chooseColor(int index){
    selectedColor = index;
    notifyListeners();
  }

}