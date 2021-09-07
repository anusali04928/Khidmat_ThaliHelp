import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:project/Alarm/AddAlarm.dart';
//import 'package:project/Alarm/AddAlarm.dart';
import 'package:project/Alarm/Alarm_tile.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:project/api/localNotif.dart';
import 'package:project/models/AlarmSql.dart';

class Reminder extends StatefulWidget {
  // const Reminder({ Key? key }) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final dbins = DBHelper();
  Future<List<AlarmClass>> getData() {
    return Future.delayed(Duration(seconds: 2), () {
      return dbins.alarm();
      // throw Exception("Custom Error");
    });
  }

  var update = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: RoundedAppBar('Reminder'),
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
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 6, offset: Offset(0, 3))
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 350,
                child: FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<AlarmClass>> snapshot) {
                    if (snapshot.hasData) {
                      final l1 = snapshot.data;

                      return ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: l1.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AlarmTile(l1[index]);
                          });
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Color(0xffba2529),
                      ));
                    }
                  },
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Button(
                  h: 30,
                  w: 100,
                  text: "Add Alarm",
                  meth: () async {
                    bool update = await Navigator.push(context,
                        PageRouteBuilder(
                            pageBuilder: (context, animation, animationTime) {
                      return AddAlarm();
                    }));
                    if (update == true) {
                      setState(() {});
                    }
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
