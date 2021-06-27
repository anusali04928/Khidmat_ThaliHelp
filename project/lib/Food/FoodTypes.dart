// this class represents the food types page

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:project/Custom_widgets/SecondCustomBtn.dart';
import 'package:project/Food/FoodList.dart';

class FoodTypes extends StatelessWidget {
  Map<String, String> avoid_food = {
    'Burger': 'assets/avoid_food/burger.png',
    'Cherries': 'assets/avoid_food/cherries.png',
    'Chips': 'assets/avoid_food/chips.png',
    'Chocolate': 'assets/avoid_food/chocolate.png',
    'Coffee': 'assets/avoid_food/coffeee.png',
    'Cold Drinks': 'assets/avoid_food/cold drinks.png',
    'Dahi Baray': 'assets/avoid_food/dahi baray.png',
    'Halwapuri': 'assets/avoid_food/halwapuri.png',
    'Jam Jelly': 'assets/avoid_food/jam jelly.png',
    'Junk Food': 'assets/avoid_food/junk food.png',
    'Mithai': 'assets/avoid_food/mithai sweets.png',
    'Noodles': 'assets/avoid_food/noodles.png',
    'Nuggets': 'assets/avoid_food/nuggets.png',
  };
  Map<String, List> careful_food = {};
  Map<String, String> recc_food = {
    'Butter': 'assets/recc_food/butter.png',
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
              label: 'Food items that are healthy for you',
              fw: FontWeight.bold,
              fsize: 14,
              boxColor: Colors.green,
              im: Image(
                image: AssetImage('assets/check.png'),
                width: w1 / 3,
                height: h1 / 3,
              ),
              method: () {
                print('Hello Wolrd');
                //TODO: Healthy Food Transition
              },
            ),
            SizedBox(
              height: h1 / 4,
            ),
            RowButton(
              // the alarming food widget - yellow
              h: h1 / 2,
              w: w1 * 3,
              label: 'Food items that you should take care',
              fw: FontWeight.bold,
              fsize: 14,
              boxColor: Colors.yellow.shade700,
              im: Image(
                image: AssetImage('assets/question.png'),
                width: w1 / 4,
                height: h1 / 3,
              ),
              method: () {
                print('Hello World'); //TODO: Alarming Food Page Transition
              },
            ),
            SizedBox(
              height: h1 / 4,
            ),
            RowButton(
                // the unheathy food button
                h: h1 / 2,
                w: w1 * 3,
                label: 'Food items that should be avoided',
                fw: FontWeight.bold,
                fsize: 14,
                boxColor: Colors.red.shade700,
                im: Image(
                  image: AssetImage('assets/cross.png'),
                  height: h1 / 3,
                  width: w1 / 3,
                ),
                method: () => Navigator.push(context, PageRouteBuilder(
                        pageBuilder: (context, animation, animationTime) {
                      return FoodList(
                        title: 'Unhealthy Food',
                        images: avoid_food,
                      );
                    }))
                // TODO: Unhealthy food page transition

                )
          ],
        ),
      ),
    );
  }
}
