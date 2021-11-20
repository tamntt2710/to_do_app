import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/component/Item/text_item.dart';
import 'package:to_do_app/model/task.dart';
class ItemEvent extends StatelessWidget {
  Task task;
  ItemEvent({Key? key,required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      margin: EdgeInsets.only(left: 10.w,top: 20.h,right: 10.w),
      child: Container(
        padding: EdgeInsets.only(left: 20.w,top: 20.h,right: 15.w),
        decoration: BoxDecoration(
            color: task.color,
            borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextItem(text: task.place,),
                      TextItem(text: task.level),
                    ],
                  ),
                  Container(
                    height: 30.h,
                    width: 30.h,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        color: Colors.black
                    ),
                    child: GestureDetector(
                        onTap:(){
                        //   Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => EditTaskScreen()),
                        // );
                        },
                        child: Center(
                            child: Icon(Icons.edit,color: Colors
                                .white,))),
                  )

                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(task.name,style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ),),
                Row(
                  children: [
                    Icon(Icons.fact_check_outlined,color: Colors
                        .black,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(task.day, style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                      )),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time,color: Colors
                            .black,),
                        Padding(
                          padding: EdgeInsets.only(left : 15.0),
                          child: Text(task.hour, style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                          )),
                        ),
                      ],
                    ),

                    Container(
                      height: 30.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.black,
                              width: 2.0
                          )
                      ),
                      child: Center(
                        child: Icon(Icons.done,),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],

        ),

      ),
    );
  }
}
