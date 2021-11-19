import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  String text;
  VoidCallback press;
 ButtonWidget({Key? key,required this.text,required this.press}) : super(key:
 key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Center(
        child: Text(text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20
        ),)
      ),
    );
  }
}
