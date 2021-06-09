import 'package:flutter/material.dart';
import 'package:project/Calculator.dart';
import 'package:project/roundedAppBar.dart';

void main() {
  runApp(MyApp());
}

/*
the different functions which are mapped to the onpressed callbacks of the
different buttons in the main menu - we may use these helper functions for 
page navigation purposes.
*/

void alarm() {
  print('print Alarm');
}

void radio() {
  print('print Radio');
}

void phone() {
  print('print Phone');
}

void calendar() {
  print('print calendar');
}

void logout() {
  print('print logout');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MainMenu(),
      //   '/second': (context) => Calculator(),
      // },
      title: 'ThaliHelp',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // the custom widget builder for the 2nd and the 3rd rows
    Widget secondbtnSec = Container(
        margin: const EdgeInsets.only(top: 20),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                // the calculator button
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      // what follows is additional code for animated transition

                      // transitionDuration: Duration(seconds: 2),
                      // transitionsBuilder:
                      //     (context, animation, animationTime, child) {
                      //   animation = CurvedAnimation(
                      //       parent: animation, curve: Curves.elasticOut);
                      //   return ScaleTransition(
                      //     alignment: Alignment.center,
                      //     scale: animation,
                      //     child: child,
                      //   );
                      // },
                      pageBuilder: (context, animation, animationTime) {
                    return Calculator();
                  }));
                },
                splashColor: Colors.red.shade500,
                child: Container(
                  width: 100,
                  height: 65.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.red, width: 2.5),
                      borderRadius: BorderRadius.circular(12.25)),
                  child:
                      _buildMultiButton(Icons.calculate_outlined, 'Calculator'),
                ),
              ),
              InkWell(
                // adjacent to calculator
                onTap: () {
                  calendar();
                },
                splashColor: Colors.red.shade500,
                child: Container(
                  width: 100,
                  height: 65.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.red, width: 2.5),
                      borderRadius: BorderRadius.circular(12.25)),
                  child: _buildMultiButton(
                      Icons.calendar_today_outlined, 'Calendar'),
                ),
              )
            ],
          ),
          // separate the rows without padding.
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                // directly below the calculator
                onTap: () {
                  radio();
                },
                splashColor: Colors.red.shade500,
                child: Container(
                  width: 100,
                  height: 65.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.red, width: 2.5),
                      borderRadius: BorderRadius.circular(12.25)),
                  child: _buildMultiButton(Icons.radio_outlined, 'Radio'),
                ),
              ),
              InkWell(
                // diagonal to the calculator
                onTap: () {
                  phone();
                },
                splashColor: Colors.red.shade500,
                child: Container(
                  // margin: const EdgeInsets.only(top: 20),
                  width: 100,
                  height: 65.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.red, width: 2.5),
                      borderRadius: BorderRadius.circular(12.25)),
                  child: _buildMultiButton(Icons.call_end_outlined, 'Phone'),
                ),
              )
            ],
          ),
        ]));

    // the custom widget builder for the logout button
    Widget exitSec = Container(
        margin: const EdgeInsets.only(left: 115, right: 120, top: 20),
        width: 150.0,
        height: 75.0,
        decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.red, width: 2.5),
            borderRadius: BorderRadius.circular(12.25)),
        child: InkWell(
          onTap: () {
            logout();
          },
          splashColor: Colors.red.shade300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSingleBtn(Icons.logout_outlined, 'LogOut'),
            ],
          ),
        ));

    // the custom widget for the alarm button
    Widget alarmSec = Container(
        margin: const EdgeInsets.only(left: 115, right: 120, top: 20),
        width: 150.0,
        height: 75,
        decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(12.25)),
        child: InkWell(
          onTap: () {
            alarm();
          },
          splashColor: Colors.red.shade500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_buildSingleBtn(Icons.access_alarm_outlined, 'Alarm')],
          ),
        ));

    return Scaffold(
        backgroundColor: Colors.white, // add gradient here possibly
        extendBodyBehindAppBar: true,
        appBar: RoundedAppBar('Main Menu'), //AppBar
        body: ListView(
          children: [
            alarmSec,
            secondbtnSec,
            exitSec,
          ],
        ));
  }

  Container _buildSingleBtn(IconData icon, String label) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'SanFrancisco'),
          ),
        )
      ],
    ));
  }

  Column _buildMultiButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'SanFrancisco'),
          ),
        )
      ],
    );
  }
}
