import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double w;
  final double h;
  final double lp, rp, tp, bp;
  final String text;
  final double fontSize;
  final Function meth;
  final FontWeight fw;
  final Image im;
  IconData ic;

  Button(
      {this.h = 30.0,
      this.w = 80.0,
      this.lp = 0,
      this.bp = 0,
      this.tp = 0,
      this.rp = 0,
      this.text,
      this.fontSize = 14,
      this.meth,
      this.ic,
      this.fw = FontWeight.bold,
      this.im});

  @override
  Widget _icon(ic) {
    if (ic != null) {
      return Icon(
        ic,
        color: Color(0xffba2529),
        size: h / 2,
      );
    } else if (im != null) {
      return im;
    } else {
      return SizedBox(width: 0, height: 0);
    }
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(lp, tp, rp, bp),
      child: Container(
        height: h,
        width: w,
        child: GestureDetector(
          onTap: meth,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffba2529),
                style: BorderStyle.solid,
                width: 1.0,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Nunito',
                      fontSize: fontSize,
                      fontWeight: fw,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                _icon(ic),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
