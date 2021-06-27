// the food progress page

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:project/Custom_widgets/roundedAppBar.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: RoundedAppBar('Progress'),
      body: Container(
        child: PieChart(
          // the PieChart package
          dataMap: sampleMap,
          animationDuration: Duration(milliseconds: 0),
          chartLegendSpacing: 22,
          chartRadius: w / 1.5,
          colorList: [
            Colors.green,
            Colors.yellow.shade700,
            Colors.red.shade700
          ],
          initialAngleInDegree: 45,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.bottom,
            showLegends: true,
            legendShape: BoxShape.rectangle,
            legendTextStyle: TextStyle(
              fontFamily: 'SanFrancisco',
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              decimalPlaces: 1,
              chartValueStyle: TextStyle(
                fontFamily: 'SanFrancisco',
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )),
        ),
      ),
    );
  }
}

// Sample hard coded data map that serves as input to the Pie Chart
// key is the category of food
// value is the total number of that type
// calculations and all done by the pie chart widget itself.
Map<String, double> sampleMap = {
  'Healthy': 50,
  'Take Care': 25,
  'Unhealthy': 25,
};
