import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';

// class TransfusionCalc extends StatefulWidget {
//   @override
//   _TransfusionCalc createState() => _TransfusionCalc();
// }

class TransfusionDose extends StatelessWidget {
  String amount;

  TransfusionDose(this.amount);

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height;
    double w1 = (MediaQuery.of(context).size.width);
    return Scaffold(
        appBar:
            RoundedAppBar('Transfusion dosage'), // same appBar as Main Menu.

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
                amount + ' ml', // make this a variable that is passed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SanFrancisco',
                  fontSize: 16,
                ),
                // textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.fromLTRB(w1 / 2.3, h1 / 6.2, w1 / 3, 0),
            ),
          ],
        )));
  }
}
