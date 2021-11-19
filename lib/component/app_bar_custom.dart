import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/common/common.dart';
class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  int page;
  AppBarCustom({required this.page,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = "Manager Task";
    String leadingIcon = "asset/outline_widgets.png";
    String actionIcon = "asset/outline_notifications.png";
    return AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading:  page == 1
        ? Container(
                margin: EdgeInsets.only(left: 15.h),
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle
                ),

                    child : Icon(
                  Icons.widgets_rounded,size: 23,color: Colors.white,
                )
                // Image.asset(
                //   leadingIcon,
                // fit: BoxFit.fill,
                // )
          ): GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
      Icons.arrow_back_rounded,size: 35,color: Colors.black,
    ),
          ),

          title: Center(
              child: Text(
              page == 2 ? "Edit Task" : "Task Manager",
              style: kTextStyle,
              ),
              ),
              actions: [
                page == 1 ? Padding(
                padding: EdgeInsets.all(12.h),
                child:Image.asset(
                  actionIcon,
                fit: BoxFit.fill,
                ),
                ):
                Container(),
                ],);
        }

  @override
  Size get preferredSize => Size.fromHeight(55.0);
}
