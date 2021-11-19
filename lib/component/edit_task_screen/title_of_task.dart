import 'package:flutter/material.dart';
import 'package:to_do_app/common/common.dart';
class TitleOfTask extends StatefulWidget {
  const TitleOfTask({Key? key}) : super(key: key);

  @override
  _TitleOfTaskState createState() => _TitleOfTaskState();
}

class _TitleOfTaskState extends State<TitleOfTask> {
  TextEditingController controller = TextEditingController();
  String value = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: inputText,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
            borderSide: new BorderSide(
                color: Color(0xFFEAEAEA)
            )
        ),
        hintText: 'Enter your task name',
      ),
    );
  }
}
