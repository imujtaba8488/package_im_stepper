import 'package:flutter/material.dart';
import 'package:im_stepper/src/abc_stepper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool stepNext = false;
  bool stepPrevious = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ABCStepper(
                  stepRadius: 20,
                  spacing: 20,
                  steps: 5,
                  goNext: stepNext,
                  goPrevious: stepPrevious,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    stepNext = false;
                    stepPrevious = true;
                  });
                },
                child: Text('Previous'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    stepPrevious = false;
                    stepNext = true;
                  });
                },
                child: Text('Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
