import 'package:flutter/material.dart';

import 'package:project/Custom_widgets/roundedAppBar.dart';

class EditAlarm extends StatefulWidget {
  //const EditAlarm({ Key? key }) : super(key: key);
  final String date;
  // DateTime time;

  final String title;
  final String note;
  final int id;
  EditAlarm(this.id, this.date, this.title, this.note);
  @override
  _EditAlarmState createState() => _EditAlarmState();
}

class _EditAlarmState extends State<EditAlarm> {
  // final _formKey = GlobalKey<FormState>();
  // String sessionDay= date.hour>11:
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //  resizeToAvoidBottomInset: false,
      appBar: RoundedAppBar('Add Alarm'),
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
                BoxShadow(
                    color: Colors.grey, blurRadius: 6, offset: Offset(0, 3))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
                child: Text(widget.title +
                    widget.id
                        .toString())) /*Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Title: '),
                          Container(
                            height: 50,
                            width: 200,
                            child: TextFormField(
                              initialValue: widget.title,
                              autocorrect: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.circular(),
                                  borderSide: BorderSide(
                                    color: Color(0xffba2529),
                                    width: 1.5,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color(0xffba2529),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                setState(() {
                                  widget.title = value;
                                });
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      // date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Date Selected: '),
                          TextButton(
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day),
                                    maxTime: DateTime(2021, 12, 31),
                                    onChanged: (date) {}, onConfirm: (d) {
                                  setState(() {
                                    widget.date = d;
                                  });
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                              child: Text(
                                widget.date.day.toString() +
                                    ' - ' +
                                    widget.date.month.toString() +
                                    ' - ' +
                                    widget.date.year.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      // time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Time Selected: '),
                          TextButton(
                              onPressed: () {
                                DatePicker.showTimePicker(context,
                                    showTitleActions: true,
                                    onChanged: (date) {}, onConfirm: (t) {
                                  setState(() {
                                    widget.time = t;
                                  });
                                }, currentTime: DateTime.now());
                              },
                              child: Text(
                                widget.time.hour.toString() +
                                    ' : ' +
                                    widget.time.minute.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      // Note
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Note: '),
                          Container(
                            height: 100,
                            width: 200,
                            child: TextFormField(
                              initialValue: widget.note,
                              maxLines: 5,
                              autocorrect: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.circular(),
                                  borderSide: BorderSide(
                                    color: Color(0xffba2529),
                                    width: 1.5,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color(0xffba2529),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                setState(() {
                                  widget.note = value;
                                });
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      // submit
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Button(
                                h: 30,
                                w: 100,
                                text: "Save",
                                meth: () async {
                                  if (_formKey.currentState.validate()) {
                                    id++;
                                    //   setState(() {});

                                    AlarmClass alarm = AlarmClass(
                                        id, date.toString(), title, note);
                                    dbins.insertAlarm(alarm);
                                    print(await dbins.alarm());
                                  }

                                  Navigator.push(context, PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation, animationTime) {
                                    return Reminder();
                                  }));
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),*/
            ),
      ),
    ));
  }
}
