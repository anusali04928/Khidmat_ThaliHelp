import 'package:flutter/material.dart';
import 'package:project/CustomBtn.dart';
import 'package:project/roundedAppBar.dart';

class Medicine extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height / 8;
    double w1 = (MediaQuery.of(context).size.width) / 2;
    return Scaffold(
        appBar: RoundedAppBar('Medicine in ml'), // same appBar as Main Menu.

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Button(
                h: h1,
                w: w1,
                im: Image(
                  image: AssetImage('assets/Deferiprone_small.png'),
                  width: w1 / 2,
                  height: h1 / 2,
                ),
                text: '',
              ),
              Button(
                h: h1,
                w: w1,
                im: Image(
                  image: AssetImage('assets/Deferasirox.png'),
                  width: w1 / 2,
                  height: h1 / 2,
                ),
                text: '',
              ),
              Button(
                h: h1,
                w: w1,
                im: Image(
                  image: AssetImage('assets/Deferoxamine.png'),
                  width: w1 / 2,
                  height: h1 / 2,
                ),
                text: '',
              )
            ],
          ),
        ));
  }
}
