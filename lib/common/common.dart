import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
const kTextStyle = TextStyle(fontSize: 18,color: Colors.black);
const tTextButton = TextStyle(fontSize: 16);
const editText = TextStyle(
    fontSize: 20,
    color: Colors.black38,
    fontWeight: FontWeight.w500
);
const inputText = TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.bold
);
const textTime = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18
);
const divider =  Divider(
  color: Color(0xFFEAEAEA),
  thickness: 2.0,
);
Widget customPadding(text) =>  Padding(
  padding: EdgeInsets.only(top:10.h,bottom: 20.h),
  child: Text(text,style: editText,),
);