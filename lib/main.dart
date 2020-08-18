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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        stepNext = false;
                        stepPrevious = true;
                      });
                    },
                    icon: Icon(Icons.chevron_left),
                  ),
                  DotStepper(
                    goNext: stepNext,
                    goPrevious: stepPrevious,
                    dotCount: 5,
                    indicatorEffect: IndicatorEffect.slide,
                    // indicatorType: IndicatorType.contain,
                    // direction: Axis.vertical,
                    // dotRadius: 150,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        stepPrevious = false;
                        stepNext = true;
                      });
                    },
                    icon: Icon(Icons.chevron_right),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
