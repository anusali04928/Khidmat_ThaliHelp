import 'package:flutter/material.dart';
import 'package:project/Calculator.dart';
import 'package:project/roundedAppBar.dart';
import 'package:project/CustomBtn.dart';

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
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MainMenu(),
      //   '/second': (context) => Calculator(),
      // },
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
  Widget _currentPage = Menu();
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height / 8;
    double w1 = (MediaQuery.of(context).size.width) / 4;
    double hsmall = MediaQuery.of(context).size.height / 20;
    double wsmall = MediaQuery.of(context).size.width / 5;
/*
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
*/
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white, // add gradient here possibly
      //  extendBodyBehindAppBar: true,
      appBar: RoundedAppBar('Main Menu'), //AppBar
      body: _currentPage,
    ));
  }

/*
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
  */
}

/*
class CustomBtn extends StatelessWidget {
  double w;
  double h;
  IconData ic;
  String title;
  // Widget next;
  CustomBtn({this.h, this.w, this.ic, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[900],
      height: h,
      width: w,
      child: OutlineButton(
        onPressed: () {
          print('pushed');
        },
        child: Column(
          children: [Icon(ic), Text(title)],
        ),
      ),
    );
  }
}
*/

class Menu extends StatefulWidget {
  double h1, w1, hsmall, wsmall;

  Menu({this.h1, this.w1, this.hsmall, this.wsmall});
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(0, widget.h1 / 3, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          //Alarm Button
          Button(
            h: widget.h1,
            w: widget.w1 * 2.5,
            ic: Icons.alarm,
            text: 'Alarm',
          ),
          SizedBox(
            width: widget.w1 / 4,
            height: widget.h1 / 4,
          ),
          Container(
            padding:
                EdgeInsets.fromLTRB(widget.w1 / 1.2, 0, widget.w1 / 1.2, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Button(
                      h: widget.h1,
                      w: widget.w1,
                      ic: Icons.calculate,
                      text: "Calculator",
                      meth: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Calculator())),
                    ),
                    SizedBox(
                      width: widget.w1 / 4,
                      height: widget.h1 / 4,
                    ),
                    Button(
                      h: widget.h1,
                      w: widget.w1,
                      ic: Icons.calendar_today_outlined,
                      text: "Calender",
                    )
                  ],
                ),
                SizedBox(
                  width: widget.w1 / 4,
                  height: widget.h1 / 4,
                ),
                Column(
                  children: [
                    Button(
                      h: widget.h1,
                      w: widget.w1,
                      ic: Icons.radio,
                      text: "Radio",
                    ),
                    SizedBox(
                      width: widget.w1 / 4,
                      height: widget.h1 / 4,
                    ),
                    Button(
                      h: widget.h1,
                      w: widget.w1,
                      ic: Icons.phone,
                      text: "Phone",
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: widget.w1 / 6,
            height: widget.h1 / 6,
          ),
          Button(
            h: widget.hsmall,
            w: widget.wsmall,
            // ic: Icons.logout,
            text: 'Logout',
            fw: FontWeight.normal,
          )
        ],
      ),
    );
  }
}
