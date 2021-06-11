import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';

class MedicineDose extends StatelessWidget {
  String text;
  AssetImage im;
  String amount;
  MedicineDose(this.text, this.im, this.amount);

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height / 4;
    double w1 = (MediaQuery.of(context).size.width) / 2;
    return Scaffold(
        appBar: RoundedAppBar(text + ' Dose'), // same appBar as Main Menu.

        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: h1 / 2,
            ),
            Container(
              child: Image(
                image: im,
                height: h1,
                width: w1,
              ),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: h1 / 4,
            ),
            Container(
              child: Text(
                amount + 'mg',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: h1 / 6),
              ),
            ),
          ],
        )));
  }
}
