import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/component/Item/text_item.dart';
import 'package:to_do_app/model/colors.dart';
import 'package:to_do_app/model/level_of_event.dart';
import 'package:to_do_app/model/place.dart';
import 'edit_task_screen.dart';
class ItemEvent extends StatelessWidget {
  const ItemEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      margin: EdgeInsets.only(left: 10.w,top: 20.h,right: 10.w),
      child: Container(
        padding: EdgeInsets.only(left: 20.w,top: 20.h,right: 15.w),
        decoration: BoxDecoration(
            color: Provider.of<BackGroundColor>(context,
                listen:false).itemColor,
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
                      TextItem(text: Provider.of<Place>(context).currentPlace,),
                      TextItem(text: Provider.of<LevelOfEvent>(context,
                          listen:false).levelChoosen),
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
                        onTap:(){ Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditTaskScreen()),
                        );},
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
                Text("Do my homework",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ),),
                Row(
                  children: [
                    Icon(Icons.fact_check_outlined,color: Colors
                        .black,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("12 Oct 2021", style: TextStyle(
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
                          child: Text("7:30", style: TextStyle(
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
