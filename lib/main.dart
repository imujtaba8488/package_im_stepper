import 'package:flutter/material.dart';

import 'src/dot_stepper/dot_stepper.dart';

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
                child: DotStepper(
                  goNext: stepNext,
                  goPrevious: stepPrevious,
                  // direction: Axis.vertical,
                  // fillStep: false,
                  indicatorColor: Colors.black,

                  stepCount: 5,
                  indicatorEffect: IndicatorEffect.worm,
                  // stepRadius: 48,
                  
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
