import 'package:flutter/material.dart';
import 'package:project/CustomBtn.dart';
import 'package:project/roundedAppBar.dart';

class Blood extends StatefulWidget {
  @override
  _BloodState createState() => _BloodState();
}

class _BloodState extends State<Blood> {
  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = (MediaQuery.of(context).size.width);
    return Scaffold(
        appBar: RoundedAppBar('Blood in ml'), // same appBar as Main Menu.

        body: Center(
            child: Stack(
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/blood_bag.png'),
                height: h1,
                width: w1,
              ),
              alignment: Alignment.center,
            ),
            Container(
              child: Text(
                '750 ml',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.fromLTRB(w1 / 2.35, h1 / 6.2, w1 / 3, 0),
            ),
          ],
        )));
  }
}
