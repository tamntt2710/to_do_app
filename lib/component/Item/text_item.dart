import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TextItem extends StatelessWidget {
  late String text;
  TextItem({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      height : 30.h,
      width: 80.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent,
            width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular
          (16)),

      ),
      child: Center(
          child : Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16
            ),
          )
      ),
    );
  }
}
