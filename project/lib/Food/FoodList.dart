import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:project/Food/FoodBreakdown.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'FoodTile.dart';

class FoodList extends StatefulWidget {
  String title;
  Map<String, String> images;
  FoodList({this.title, this.images});

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  bool showvalue = false;
  @override
  Widget build(BuildContext context) {
    List<String> image_name = widget.images.keys.toList();
    // print(image_name);
    List<String> image_add = widget.images.values.toList();
    double w1 = MediaQuery.of(context).size.width / 2;
    double h1 = MediaQuery.of(context).size.height / 2;
    var val = 0;
    Function addVal(bool v) {
      int l = 0;
      if (v == true) {
        l = 1;
      } else {
        l = -1;
      }
      val = val + l;
      print(val);
    }

    Future<List<String>> getData() async {
      return Future.delayed(Duration(seconds: 2), () {
        _getData();
      });
    }

    return Scaffold(
      appBar: RoundedAppBar(widget.title),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: h1,
            width: w1 * (3 / 2),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffba2529),
                style: BorderStyle.solid,
                width: 1.0,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                scrollDirection: Axis.vertical,
                itemCount: widget.images.length,
                itemBuilder: (context, i) {
                  return FoodTile(image_add[i], image_name[i], (bool v) {
                    addVal(v);
                  }, h1);
                }),
          ),
          SizedBox(
            height: h1 / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  text: 'Past Record',
                  w: w1 / 2,
                  meth: () {
                    Navigator.push(context, PageRouteBuilder(
                        pageBuilder: (context, animation, animationTime) {
                      return Progress(Future.delayed(Duration(seconds: 2), () {
                        return _getData();
                      }));
                    }));
                  }),
              SizedBox(
                width: w1 / 10,
              ),
              Button(
                text: 'Save',
                w: w1 / 2,
                meth: () {
                  _addData(widget.title, val);
                  //  val = 0;
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

// Local Storage

// Get method

Future<List<String>> _getData() async {
  List<String> data_empty = ['0', '0', '0'];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> data = prefs.getStringList('data') ?? data_empty;
  await Future.delayed(Duration(milliseconds: 5));
  //return arr;
  print(data);
  return Future.value(data);
}

// Add Method

_addData(String cat, int val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> data = await _getData();
  if (cat == 'Unhealthy Food') {
    data[0] = (int.parse(data[0]) + val).toString();
  } else if (cat == 'Healthy Food') {
    data[1] = (int.parse(data[1]) + val).toString();
  } else {
    data[2] = (int.parse(data[2]) + val).toString();
  }
  prefs.setStringList('data', data);
  print(data);
}
