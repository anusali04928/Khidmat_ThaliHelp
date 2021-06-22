import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Medicine/Medicine_Dose.dart';
import 'package:project/Medicine/Medicine_History.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';

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
                    image: AssetImage('assets/Deferiprone.png'),
                    width: w1 / 2,
                    height: h1 / 2,
                  ),
                  text: 'Deferiprone',
                  meth: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MedicineHistory(
                              'Deferiprone',
                              AssetImage('assets/Deferiprone_big.png'),
                              1600.toString())))),

                              
              SizedBox(height: h1 / 4),
              Button(
                h: h1,
                w: w1,
                im: Image(
                  image: AssetImage('assets/Deferasirox.png'),
                  width: w1 / 2,
                  height: h1 / 2,
                ),
                text: 'Deferasirox',
                meth: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MedicineHistory(
                            'Deferasirox',
                            AssetImage('assets/Deferasirox.png'),
                            1600.toString()))),
              ),
              SizedBox(height: h1 / 4),
              Button(
                h: h1,
                w: w1,
                im: Image(
                  image: AssetImage('assets/Deferoxamine.png'),
                  width: w1 / 2,
                  height: h1 / 2,
                ),
                text: 'Deferoxamine',
                meth: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MedicineHistory(
                            'Deferoxamine',
                            AssetImage('assets/Deferoxamine_big.png'),
                            1600.toString()))),
              )
            ],
          ),
        ));
  }
}
