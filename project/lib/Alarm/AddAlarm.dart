import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:project/Alarm/Reminder.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:project/api/localNotif.dart';
import 'package:project/models/AlarmSql.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class AddAlarm extends StatefulWidget {
  //const AddAlarm({ Key? key }) : super(key: key);

  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  String title = '';
  String note = '';
  final _formKey = GlobalKey<FormState>();
  final dbins = DBHelper();
  final days = List.filled(7, false);
  TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);
  //  bool iosStyle = true;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  void initState() {
    super.initState();
    LocalNotif.init(initScheduled: true);
    ListenNotifications();
  }

  void ListenNotifications() {
    LocalNotif.onNotifications.stream.listen(onClickNotification);
  }

  void onClickNotification(String payload) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Reminder()));
  }

  // String sessionDay= date.hour>11:
  @override
  Widget build(BuildContext context) {
//    double h = MediaQuery.of(context).size.height;
    //   double w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      //  resizeToAvoidBottomInset: false,
      appBar: RoundedAppBar('Reminder'),
      body: Center(
        child: Container(
          //     color: Colors.white,

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
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //heading
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Set new alarm',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),

                      // time
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            _time.hour > 12
                                                ? (_time.hour - 12).toString()
                                                : _time.hour.toString(),
                                            style: TextStyle(
                                                fontSize: 40,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        //  color: Color(0xffba2529),
                                        height: 60,
                                        width: 100,

                                        //  padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            //background color of box
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius:
                                                  1.0, // soften the shadow
                                              spreadRadius:
                                                  1.0, //extend the shadow
                                              offset: Offset(
                                                0.0, // Move to right 10  horizontally
                                                2.0, // Move to bottom 10 Vertically
                                              ),
                                            )
                                          ],
                                          border: Border.all(
                                            color: Color(0xffba2529),
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          color: Color(0xffba2529),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            _time.minute.toString(),
                                            style: TextStyle(
                                                fontSize: 40,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        //  color: Color(0xffba2529),
                                        height: 60,
                                        width: 100,

                                        //  padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            //background color of box
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius:
                                                  1.0, // soften the shadow
                                              spreadRadius:
                                                  1.0, //extend the shadow
                                              offset: Offset(
                                                0.0, // Move to right 10  horizontally
                                                2.0, // Move to bottom 10 Vertically
                                              ),
                                            )
                                          ],
                                          border: Border.all(
                                            color: Color(0xffba2529),
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          color: Color(0xffba2529),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'am',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: (_time.hour < 12)
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        //  color: Color(0xffba2529),
                                        height: 60 / 2,
                                        width: 100 / 2,

                                        //  padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            //background color of box
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius:
                                                  1.0, // soften the shadow
                                              spreadRadius:
                                                  1.0, //extend the shadow
                                              offset: Offset(
                                                0.0, // Move to right 10  horizontally
                                                2.0, // Move to bottom 10 Vertically
                                              ),
                                            )
                                          ],
                                          border: Border.all(
                                            color: Color(0xffba2529),
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          color: (_time.hour < 12)
                                              ? Color(0xffba2529)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'pm',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: (_time.hour >= 12)
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        //  color: Color(0xffba2529),
                                        height: 60 / 2,
                                        width: 100 / 2,

                                        //  padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            //background color of box
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius:
                                                  1.0, // soften the shadow
                                              spreadRadius:
                                                  1.0, //extend the shadow
                                              offset: Offset(
                                                0.0, // Move to right 10  horizontally
                                                2.0, // Move to bottom 10 Vertically
                                              ),
                                            )
                                          ],
                                          border: Border.all(
                                            color: Color(0xffba2529),
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          color: (_time.hour >= 12)
                                              ? Color(0xffba2529)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  showPicker(
                                    accentColor: Color(0xffba2529),
                                    blurredBackground: true,
                                    context: context,
                                    value: _time,
                                    onChange: onTimeChanged,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),

                      // title
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 200,
                              child: TextFormField(
                                //   style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                  labelText: 'Title',
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusedBorder: UnderlineInputBorder(
                                    //  borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Color(0xffba2529),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                cursorColor: Color(0xffba2529),
                                cursorHeight: 25,
                                autocorrect: true,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  setState(() {
                                    title = value;
                                  });
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      // days
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              //color: Color(0xffba2529),
                              height: 50,
                              width: 300,
                              child: WeekdaySelector(
                                selectedFillColor: Color(0xffba2529),
                                elevation: 2,
                                selectedElevation: 3,
                                //     disabledElevation: 50,
                                onChanged: (int day) {
                                  setState(() {
                                    // Use module % 7 as Sunday's index in the array is 0 and
                                    // DateTime.sunday constant integer value is 7.
                                    final index = day % 7;
                                    // We "flip" the value in this example, but you may also
                                    // perform validation, a DB write, an HTTP call or anything
                                    // else before you actually flip the value,
                                    // it's up to your app's needs.
                                    days[index] = !days[index];
                                  });
                                },
                                values: days,
                              ),
                            )
                          ],
                        ),
                      ),

                      // Note
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Add details: '),
                            // ignore: deprecated_member_use
                            FlatButton(
                              child: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Color(0xffba2529),
                                size: 30,
                              ),
                              onPressed: () {
                                //   var _note = '';
                                final _formKey2 = GlobalKey<FormState>();
                                showMaterialModalBottomSheet(
                                    bounce: true,
                                    expand: true,
                                    enableDrag: true,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(24),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) => SafeArea(
                                          child: Form(
                                            key: _formKey2,
                                            child: Container(
                                              height: 400,
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      // label
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Add details',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            )
                                                          ],
                                                        ),
                                                      ),

                                                      // Box for text
                                                      Container(
                                                        height: 300,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Color(
                                                                0xffba2529),
                                                            style: BorderStyle
                                                                .solid,
                                                            width: 1.0,
                                                          ),
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: TextFormField(
                                                            scrollController:
                                                                ScrollController(
                                                                    keepScrollOffset:
                                                                        true),
                                                            minLines: 1,
                                                            maxLines: 10,
                                                            //   style: TextStyle(fontSize: 20),
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                            cursorColor: Color(
                                                                0xffba2529),
                                                            cursorHeight: 25,
                                                            autocorrect: true,
                                                            // The validator receives the text that the user has entered.
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Please enter some text';
                                                              }
                                                              setState(() {
                                                                note = value;
                                                              });
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),

                                                      // Save
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10),
                                                        child: Button(
                                                          meth: () {
                                                            if (_formKey2
                                                                .currentState
                                                                .validate()) {}
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          h: 30,
                                                          w: 100,
                                                          text: "Save",
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ));
                              },
                            ),
                          ],
                        ),
                      ),

                      // submit button
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button(
                                  h: 30,
                                  w: 100,
                                  text: "Add",
                                  meth: () async {
                                    var str = '';
                                    days.forEach((item) => item == true
                                        ? str = str + "1"
                                        : str = str + "0");
                                    if (_formKey.currentState.validate()) {
                                      AlarmClass alarm = AlarmClass(0, title,
                                          _time.toString(), str, note);
                                      dbins.insertAlarm(alarm);
                                      print(await dbins.alarm());
                                      LocalNotif.showScheduledNotification(
                                        title: title,
                                        body: note,
                                        payload: '',
                                        scheduleDate: alarm.timeOfDay(),
                                        days: alarm.DaysofWeek(),
                                      );
                                      Navigator.pop(context, true);
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    ));
  }
}
