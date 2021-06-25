import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';

class FoodList extends StatelessWidget {
  String title;
  List<String> images;
  FoodList({this.title, this.images});

  @override
  Widget build(BuildContext context) {
    double w1 = MediaQuery.of(context).size.width / 2;
    double h1 = MediaQuery.of(context).size.height / 5;

    return Scaffold(
      appBar: RoundedAppBar(title),
      body: Container(
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
            itemCount: images.length,
            itemBuilder: (context, i) {
              return Container();
            }),
      ),
    );
  }
}
