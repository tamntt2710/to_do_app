import 'package:flutter/cupertino.dart';
class Place extends ChangeNotifier{
  String _currentPlace = placeOfEvent[0];
  String get currentPlace => _currentPlace;
  Place();
  updatePlace(String value){
    if(value != _currentPlace){
      _currentPlace = value;
      notifyListeners();
    }
  }

}
List<String> placeOfEvent = [
  "Home",
  "School",
  "Company",
  "Others"
];