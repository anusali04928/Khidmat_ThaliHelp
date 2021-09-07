import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  // const Calendar({ Key? key }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: RoundedAppBar('Calendar'),
      body: Center(
        child: Container(
          width: 350,
          height: 400,
          //  child: ,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffba2529),
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
        ),
      ),
    ));
  }
}
