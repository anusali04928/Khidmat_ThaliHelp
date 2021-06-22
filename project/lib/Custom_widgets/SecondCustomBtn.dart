// this class is for the custom button found on the food types page
// this button has material ripple effects

import 'package:flutter/material.dart';

class RowButton extends StatelessWidget {
  final double w;
  final double h;
  final double lp, tp, rp, bp; // padding
  final String label;
  final Function method;
  final FontWeight fw;
  final double fsize;
  final Image im;
  final Color boxColor;

  // constructor
  RowButton({
    this.w = 80.0,
    this.h = 30.0,
    this.lp = 0,
    this.rp = 0,
    this.tp = 0,
    this.bp = 0,
    this.label = '',
    this.fsize = 11,
    this.fw = FontWeight.bold,
    this.im,
    this.method,
    this.boxColor,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(lp, tp, rp, bp),
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(
                2.0,
                2.0,
              ),
            )
          ],
          border: Border.all(
            color: boxColor,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Material(
          color: Colors.white.withOpacity(0.0),
          child: InkWell(
            splashColor: Colors.red.shade200,
            onTap: method,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: fw,
                      fontSize: fsize,
                      letterSpacing: 0.25,
                      fontFamily: 'SanFrancisco',
                    ),
                  ),
                ),
                im, // the asset image
              ],
            ),
          ),
        ),
      ),
    );
  }
}
