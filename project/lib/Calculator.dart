import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Blood.dart';
import 'package:project/CustomBtn.dart';
import 'package:project/Medicine.dart';
import 'package:project/roundedAppBar.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height / 7;
    double w1 = (MediaQuery.of(context).size.width) / 2;

    return Scaffold(
      appBar: RoundedAppBar('Calculator'), // same appBar as Main Menu.

      body: Container(
        padding: EdgeInsets.fromLTRB(w1 / 2, h1, w1 / 2, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Button(
              h: h1,
              w: w1,
              text: 'Blood',
              ic: Icons.bloodtype_rounded,
              meth: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Blood())),
            ),
            SizedBox(
              height: h1 / 2,
            ),
            Button(
              h: h1,
              w: w1,
              text: 'Medicine',
              ic: Icons.medication,
              meth: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Medicine())),
            )
          ],
        ),
      ),
    );
  }
}
