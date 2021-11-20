import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/common/common.dart';
import 'package:to_do_app/component/add_task_screen/color_item.dart';
import 'package:to_do_app/component/data_picker/time_picker.dart';
import 'package:to_do_app/model/TaskManager.dart';
import 'package:to_do_app/model/colors.dart';
import 'package:to_do_app/model/level_of_event.dart';
import 'package:to_do_app/model/place.dart';
import 'package:to_do_app/model/task.dart';

import '../app_bar_custom.dart';
import '../list_sort_button.dart';
class EditTaskWidget extends StatefulWidget {
  final Task task;
  const EditTaskWidget({Key? key,required this.task}) : super(key: key);
  @override
  _EditTaskWidgetState createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late Color color;
  late String day;
  late String place;
  late String level;
  @override
  void initState() {
    super.initState();
    name = widget.task.name;
    color = widget.task.color;
    day = widget.task.day;
    place = widget.task.place;
    level = widget.task.level;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(page : 2),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(left:15.w,top:20.h,right: 15.w),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Task Name",style:editText),
                    buildTitle(),
                    SizedBox(height: 20.h,),
                    Text("Color",style: editText,),
                    buldColor(context),
                    divider,
                    customPadding("Due Time"),
                    buildTime(context),
                    divider,
                    customPadding("Place"),
                    buildPlace(context),
                    divider,
                    buildLevel(context),
                    divider,
                    buildButton(context),
                  ],
                ),
              ))
      ),
    );
  }
  _showSingleChoiceDialog(BuildContext context)
  => showDialog(
      context: context,
      builder : (context) {
        final _singleNotifier = Provider.of<Place>(context);
        return AlertDialog(
          title: Text("Place"),
          content: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                  placeOfEvent.map((e) => RadioListTile(
                    title: Text(e),
                    value: e,
                    groupValue: _singleNotifier.currentPlace,
                    selected: _singleNotifier.currentPlace == e,
                    onChanged: (value){
                      _singleNotifier.updatePlace(value.toString());
                      place = _singleNotifier.currentPlace;
                      Navigator.of(context).pop();
                    },
                  )).toList(),
                )
            ),
          ),
        );
      }
  );
  DateTime selectedDate1 = DateTime.now();
  _selectDate(BuildContext context) async {
    final _timePicker = Provider.of<DatePickerDState>(context,listen: false);
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: _timePicker.firstDate,
        lastDate: _timePicker.lastDate,
        textDirection: TextDirection.ltr,
        builder: (context,child){
          return Theme(
            data: ThemeData(
              primaryColor: Color(0xFFFFA3C2),
              // primarySwatch: Colors.black,
              accentColor: Color(0xFFFFA3C2),
            ),
            child: child as Widget,
          );
        }
    );
    _timePicker.chooseDate(picked!);
    day = _timePicker.dateSelect.toString();
  }

  Widget buildTitle() => TextField(
    key: _formKey,
    maxLines: 1,
    style: inputText,
    decoration: InputDecoration(
      border: UnderlineInputBorder(
          borderSide: new BorderSide(
              color: Color(0xFFEAEAEA)
          )
      ),
      hintText: 'Enter your task name',

    ),
    onChanged: onChangedTitle,

  );

  Widget buildButton(context) => Container(
    padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
    height:80.h,
    child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>
              (Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black)
                )
            )
        ),
        onPressed: updateTask,
        child: Center(
          child: Text("Save Task",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold)),
        )),
  );

  buldColor(BuildContext context) => Container(
    margin: EdgeInsets.only(top:20.h,bottom: 10.h),
    height: 35.h,
    child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: Provider.of<BackGroundColor>(context).listColors.length,
        itemBuilder: (context, index) {
          return ColorItem(
            color: Provider.of<BackGroundColor>(context,
                listen:false).listColors[index],
            selected:  Provider.of<BackGroundColor>(context,
                listen:false).selectedColor == index ? true:false,
            press: () {
              Provider.of<BackGroundColor>(context,
                  listen:false).chooseColor(index);
              color = Provider.of<BackGroundColor>(context,
                  listen:false).itemColor;
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 15.w,)),
  );

  buildTime(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            Provider.of<DatePickerDState>(context)
                .dateSelect.toString(),
            style: textTime
        ),
        GestureDetector(
          onTap: (){
            Provider.of<DatePickerDState>(context,
                listen:false).chooseDate(Provider.of<DatePickerDState>(context,
                listen:false).selectedDate);
            _selectDate(context);
            day = Provider.of<DatePickerDState>(context,listen: false)
                .dateSelect
                .toString();
          },
          child: Icon(Icons.fact_check_outlined,color: Colors
              .black,),
        ),
      ],
    ),
  );

  buildPlace(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            Provider.of<Place>(context).currentPlace,
            style: textTime
        ),
        GestureDetector(
          onTap: (){
           place = Provider.of<Place>(context,listen: false).currentPlace;
            return _showSingleChoiceDialog(context);
          },
          child: Icon(Icons.add_location_alt_rounded,color: Colors
              .black,),
        ),
      ],
    ),
  );

  buildLevel(BuildContext context) =>Container(
    margin: EdgeInsets.only(right: 10.w,bottom: 10.h, top: 20.h),
    height: 40.h,
    child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: Provider.of<LevelOfEvent>(context).levels.length,
        itemBuilder: (context, index) {
          return SortButtonList(
            text:
            Provider.of<LevelOfEvent>(context,
                listen:false).levels[index],
            isSeclected:
            Provider
                .of<LevelOfEvent>(context,
                listen:false).selected == index ? true : false,
            press: () {
              level = Provider.of<LevelOfEvent>(context,
                  listen:false).levelChoosen;
              Provider.of<LevelOfEvent>(context,
                  listen:false).chooseLevel(index);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 15.w,)),
  );

  void updateTask() {
    Provider.of<TodosProvider>(context, listen: false).updateTodo(widget.task,
        name,
        color,day,place,level);
    Navigator.of(context).pop();
  }
  void onChangedTitle(String value) => setState(() => name = value);
}
