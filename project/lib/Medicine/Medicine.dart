import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/CustomTxtBtn.dart';
import 'package:project/Calculator/Calculations.dart';
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
    String label = 'Calculate dosage in mg:';
    return Scaffold(
        appBar:
            RoundedAppBar('Medicine Selection'), // same appBar as Main Menu.

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              TxtBtn(
                h: h1,
                w: w1,
                fw: FontWeight.bold,
                title: 'Deferiprone',
                txtPad: 5,
                subtitles: [
                  ['Ferinil', 'Kelfer'],
                ],
                method: () => Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, animation, animationTime) {
                  return Calculations(
                    'Deferiprone',
                    AssetImage('assets/Deferiprone_big.png'),
                    1600.toString(),
                    true,
                    label,
                  );
                })),
              ),
              // Button(
              //     h: h1,
              //     w: w1,
              //     im: Image(
              //       image: AssetImage('assets/Deferiprone.png'),
              //       width: w1 / 2,
              //       height: h1 / 2,
              //     ),
              //     text: 'Deferiprone',
              //     meth: () => Navigator.push(context, PageRouteBuilder(
              //             pageBuilder: (context, animation, animationTime) {
              //           return Calculations(
              //               'Deferiprone',
              //               AssetImage('assets/Deferiprone_big.png'),
              //               1600.toString());
              //         }))),

              SizedBox(height: h1 / 4),
              TxtBtn(
                  h: h1 * 1.5,
                  w: w1,
                  fw: FontWeight.bold,
                  title: 'Deferasirox',
                  subtitles: [
                    [
                      'Asunrg',
                      'Arefed',
                    ],
                    ['Oleptiss'],
                    [
                      'Oderox',
                      'Effesir',
                    ],
                  ],
                  txtPad: 5,
                  method: () => Navigator.push(context, PageRouteBuilder(
                          pageBuilder: (context, animation, animationTime) {
                        return Calculations(
                          'Deferasirox',
                          AssetImage('assets/Deferasirox.png'),
                          1600.toString(),
                          true,
                          label,
                        );
                      }))),

              // Button(
              //     h: h1,
              //     w: w1,
              //     im: Image(
              //       image: AssetImage('assets/Deferasirox.png'),
              //       width: w1 / 2,
              //       height: h1 / 2,
              //     ),
              //     text: 'Deferasirox',
              //     meth: () => Navigator.push(context, PageRouteBuilder(
              //             pageBuilder: (context, animation, animationTime) {
              //           return Calculations(
              //               'Deferasirox',
              //               AssetImage('assets/Deferasirox.png'),
              //               1600.toString());
              //         }))),
              SizedBox(height: h1 / 4),
              TxtBtn(
                  h: h1,
                  w: w1,
                  fw: FontWeight.bold,
                  title: 'Deferoxamine',
                  subtitles: [
                    [
                      'Desferal',
                    ]
                  ],
                  txtPad: 5,
                  method: () => Navigator.push(context, PageRouteBuilder(
                          pageBuilder: (context, animation, animationTime) {
                        return Calculations(
                          'Deferoxamine',
                          AssetImage('assets/Deferoxamine_big.png'),
                          1600.toString(),
                          true,
                          label,
                        );
                      }))),
              // Button(
              //     h: h1,
              //     w: w1,
              //     im: Image(
              //       image: AssetImage('assets/Deferoxamine.png'),
              //       width: w1 / 2,
              //       height: h1 / 2,
              //     ),
              //     text: 'Deferoxamine',
              //     meth: () => Navigator.push(context, PageRouteBuilder(
              //             pageBuilder: (context, animation, animationTime) {
              //           return Calculations(
              //               'Deferoxamine',
              //               AssetImage('assets/Deferoxamine_big.png'),
              //               1600.toString());
              //         }))),
            ],
          ),
        ));
  }
}
