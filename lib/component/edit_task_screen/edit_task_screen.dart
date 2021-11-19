import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/common/common.dart';
import 'package:to_do_app/component/data_picker/time_picker.dart';
import 'package:to_do_app/model/colors.dart';
import 'package:to_do_app/model/level_of_event.dart';
import 'package:to_do_app/model/place.dart';

import '../app_bar_custom.dart';
import '../list_sort_button.dart';
import 'color_item.dart';
class EditTaskScreen extends StatelessWidget {
  final String title;
  final Color color;
  final String day;
  final String hour;
  final String place;
  final String level;
  final ValueChanged<Color> onChangeColor;
  final ValueChanged<String> onChangedTitle;
  final VoidCallback onSaveTodo;
  EditTaskScreen({
    Key? key,
    this.title = '',
    this.color = Colors.white,
    this.day = '',
    this.hour = '',
    this.level = '',
    this.place = '',
    required this.onChangeColor,
    required this.onChangedTitle,
    required this.onSaveTodo}) :
        super(key:
  key);
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.only(left:15.w,top:20.h,right: 15.w),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Task Name",style:editText),
              buildTitle(),
              SizedBox(height: 20.h,),
              Text("Color",style: editText,),
              buldColor(context),
              Divider(
                color: Color(0xFFEAEAEA),
              thickness: 2.0,
              ),
              Padding(
                padding: EdgeInsets.only(top:10.h,bottom: 20.h),
                child: Text("Due Time",style: editText,),
              ),
              Padding(
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
                        print(Provider.of<DatePickerDState>(context,
                            listen:false).dateSelect);
                        Provider.of<DatePickerDState>(context,
                            listen:false).chooseDate(Provider.of<DatePickerDState>(context,
                            listen:false).selectedDate);
                        _selectDate(context);
                      },
                      child: Icon(Icons.fact_check_outlined,color: Colors
                          .black,),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFEAEAEA),
                thickness: 2.0,
              ),
              Padding(
                padding: EdgeInsets.only(top:10.h,bottom: 20.h),
                child: Text("Place",style: editText,),
              ),
              Padding(
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
                        return _showSingleChoiceDialog(context);
                      },
                      child: Icon(Icons.add_location_alt_rounded,color: Colors
                          .black,),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFEAEAEA),
                thickness: 2.0,
              ),
            Container(
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
                        Provider.of<LevelOfEvent>(context,
                            listen:false).chooseLevel(index);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 15.w,)),
          ),
              Divider(
                color: Color(0xFFEAEAEA),
                thickness: 2.0,
              ),
              buildButton(),
            ],
          ));
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
  }

  Widget buildTitle() => TextField(
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

  Widget buildButton() => Container(
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
        onPressed: onSaveTodo,
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
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 15.w,)),
  );


}

