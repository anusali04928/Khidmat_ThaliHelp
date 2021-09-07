// this class represents the food types page

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/CustomBtn.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:project/Custom_widgets/SecondCustomBtn.dart';
import 'package:project/Food/FoodBreakdown.dart';
import 'package:project/Food/FoodList.dart';
import 'package:dio/dio.dart';
import 'package:project/models/DietResp.dart';

class FoodTypes extends StatelessWidget {
  Future<List<double>> getDatafromServer() async {
    dynamic param = {'id': '60dc4d9dd61ac5000426a323'};
    try {
      var response = await Dio().get(
          'https://thalihelp.herokuapp.com/getmonthlyintake',
          queryParameters: param);

      var resp = DietResp.fromJson(jsonDecode(response.toString()));
      List<double> res = [
        resp.healthy.toDouble(),
        resp.unhealthy.toDouble(),
        resp.avoid.toDouble()
      ];

      return res;
    } catch (e) {
      return e;
    }
  }

  final Map<String, String> avoid_food = {
    'Candy': 'assets/not_healthy/candy.jpg',
    'Cherries': 'assets/not_healthy/cherries.jpg',
    'Chips': 'assets/not_healthy/chips.jpg',
    'Chocolate': 'assets/not_healthy/chocolate.jpg',
    'Soft Drinks': 'assets/not_healthy/softdrinks.jpg',
    'Halwa Puri': 'assets/not_healthy/halwapuri.jpg',
    'Jam/Jelly': 'assets/not_healthy/jam.jpg',
    'Junk food': 'assets/not_healthy/junkfood.jpg',
    'Sweets': 'assets/not_healthy/sweets.jpg',
    'Noodles': 'assets/not_healthy/noodles.jpg',
    'Parsley': 'assets/not_healthy/parsley.jpg',
    'Pomegranate': 'assets/not_healthy/pomegranate.jpg',
    'Samosa': 'assets/not_healthy/samosa.jpg',
    'Snacks': 'assets/not_healthy/snacks.jpg'
  };
  final Map<String, String> careful_food = {
    'Beans': 'assets/moderate_food/beans.jpg',
    'Beef': 'assets/moderate_food/beef.jpg',
    'Biscuits': 'assets/moderate_food/biscuits.jpg',
    'Burger': 'assets/moderate_food/burger.jpg',
    'Cakes': 'assets/moderate_food/cake.jpg',
    'Chickpeas': 'assets/moderate_food/chickpea.jpg',
    'Dahi Baray': 'assets/moderate_food/dahibaray.jpg',
    'Dates': 'assets/moderate_food/dates.jpg',
    'French Fries': 'assets/moderate_food/fries.jpg',
    'Fruits (Bad)': 'assets/moderate_food/fruits.jpg',
    'Iecream': 'assets/moderate_food/icecream.jpg',
    'Nuggets': 'assets/moderate_food/nuggets.jpg',
    'Cake Rusk': 'assets/moderate_food/rusk.png',
    'Sandwich': 'assets/moderate_food/sandwich.jpg',
    'Tea coffee': 'assets/moderate_food/tea.jpg'
  };
  final Map<String, String> recc_food = {
    'Bread': 'assets/healthy_food/bread.jpg',
    'Butter': 'assets/healthy_food/butter.jpg',
    'Cereal': 'assets/healthy_food/cereal.jpg',
    'Cheese': 'assets/healthy_food/cheese.jpg',
    'Chicken': 'assets/healthy_food/chicken.jpg',
    'Eggs': 'assets/healthy_food/eggs.jpg',
    'Fish': 'assets/healthy_food/fish.jpg',
    'Fruits': 'assets/healthy_food/fruits.jpg',
    'Milkshake': 'assets/healthy_food/milkshake.jpg',
    'Nuts': 'assets/healthy_food/nuts.jpg',
    'Olive Oil': 'assets/healthy_food/oliveoil.jpg',
    'Pulses': 'assets/healthy_food/pulses.jpg',
    'Rice': 'assets/healthy_food/rice.jpg',
    'Vegetable': 'assets/healthy_food/vegetable.jpg',
    'Yogurt': 'assets/healthy_food/yogurt.jpg'
  };
  @override
  Widget build(BuildContext context) {
    double w1 = MediaQuery.of(context).size.width / 2;
    double h1 = MediaQuery.of(context).size.height / 7;

    return Scaffold(
      appBar: RoundedAppBar('Food Types'),
      body: Container(
        padding: EdgeInsets.fromLTRB(w1 / 3.5, h1, w1 / 3.5, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RowButton(
              // the healthy food type
              h: h1 / 2,
              w: w1 * 3,
              label: 'Healthy Foods',
              fw: FontWeight.bold,
              fsize: 16,
              boxColor: Colors.green,
              im: Image(
                image: AssetImage('assets/check.png'),
                width: w1 / 3,
                height: h1 / 3,
              ),
              method: () => Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation, animationTime) {
                return FoodList(
                  title: 'Healthy Food',
                  images: recc_food,
                );
              })),
            ),
            SizedBox(
              height: h1 / 4,
            ),
            RowButton(
              // the alarming food widget - yellow
              h: h1 / 2,
              w: w1 * 3,
              label: 'Moderately Healthy Foods',
              fw: FontWeight.bold,
              fsize: 16,
              boxColor: Colors.yellow.shade700,
              im: Image(
                image: AssetImage('assets/question.png'),
                width: w1 / 4,
                height: h1 / 3,
              ),
              method: () => Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation, animationTime) {
                return FoodList(
                  title: 'Moderately Healthy Food',
                  images: careful_food,
                );
              })),
            ),
            SizedBox(
              height: h1 / 4,
            ),
            RowButton(
              // the unheathy food button
              h: h1 / 2,
              w: w1 * 3,
              label: 'Unhealthy Foods',
              fw: FontWeight.bold,
              fsize: 16,
              boxColor: Colors.red.shade700,
              im: Image(
                image: AssetImage('assets/cross.png'),
                height: h1 / 3,
                width: w1 / 3,
              ),
              method: () => Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, animationTime) {
                  return FoodList(
                    title: 'Unhealthy Food',
                    images: avoid_food,
                  );
                }),
              ),
            ),
            SizedBox(
              height: 95,
            ),
            Button(
                text: 'Past Record',
                w: w1 / 2,
                meth: () {
                  getDatafromServer();
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, animationTime) {
                    return Progress(Future.delayed(Duration(seconds: 1), () {
                      return getDatafromServer();
                    }));
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
