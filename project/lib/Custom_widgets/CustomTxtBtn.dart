// import 'dart:html';
import 'package:flutter/material.dart';

class TxtBtn extends StatelessWidget {
  final double w;
  final double h;
  final double lp, rp, tp, bp;
  final String title;
  final Function method;
  final FontWeight fw;
  final List<List<String>> subtitles;
  final double txtPad; //padding arg for the text widget

  TxtBtn({
    this.w = 80.0,
    this.h = 30.0,
    this.txtPad = 0,
    this.lp = 0,
    this.bp = 0,
    this.tp = 0,
    this.rp = 0,
    this.title,
    this.method,
    this.fw = FontWeight.bold,
    this.subtitles,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(lp, tp, rp, bp),
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 5.0,
                spreadRadius: 2.0,
                offset: Offset(
                  2.0,
                  2.0,
                ))
          ],
          border: Border.all(
            color: Color(0xffba2529),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: fw,
                            fontSize: 18,
                            fontFamily: 'SanFrancisco',
                            letterSpacing: 0.50,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    for (var i in subtitles)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          for (var j in i)
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, txtPad, 0, 0),
                              child: Text(
                                j,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: fw,
                                    fontSize: 14,
                                    fontFamily: 'SanFrancisco',
                                    letterSpacing: 0.25,
                                    color: Colors.black54),
                              ),
                            )
                        ],
                      )
                  ],
                ))),
      ),
    );
  }
}
