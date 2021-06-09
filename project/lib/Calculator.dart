import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/roundedAppBar.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buttonSection = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50,
          ),
          _buildBtnRow(Icons.bloodtype_outlined, 'Blood Calculator'),
          SizedBox(
            height: 30,
          ),
          _buildBtnRow(Icons.medication_outlined, 'Drug Calculator')
        ],
      ),
    );

    return Scaffold(
      appBar: RoundedAppBar('Calculator'), // same appBar as Main Menu.
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Text('Back!'),
      //   ),
      // ),

      /*
      The layout for this page is simply a 2x1 matrix -  this is simply
      constructed by a single Column housing two rows which in themselves are a
      2x1 matrix and so are built using a bottom-up approach. 
      */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [buttonSection],
      ),
    );
  }

  Column _buildBtnCol(IconData icon, String label) {
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
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'SanFrancisco'),
          ),
        )
      ],
    );
  }

  Row _buildBtnRow(IconData icon, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            print('button pressed');
          },
          splashColor: Colors.red.shade500,
          child: Container(
            width: 150.0,
            height: 100.0,
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.red, width: 2.5),
                borderRadius: BorderRadius.circular(12.25)),
            child: _buildBtnCol(icon, label),
          ),
        )
      ],
    );
  }
}
