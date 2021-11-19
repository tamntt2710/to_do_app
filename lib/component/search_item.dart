import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchItem extends StatefulWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15.w,top: 20.h,right: 10.w),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Welcome Back!",style:
                TextStyle(
                    fontSize: 18,
                    color: Colors.black87
                ),),
                SizedBox(height: 8.h,),
                Text("Here's Update Today",style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                ),)
              ],
            ),
            Container(
                height: 50.h,
                width: 50.w,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle
                ),
                child: Center(child: Icon(Icons.search,size: 30,color:
                Colors.white70,))
            )
          ],
        )

    );
  }
}
