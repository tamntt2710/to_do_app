import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/TaskManager.dart';
import 'common/common.dart';
import 'component/add_task_screen/add_task_screen.dart';
import 'component/add_task_screen/item_event_view.dart';
import 'component/app_bar_custom.dart';
import 'component/data_picker/time_picker.dart';
import 'component/search_item.dart';
import 'component/time_sort.dart';
import 'model/colors.dart';
import 'model/level_of_event.dart';
import 'model/place.dart';
import 'model/time_of_task.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=>ListItemOfTask() ,
        ),
        ChangeNotifierProvider(
          create: (context)=> BackGroundColor() ,
        ),
        ChangeNotifierProvider(
          create: (context)=> LevelOfEvent() ,
        ),
        ChangeNotifierProvider(
          create: (context)=> Place() ,
        ),
        ChangeNotifierProvider(
          create: (context)=> DatePickerDState() ,
        ),
        ChangeNotifierProvider(
          create: (context)=> TodosProvider() ,
        ),
      ],
      child:
      ScreenUtilInit(
            designSize: Size(360, 690),
            builder: () => MaterialApp(
                theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: TextTheme(
                  button: TextStyle(fontSize: 45.sp)
                ),
                ),
                          home: MyHomePage(),
            ),
        )
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int select = Provider.of<ListItemOfTask>(context).selectedItem;
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.taskList;
    final todos_completed = provider.TaskCompleted;
    return Scaffold(
      appBar: AppBarCustom(page: 1),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          children: [
            SearchItem(),
            SortTime(),
           todos.isEmpty ?
           Container(
             height: 400.h,
             child: Center(
               child: Icon(Icons.fact_check_outlined,color: Colors
                   .black54,size: 100
                 ,),
             ),
           ) : //Text(todos.length.toString()),
           Expanded(
             child: SizedBox(
               height: 350,
               child:
               select == 0 ?
               ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                       return ItemEvent(task: todos[index],);
                        },
                     separatorBuilder: (context,index) =>Container(height: 0
                         .h,),
                     itemCount: todos.length)
               : ListView.separated(
                       physics: BouncingScrollPhysics(),
                       itemBuilder: (context,index){
                         return ItemEvent(task: todos_completed[index],);
                       },
                       separatorBuilder: (context,index) =>Container(height: 0
                           .h,),
                       itemCount: todos_completed.length),
             ),
           )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTaskWidget(),
          ));
        },
        child: Center(child: Icon(Icons.add,size: 30,)),
              backgroundColor: Colors.black,
      ),
    );
  }
}


