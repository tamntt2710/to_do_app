import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/component/Item/text_item.dart';
import 'package:to_do_app/component/edit_task_screen/edit_screen.dart';
import 'package:to_do_app/model/TaskManager.dart';
import 'package:to_do_app/model/task.dart';

import '../../utils.dart';
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
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditTaskWidget(task: task,)),
                        );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(task.name,style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500
                    ),),
                    GestureDetector(
                        onTap: ()
                       => deleteTask(context,task),
                        child: Center(
                            child: Icon(Icons.delete,color: Colors
                                .white,size: 25,)))
                  ],

                ),
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    SizedBox(width : 200.w),
                    buildTodo(context)
                  ],
                ),
              ],
            ),
          ],

        ),

      ),
    );
  }
  deleteTask(BuildContext context, Task task) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(task);
    Utils.showSnackBar(context, 'Deleted the task');
  }
  buildTodo(context) => GestureDetector(
    onTap: () => editTodo(context,task),
    child: Container(
      height: 30.h,
      child: Checkbox(
        activeColor: Theme.of(context).primaryColor,
        checkColor: Colors.white,
        value: task.isDOne,
        onChanged: (_) {
          final provider =
          Provider.of<TodosProvider>(context, listen: false);
          final isDone = provider.toggleTaskStatus(task);
          Utils.showSnackBar(
            context,
            isDone ? 'Task completed' : 'Task marked incomplete',
          );
        },
      )
    ),
  );
  void editTodo(BuildContext context, Task todo) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditTaskWidget(task: todo,),
    ),
  );
}
