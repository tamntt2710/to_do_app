import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_bar_custom.dart';
import 'edit_task_screen.dart';
class TaskManager extends StatefulWidget {
  const TaskManager({Key? key}) : super(key: key);

  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  Color color = Colors.pinkAccent;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(page : 2),
      body: SingleChildScrollView(
        key: _formKey,
        child: EditTaskScreen(
          onChangeColor : (color) => setState(() =>this.color = color),
          onChangedTitle: (title) => setState(() => this.title = title),
          onSaveTodo: () {  },
        )
        ),
    );
  }
}
