import 'package:flutter/material.dart';

import 'package:im_stepper/stepper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
        body: NumberStepper(
          stepRadius: 12.0,
          numbers: [1, 2, 3, 4, 5, 6],
          // direction: Axis.vertical,
          numberStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
