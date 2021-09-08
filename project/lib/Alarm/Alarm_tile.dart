import 'package:flutter/material.dart';
import 'package:project/api/localNotif.dart';
import 'package:project/models/AlarmSql.dart';

class AlarmTile extends StatefulWidget {
  final AlarmClass data;
  final void Function(int) callback;
  final int index;

  AlarmTile(this.data, this.callback, this.index);

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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffDD2126),
          Color(0xff9B2821),
          //  Color(0xffDD2130),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 1.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/icons/alarm.png'),
                    width: 25,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.data.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SanFrancisco',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.50,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  dbins.deleteAlarm(widget.data.id);
                  LocalNotif.cancel(widget.data.id);
                  widget.callback(widget.index);
                },
                child: Image(
                  image: AssetImage('assets/icons/delete.png'),
                  width: 25,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Days(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SanFrancisco',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.25,
                  ),
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
                        fontFamily: 'SanFrancisco',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
