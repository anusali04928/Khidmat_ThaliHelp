// this class represents the food types page

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';
import 'package:project/Custom_widgets/SecondCustomBtn.dart';
import 'package:project/Food/FoodList.dart';

class FoodTypes extends StatelessWidget {
  Map<String, String> avoid_food = {
    'Candy': 'assets/not_healthy/candy.PNG',
    'Cheerries': 'assets/not_healthy/cheerries.PNG',
    'Chips': 'assets/not_healthy/chips.PNG',
    'Choclate': 'assets/not_healthy/choclate.PNG',
    'Drinks': 'assets/not_healthy/drinks.PNG',
    'Halwa puri': 'assets/not_healthy/halwa puri.PNG',
    'Jamjelly': 'assets/not_healthy/jamjelly.PNG',
    'Junk food': 'assets/not_healthy/junk food.PNG',
    'Mithai': 'assets/not_healthy/mithai.PNG',
    'Noodles': 'assets/not_healthy/noodles.PNG',
    'Parsley': 'assets/not_healthy/parsley.PNG',
    'Pomegranate': 'assets/not_healthy/pomegranate.PNG',
    'Samosa': 'assets/not_healthy/samosa.PNG',
    'Snacks': 'assets/not_healthy/snacks.PNG'
  };
  Map<String, String> careful_food = {
    'Beans': 'assets/moderate_food/beans.PNG',
    'Beef': 'assets/moderate_food/beef.PNG',
    'Biscuits': 'assets/moderate_food/biscuits.PNG',
    'Burger': 'assets/moderate_food/burger.PNG',
    'Cakes': 'assets/moderate_food/cakes.PNG',
    'Chickpeas': 'assets/moderate_food/chickpeas.PNG',
    'Dahi baray': 'assets/moderate_food/dahi baray.PNG',
    'Dates': 'assets/moderate_food/dates.PNG',
    'Fries': 'assets/moderate_food/fries.PNG',
    'Fruits not eat': 'assets/moderate_food/fruits not eat.PNG',
    'Iecream': 'assets/moderate_food/iecream.PNG',
    'Nuggets': 'assets/moderate_food/nuggets.PNG',
    'Rusk': 'assets/moderate_food/rusk.PNG',
    'Sandwich': 'assets/moderate_food/sandwich.PNG',
    'Tea coffee': 'assets/moderate_food/tea coffee.PNG'
  };
  Map<String, String> recc_food = {
    'Bread': 'assets/healthy_food/bread.PNG',
    'Butter': 'assets/healthy_food/butter.PNG',
    'Cereal': 'assets/healthy_food/cereal.PNG',
    'Cheese': 'assets/healthy_food/cheese.PNG',
    'Chicken': 'assets/healthy_food/chicken.PNG',
    'Eggs': 'assets/healthy_food/eggs.PNG',
    'Fish': 'assets/healthy_food/fish.PNG',
    'Fruits': 'assets/healthy_food/fruits.PNG',
    'Milkshake': 'assets/healthy_food/milkshake.PNG',
    'Nuts': 'assets/healthy_food/nuts.PNG',
    'Oliveoil': 'assets/healthy_food/oliveoil.PNG',
    'Pulses': 'assets/healthy_food/pulses.PNG',
    'Rice': 'assets/healthy_food/rice.PNG',
    'Veggiessss': 'assets/healthy_food/veggiessss.PNG',
    'Yughurt': 'assets/healthy_food/yughurt.PNG'
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
              label: 'Food items that you should take care',
              fw: FontWeight.bold,
              fsize: 14,
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
