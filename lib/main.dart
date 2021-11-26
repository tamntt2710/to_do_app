import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/TaskManager.dart';
import 'common/common.dart';
import 'component/add_task_screen/add_task_screen.dart';
import 'component/add_task_screen/item_event_view.dart';
import 'component/app_bar_custom.dart';
import 'component/data_picker/time_picker.dart';
import 'component/edit_task_screen/completed_list_widget.dart';
import 'component/edit_task_screen/today_list_widget.dart';
import 'component/edit_task_screen/upcomming_list_widget.dart';
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
    final tabs = [
      TodayListWidget(),
      UpcommingListWidget(),
      CompletedWidget()
    ];
    int select = Provider.of<ListItemOfTask>(context).selectedItem;
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
            tabs[select],
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaskWidget(),
              ));
        },

        label: const Text('Add Task',style: TextStyle(
            color: Colors.white,
            fontSize: 14
        )),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


