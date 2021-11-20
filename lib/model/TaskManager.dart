import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
class TodosProvider extends ChangeNotifier {
  List<Task> listOfTask = [
      Task(day: '27/10/2021',
            name: 'Happy birthday',
          place: 'Home', level: 'Important', color: Color(0xFFFFA3C2),),
    Task(day: '27/12/2021',
        name: 'Final Exam',
        place: 'School', level: 'Important', color: Color(0xFF11FAD5)),
    Task(day: '27/11/2021',
        name: 'Hangout',
        place: 'Other', level: 'Important', color: Color(0xFF4A5CFF),),
  ];
  List<Task> get taskList => listOfTask.where((task) => task.isDOne == false)
      .toList();
  void addTodo(Task task){
    listOfTask.add(task);
    notifyListeners();
  }
  void updateTodo(Task task,String name, Color color, String date, String
  place, String level){
    task.name = name;
    task.color = color;
    task.day = date;
    task.place = place;
    task.level = level;
    notifyListeners();
  }
  void removeTodo(Task task){
    listOfTask.remove(task);
    notifyListeners();
  }
  List<Task> get TaskCompleted => listOfTask.where((task) => task.isDOne ==
      true).toList();
  bool toggleTaskStatus(Task task){
    task.isDOne = !task.isDOne;
    notifyListeners();
    return task.isDOne;
  }
}
