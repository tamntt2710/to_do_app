import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SortButtonList extends StatelessWidget {
  String text;
  bool isSeclected;
  VoidCallback press;
  SortButtonList({Key? key,required this.text,required this.isSeclected,
  required this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: 100.w,
        decoration:
        isSeclected == true ?
        BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        )
            :BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Text(text,style: isSeclected == true ?
          TextStyle(
              color: Colors.white,
              fontSize: 16
          )
              :TextStyle(
            color: Colors.black,
              fontSize: 16
          )
            ,),
        ),
      ),
    );
  }
}
