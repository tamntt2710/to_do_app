import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/time_of_task.dart';

import 'list_sort_button.dart';
class SortTime extends StatelessWidget {
  const SortTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 15.w, right: 10.w, top: 20.h),
      height: 40.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: Provider.of<ListItemOfTask>(context).listTime.length,
          itemBuilder: (context, index) {
            return SortButtonList(
              text:
              Provider.of<ListItemOfTask>(context,
                  listen:false).listTime[index],
              isSeclected:
              Provider
                  .of<ListItemOfTask>(context,
                  listen:false).selectedItem == index ? true : false,
              press: () {
                Provider.of<ListItemOfTask>(context,
                    listen:false).goToItem(index);
                print(Provider.of<ListItemOfTask>(context,
                    listen:false).listTime[index]);
                print(Provider
                    .of<ListItemOfTask>(context,
                    listen:false).selectedItem);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: 15.w,)),
    );
  }
}
