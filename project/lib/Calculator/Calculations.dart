import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/Blood/TransfusionCalc.dart';
import 'package:project/Custom_widgets/Counter.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Medicine/Medicine_Dose.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class Calculations extends StatefulWidget {
  final String text;
  final AssetImage im;
  final String amount;
  final bool check;
  final String label;

  // constructor
  Calculations(
    this.text,
    this.im,
    this.amount,
    this.check,
    this.label,
  );

  @override
  State<Calculations> createState() => _Calculations();
  // _MedicineHistoryState createState() => _MedicineHistoryState();
}

class _Calculations extends State<Calculations> {
  // String _myActivity;
  // String _myActivityResult;

  // final formKey = new GlobalKey<FormState>();

  List<int> weightList = List.generate(100, (index) => index); // weight cmb
  List<int> doseList = [10, 20, 30, 40]; // dose cmb

  int dropdownValue1; // the weight cmb value
  int dropdownValue2; // the does cmb value

  bool isButtonDisabled;

  @override
  void initState() {
    super.initState();
    dropdownValue1 = null;
    dropdownValue2 = null;
    isButtonDisabled = true;
  }

  // _saveForm() {
  //   var form = formKey.currentState;
  //   if (form.validate()) {
  //     form.save();
  //     setState(() {
  //       _myActivityResult = _myActivity;
  //     });
  //   }
  // }

  /*
  Helper function that helps in disabling/enabling the calculate button.
  This is useful in handling calculations where no selections have been made.
  */
  bool selectionCheck() {
    if (widget.text.contains('Transfusion')) // blood calc
    {
      if (dropdownValue1 != null) {
        return true;
      }

      return false;
    } else // drug calc
    {
      if (dropdownValue1 != null && dropdownValue2 != null) {
        return true;
      }

      return false;
    }
  }

  /*
  This is a helper function that calculates the value based on the relevant
  formula and then transitions to the relevant page. No checks for selections
  are needed since that is done thanks to the enabling/diabling of the
  calculate button. 
  */
  int calculateValue() {
    int value;
    switch (widget.text) {
      case 'Deferiprone':
        {
          value = dropdownValue1 * dropdownValue2 * 2;
        }
        break;

      case 'Deferasirox':
        {
          value = dropdownValue1 * dropdownValue2 * 3;
        }
        break;

      case 'Deferoxamine':
        {
          value = dropdownValue1 * dropdownValue2 * 4;
        }
        break;

      case 'Blood Transfusion':
        {
          value = dropdownValue1 * 5;
        }
        break;
    }

    return value;
  }

  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height / 4;
    double w1 = (MediaQuery.of(context).size.width) / 1.4;
    return Scaffold(
      appBar: RoundedAppBar(widget.text), // same appBar as Main Menu.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.label,
              style: TextStyle(
                fontSize: h1 / 10,
                fontWeight: FontWeight.w600,
                fontFamily: 'SanFrancisco',
              ),
            ),
            Image(
              image: widget.im,
              height: h1 / 2,
              width: w1 / 2,
            ),
            SizedBox(
              height: h1 / 14,
            ),
            Container(
              width: w1,
              height: h1 / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Weight (kg):',
                    style: TextStyle(
                      fontSize: h1 / 10,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SanFrancisco',
                    ),
                  ),
                  SizedBox(
                    width: w1 / 15,
                  ),

                  // the weight dropdown button
                  DropdownButton(
                    value: dropdownValue1,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 18,
                    hint: Text(
                      'Select value',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    iconEnabledColor: Colors.red,
                    elevation: 16,
                    isExpanded: false,
                    isDense: true,
                    onChanged: (int newValue) {
                      setState(() {
                        dropdownValue1 = newValue;
                        bool selectState = selectionCheck();

                        if (selectState) {
                          isButtonDisabled = false;
                        }
                      });
                    },
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SanFrancisco',
                      fontSize: 16,
                    ),
                    underline: Container(
                      // padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      height: 2,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                      ),
                    ),
                    items: weightList.map<DropdownMenuItem<int>>((
                      int value,
                    ) {
                      return DropdownMenuItem<int>(
                          value: value,
                          child: Center(
                            child: new Text(
                              value.toString(),
                              style: TextStyle(
                                fontFamily: 'San Francisco',
                              ),
                            ),
                          ));
                    }).toList(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h1 / 8,
            ),

            /*
            Check if this a blood or drug calc page hence conditionally add the 
            2nd dropdown button row.
            */
            widget.check == true
                ? new Container(
                    width: w1,
                    height: h1 / 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dosage (mg/kg):',
                          style: TextStyle(
                            fontSize: h1 / 10,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SanFrancisco',
                          ),
                        ),
                        SizedBox(
                          width: w1 / 20,
                        ),

                        // the dosage dropdownbutton
                        new DropdownButton(
                            value: dropdownValue2,
                            hint: Text(
                              'Select value',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 18,
                            iconEnabledColor: Colors.red,
                            elevation: 16,
                            isExpanded: false,
                            isDense: true,
                            onChanged: (int newValue) {
                              setState(() {
                                dropdownValue2 = newValue;
                                bool selectState = selectionCheck();

                                if (selectState) {
                                  isButtonDisabled = false;
                                }
                              });
                            },
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'SanFrancisco',
                              fontSize: 16,
                            ),
                            underline: Container(
                              // padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              height: 2,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                            items: doseList.map<DropdownMenuItem<int>>((
                              int value,
                            ) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(
                                  value.toString(),
                                ),
                              );
                            }).toList())
                      ],
                    ),
                  )
                : new Container(
                    // null widget that occupies min space
                    width: 0.0,
                    height: 0.0,
                  ),
            SizedBox(
              height: h1 / 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                    width: w1 / 3,
                    height: h1 / 5,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          dropdownValue1 = null;
                          dropdownValue2 = null;
                          isButtonDisabled = true;
                        });
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SanFrancisco',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shadowColor: Colors.blueGrey,
                        elevation: 5,
                        shape: new RoundedRectangleBorder(
                          side: BorderSide(
                            // width: ,
                            color: Color(0xffba2529),
                            // width: w1 / 2,
                          ),
                          borderRadius: new BorderRadius.circular(
                            20.0,
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: w1 / 3,
                  height: h1 / 5,
                  child: ElevatedButton(
                    onPressed: isButtonDisabled == false
                        ? () {
                            int res = calculateValue();

                            setState(() {
                              dropdownValue1 = null;
                              dropdownValue2 = null;
                              isButtonDisabled = true;
                            });

                            if (widget.text.contains('Transfusion')) {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, animationTime) {
                                    return TransfusionDose(
                                      res.toString(),
                                    );
                                  },
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, animationTime) {
                                    return MedicineDose(
                                      widget.text,
                                      widget.im,
                                      res.toString(),
                                    );
                                  },
                                ),
                              );
                            }
                          }
                        : null,
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SanFrancisco',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shadowColor: Colors.blueGrey,
                      elevation: 5,
                      shape: new RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xffba2529),
                        ),
                        borderRadius: new BorderRadius.circular(
                          20.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Text(
//   'History',
//   style: TextStyle(fontSize: h1 / 10, fontWeight: FontWeight.w600),
// ),
// //////////////////////////
// /////////////////////////
// ///History//////////////
// //////////////////////
// Container(
//   height: h1 / 1.2,
//   width: w1 - w1 / 10,
//   decoration: BoxDecoration(
//     border: Border.all(
//       color: Color(0xffba2529),
//       style: BorderStyle.solid,
//       width: 1.0,
//     ),
//     color: Colors.transparent,
//     borderRadius: BorderRadius.circular(20.0),
//   ),
//   child: ListView.builder(
//       scrollDirection: Axis.vertical,
//       itemCount: _data.length,
//       itemBuilder: (context, i) {
//         return Container(
//           padding: EdgeInsets.fromLTRB(h1 / 6, 0, h1 / 6, 0),
//           child: Column(children: [
//             SizedBox(
//               height: h1 / 10,
//             ),
//             Row(
//               children: [
//                 Text(
//                   _data[i],
//                   style: TextStyle(
//                       fontSize: h1 / 10,
//                       fontWeight: FontWeight.normal),
//                 ),
//                 SizedBox(
//                   width: w1 / 6,
//                 ),
//                 Text(_data[i],
//                     style: TextStyle(
//                         fontSize: h1 / 10,
//                         fontWeight: FontWeight.normal)),
//                 SizedBox(
//                   width: w1 / 6,
//                 ),
//                 Text(_data[i],
//                     style: TextStyle(
//                         fontSize: h1 / 10,
//                         fontWeight: FontWeight.normal)),
//               ],
//             )
//           ]),
//         );
//       }),
// ),

// Divider(
//   height: h1 / 4,
//   indent: w1 / 5,
//   endIndent: w1 / 5,
// ),
