import 'package:flutter/cupertino.dart';
class Task{
  late String name;
  late Color color;
  late String day;
  late String hour = "9:00";
  late String place;
  late String level;
  late bool isDOne = false;
  Task({required this.name,required this.color,required this.day,required
  this.level,
  required this.place,this.isDOne = false});
}