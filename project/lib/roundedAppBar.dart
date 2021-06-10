/*
Custom class for the rounded App Bar displayed on the Main Menu
page.
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  RoundedAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth * 8;
          return OverflowBox(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            child: Container(
              // color: Colors.white,
              height: width,
              width: width,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: width / 2 - preferredSize.height / 2),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 1.0),
                        end: Alignment(0.0, 00),
                        //stops: [0.3, 0.6, 1],
                        colors: <Color>[
                          Color(0xff9B2821),
                          Color(0xffba2529),
                          Color(0xffd82334),
                          Color(0xffDD2130),
                          Color(0xffDD2130),
                          Color(0xffDD2130),
                          Color(0xffDD2126),
                        ],
                      ),
                      color: Color(0xff9B2821),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            offset: Offset(0, 3))
                      ]),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [BoxShadow(color: Colors.blueGrey)]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200);
}
