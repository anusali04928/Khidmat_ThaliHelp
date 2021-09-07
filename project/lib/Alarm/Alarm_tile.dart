import 'package:flutter/material.dart';
import 'package:project/api/localNotif.dart';
import 'package:project/models/AlarmSql.dart';

class AlarmTile extends StatefulWidget {
  final AlarmClass data;

  AlarmTile(this.data);

  @override
  _AlarmTileState createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  final dbins = DBHelper();
  String Days() {
    var mapofdays = ['Mon', 'Tue', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'];
    var days = '';
    var listOfDays = widget.data.DaysofWeek();
    //  print(listOfDays);
    //listOfDays.map((e) => mapofdays[e - 1]);
    for (var i = 0; i < listOfDays.length; i++) {
      if (days == '') {
        days = days + mapofdays[listOfDays[i] - 1];
      } else {
        days = days + '-' + mapofdays[listOfDays[i] - 1];
      }
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffDD2126),
          Color(0xff9B2821),
          //  Color(0xffDD2130),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 6, offset: Offset(0, 3))
        ],
      ),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.alarm_on,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.data.title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  dbins.deleteAlarm(widget.data.id);
                  LocalNotif.cancel(widget.data.id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 24,
                ),
              )
            ],
          ),
          Text(
            Days(),
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.data.timeOfDay().hour.toString() +
                    ':' +
                    widget.data.timeOfDay().minute.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
