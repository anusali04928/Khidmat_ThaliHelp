import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/Counter.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Medicine/Medicine_Dose.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';


class MedicineHistory extends StatefulWidget {
  String text;
  AssetImage im;
  String amount;
  MedicineHistory(this.text, this.im, this.amount);

  @override
  _MedicineHistoryState createState() => _MedicineHistoryState();
}

class _MedicineHistoryState extends State<MedicineHistory> {
  String _myActivity;
  String _myActivityResult;

  final formKey = new GlobalKey<FormState>();

  List<int> list = List.generate(100, (index) => index);
  @override
  
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  List<String> _data = ['data', 'data', 'data', 'data'];

  @override
  @override
  Widget build(BuildContext context) {
    double h1 = MediaQuery.of(context).size.height / 4;
    double w1 = (MediaQuery.of(context).size.width) / 1.4;
    return Scaffold(
        appBar: RoundedAppBar(widget.text), // same appBar as Main Menu.

        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: h1 / 4,
            ),
            Text(
              'History',
              style: TextStyle(fontSize: h1 / 10, fontWeight: FontWeight.w600),
            ),
            //////////////////////////
            /////////////////////////
            ///History//////////////
            //////////////////////
            Container(
              height: h1 / 1.2,
              width: w1 - w1 / 10,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffba2529),
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _data.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(h1 / 6, 0, h1 / 6, 0),
                      child: Column(children: [
                        SizedBox(
                          height: h1 / 10,
                        ),
                        Row(
                          children: [
                            Text(
                              _data[i],
                              style: TextStyle(
                                  fontSize: h1 / 10,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              width: w1 / 6,
                            ),
                            Text(_data[i],
                                style: TextStyle(
                                    fontSize: h1 / 10,
                                    fontWeight: FontWeight.normal)),
                            SizedBox(
                              width: w1 / 6,
                            ),
                            Text(_data[i],
                                style: TextStyle(
                                    fontSize: h1 / 10,
                                    fontWeight: FontWeight.normal)),
                          ],
                        )
                      ]),
                    );
                  }),
            ),

            Divider(
              height: h1 / 4,
              indent: w1 / 5,
              endIndent: w1 / 5,
            ),
            Column(
              children: [
                Text(
                  'Calculate dosage in mg:',
                  style:
                      TextStyle(fontSize: h1 / 10, fontWeight: FontWeight.w600),
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
                  width: w1 / 1.8,
                  height: h1 / 10,
                  child: Row(
                    children: [
                      Text(
                        'Enter weight:',
                        style: TextStyle(
                            fontSize: h1 / 10, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: w1 / 15,
                      ),
                      DropdownButton(
                        value: 1,
                        items: list.map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: h1 / 6,
                ),
                Button(
                  h: h1 / 5,
                  w: w1 / 2,
                  text: 'Calculate',
                  meth: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MedicineDose(
                              widget.text, widget.im, widget.amount))),
                ),
              ],
            )
          ],
        )));
  }
}
