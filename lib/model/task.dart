import 'package:flutter/cupertino.dart';
class Task{
  String name;
  Color color;
  String day;
  String hour = "9:00";
  String place;
  String level;
  bool isDOne;
  Task({required this.name,required this.color,required this.day,required
  this.level,
  required this.place,this.isDOne = false});
}