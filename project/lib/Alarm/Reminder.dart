import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:project/Alarm/AddAlarm.dart';
//import 'package:project/Alarm/AddAlarm.dart';
import 'package:project/Alarm/Alarm_tile.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:project/models/AlarmSql.dart';

class Reminder extends StatefulWidget {
  // const Reminder({ Key? key }) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final dbins = DBHelper();
  Future<List<AlarmClass>> getData() {
    return Future.delayed(Duration(milliseconds: 100), () {
      return dbins.alarm();
      // throw Exception("Custom Error");
    });
  }

  List<AlarmClass> l1;
  var update = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: RoundedAppBar('Reminder'),
      body: Center(
        child: Container(
          width: 370,
          height: 420,
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
                      l1 = snapshot.data;
                      if (l1.isEmpty) {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 115),
                            width: double.maxFinite,
                            height: 100,
                            child: Text(
                              'No Alarms added',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SanFrancisco',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.25,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            padding: EdgeInsets.all(10),
                            itemCount: l1.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AlarmTile(l1[index], updatePage, index);
                            });
                      }
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
                height: 10,
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
              SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void updatePage(int p1) {
    setState(() {
      l1.removeAt(p1);
      print(l1);
    });
  }
}
