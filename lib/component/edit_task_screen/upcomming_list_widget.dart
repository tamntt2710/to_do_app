import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/component/add_task_screen/item_event_view.dart';
import 'package:to_do_app/model/TaskManager.dart';
class UpcommingListWidget extends StatelessWidget {
  const UpcommingListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.taskList;
    return todos.isEmpty ?
    Container(
      height: 400.h,
      child: Center(
        child: Icon(Icons.fact_check_outlined,color: Colors
            .black54,size: 100
          ,),
      ),
    ) : SizedBox(
        height: 470.h,
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index){
              return ItemEvent(task: todos[index],);
            },
            separatorBuilder: (context,index) =>Container(height: 0
                .h,),
            itemCount: todos.length));
  }
  }
