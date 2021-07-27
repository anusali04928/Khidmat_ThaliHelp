import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:dio/dio.dart';

import 'FoodTile.dart';

class FoodList extends StatefulWidget {
  final String title;
  final Map<String, String> images;
  FoodList({this.title, this.images});

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  bool showvalue = false;

  /// Move this function to food types
  /// import 'package:dio/dio.dart';

  DateTime currentDate = DateTime.now();

//////////////////////////////////////////////////////////////////////////end
  Future goodpostData(int val) async {
    final String url = 'https://thalihelp.herokuapp.com/addtoarr';
    dynamic body = {
      'type': 'dailyintakegood',
      'id': '60dc4d9dd61ac5000426a323',
      'date': currentDate.year.toString() +
          '-' +
          '0' +
          currentDate.month.toString() +
          '-' +
          '0' +
          currentDate.day.toString(),
      'goodfoodcount': val.toDouble(),
    };
    var response = await Dio().put(
      url,
      data: body,
    );
    print(body);
    print(response);
  }

  Future badpostData(int val) async {
    final String url = 'https://thalihelp.herokuapp.com/addtoarr';
    dynamic body = {
      'type': 'dailyintakebad',
      'id': '60dc4d9dd61ac5000426a323',
      'date': currentDate.year.toString() +
          '-' +
          '0' +
          currentDate.month.toString() +
          '-' +
          '0' +
          currentDate.day.toString(),
      'badfoodcount': val.toDouble(),
    };
    var response = await Dio().put(
      url,
      data: body,
    );
    print(body);
    print(response);
  }

  Future avgpostData(int val) async {
    final String url = 'https://thalihelp.herokuapp.com/addtoarr';
    dynamic body = {
      'type': 'dailyintakeavg',
      'id': '60dc4d9dd61ac5000426a323',
      'date': currentDate.year.toString() +
          '-' +
          '0' +
          currentDate.month.toString() +
          '-' +
          '0' +
          currentDate.day.toString(),
      'avgfoodcount': val.toDouble(),
    };
    var response = await Dio().put(
      url,
      data: body,
    );
    print(body);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    List<String> image_name = widget.images.keys.toList();
    // print(image_name);
    List<String> image_add = widget.images.values.toList();
    double w1 = MediaQuery.of(context).size.width / 2;
    double h1 = MediaQuery.of(context).size.height / 2;
    var val = 0;
    void addVal(bool v) {
      int l = 0;
      if (v == true) {
        l = 1;
      } else {
        l = -1;
      }
      if (val <= 0 && l == -1) {
        val = 0;
      } else {
        val = val + l;
      }

      print(val);
    }

    return Scaffold(
      appBar: RoundedAppBar(widget.title),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: h1,
            width: w1 * 1.65,
            decoration: BoxDecoration(
              border: Border.all(
                // color: Color(0xffba2529),
                color: Colors.white,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Scrollbar(
                // isAlwaysShown: true,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: widget.images.length,
                    itemBuilder: (context, i) {
                      return FoodTile(image_add[i], image_name[i], (bool v) {
                        addVal(v);
                      }, h1);
                    })),
          ),
          SizedBox(
            height: h1 / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                text: 'Save',
                w: w1 / 2,
                meth: () {
                  if (widget.title == 'Unhealthy Food') {
                    badpostData(val);
                  } else if (widget.title == 'Healthy Food') {
                    goodpostData(val);
                  } else {
                    avgpostData(val);
                  }
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
/*
Future<List<String>> _getData() async {
  List<String> data_empty = ['0', '0', '0'];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> data = prefs.getStringList('data') ?? data_empty;
  await Future.delayed(Duration(milliseconds: 5));
  //return arr;
  print(data);
  return Future.value(data);
}
*/
// Add Method
/*
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
*/
