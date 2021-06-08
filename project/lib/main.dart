import 'package:flutter/material.dart';
import 'package:project/roundedAppBar.dart';

void main() {
  runApp(MyApp());
}

/*
the different functions which are mapped to the onpressed callbacks of the
different buttons in the main menu.
*/
// void calculator() {
//   print('print Calculator');
// }

// void calculator() {
//   print('print Calculator');
// }

// void calculator() {
//   print('print Calculator');
// }

// void calculator() {
//   print('print Calculator');
// }

// void calculator() {
//   print('print Calculator');
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;

    // the custom widget builder for the 2nd the third rows
    Widget buttonSection = Container(
      // width: 50,
      // height: 75.0,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        ],
      ),
    );

    // the custom widget builder for the logout button
    Widget exitSection = Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.logout, 'LOGOUT'),
          // _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        ],
      ),
    );

    // the custom widget for the alarm feature
    Widget AlarmButton = GestureDetector(
        onTap: () {
          print('Alarm'); // to check alarm button press
        },
        child: Container(
          margin: const EdgeInsets.only(left: 115, right: 120),
          width: 150.0,
          height: 75,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(8.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_buildCustomAlarm()],
          ),
        ));

    return Scaffold(
        backgroundColor: Colors.white, // add gradient here possibly
        extendBodyBehindAppBar: true,
        appBar: RoundedAppBar('Main Menu'), //AppBar
        body: ListView(
          children: [
            // titleSection,
            AlarmButton,
            buttonSection,
            buttonSection,
            exitSection
          ],
        ));
  }

  Column _buildCustomAlarm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.alarm_add_rounded,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            'ALARM',
            style: TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(fixedSize: Size(100, 75)),
            onPressed: () {
              print('Hello World');
            },
            icon: Icon(icon, color: color),
            label: Text(
              label,
              style: TextStyle(fontSize: 12),
            ))
        // Icon(icon, color: color),
        // Container(
        //   margin: const EdgeInsets.only(top: 8),
        //   child: Text(
        //     label,
        //     style: TextStyle(
        //       fontSize: 12,
        //       fontWeight: FontWeight.w400,
        //       color: color,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     Text(
//       'You have pushed the button this many times:',
//     ),
//     Text(
//       '$_counter',
//       style: Theme.of(context).textTheme.headline4,
//     ),
//   ],
// ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
