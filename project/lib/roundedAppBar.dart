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
    return PreferredSize(
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
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 0.6, 1],
                          colors: [
                            Colors.white,
                            Colors.redAccent,
                            Colors.red[900]
                          ],
                        ),
                        color: Colors.redAccent,
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
                          fontFamily: 'SanFrancisco',
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
        preferredSize: preferredSize);
  }

  @override
  Size get preferredSize => Size.fromHeight(200);
}
