import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ColorItem extends StatelessWidget {
  Color color;
  bool selected;
  VoidCallback press;
 ColorItem({Key? key,required this.color,required this.selected,required this
     .press})
     : super
     (key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 35.h,
        width: 35.h,
        decoration: selected == true ?
        BoxDecoration(
            border: Border.all(color : Colors.blueAccent,width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(90))
        ):
        BoxDecoration(
          //  border: Border.all(color : Colors.blueAccent,width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(90))
        )
        ,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color : color,
                borderRadius: BorderRadius.all(Radius.circular(90))
            ),
          ),
        ),
      ),
    );

  }
}

