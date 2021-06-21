import 'package:flutter/material.dart';
import 'package:project/Calculator/Calculator.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ThaliHelp',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SafeArea(
        child: MainMenu(),
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height / 8;
    double w1 = (MediaQuery.of(context).size.width) / 4;
    double hsmall = MediaQuery.of(context).size.height / 20;
    double wsmall = MediaQuery.of(context).size.width / 5;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white, // add gradient here possibly
      //  extendBodyBehindAppBar: true,
      appBar: RoundedAppBar('Main Menu'), //AppBar
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(0, h1 / 3, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            //Alarm Button
            Button(
              h: h1,
              w: w1 * 2.5,
              ic: Icons.alarm,
              text: 'Alarm',
            ),
            SizedBox(
              width: w1 / 4,
              height: h1 / 4,
            ),
            // 4 Buttons
            Container(
              padding: EdgeInsets.fromLTRB(w1 / 1.2, 0, w1 / 1.2, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      //Calculator
                      Button(
                          h: h1,
                          w: w1,
                          ic: Icons.calculate,
                          text: "Calculator",
                          meth: () => Navigator.push(context, PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, animationTime) {
                                return Calculator();
                              }))),
                      SizedBox(
                        width: w1 / 4,
                        height: h1 / 4,
                      ),
                      // Calendar
                      Button(
                        h: h1,
                        w: w1,
                        ic: Icons.calendar_today_outlined,
                        text: "Calender",
                      )
                    ],
                  ),
                  SizedBox(
                    width: w1 / 4,
                    height: h1 / 4,
                  ),
                  Column(
                    children: [
                      // Radio
                      Button(
                        h: h1,
                        w: w1,
                        ic: Icons.radio,
                        text: "Radio",
                      ),
                      SizedBox(
                        width: w1 / 4,
                        height: h1 / 4,
                      ),
                      //Phone
                      Button(
                        h: h1,
                        w: w1,
                        ic: Icons.phone,
                        text: "Phone",
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: w1 / 6,
              height: h1 / 6,
            ),
            //Logout
            Button(
              h: hsmall,
              w: wsmall,
              // ic: Icons.logout,
              text: 'Logout',
              fw: FontWeight.normal,
            )
          ],
        ),
      ),
    ));
  }
}
