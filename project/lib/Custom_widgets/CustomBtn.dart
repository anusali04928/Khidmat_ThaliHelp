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
  final IconData ic;

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

  Widget _icon(ic) {
    if (ic != null) {
      return Column(
        children: [
          SizedBox(
            height: 2,
          ),
          Icon(
            ic,
            color: Color(0xffba2529),
            size: h / 2,
          ),
        ],
      );
    } else if (im != null) {
      return Column(
        children: [
          SizedBox(
            height: 2,
          ),
          im,
        ],
      );
    } else {
      return SizedBox(width: 0, height: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(lp, tp, rp, bp),
        height: h + 5,
        width: w,
        decoration: BoxDecoration(
          boxShadow: [
            //background color of box
            BoxShadow(
              color: Colors.black38,
              blurRadius: 1.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                2.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          border: Border.all(
            color: Color(0xffba2529),
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Material(
          color: Colors.white.withOpacity(0.0),
          child: InkWell(
            splashColor: Colors.red.shade400,
            onTap: meth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SanFrancisco',
                      fontSize: fontSize,
                      fontWeight: fw,
                      letterSpacing: 0.25,
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
