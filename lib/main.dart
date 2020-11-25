import 'package:flutter/material.dart';

import 'stepper.dart';

void main() {
  runApp(IconStepperDemo());
}

class IconStepperDemo extends StatefulWidget {
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<IconStepperDemo> {
  // THESE TWO VARIABLES ARE IMPORTANT.
  // Controls the currently active step. Can be set to any valid value i.e., a value that falls between 0 and the total number of available steps. Hence, can also be used to set the initial/starting step.
  int activeStep = 1;

  // Maybe required in conditionals. Automatically set from totalSteps Function.
  int totalSteps = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ImageStepper Example'),
        ),
        body: Column(
          children: [
            DotStepper(
              dotCount: 5,
              activeStep: activeStep,
              totalSteps: (steps) => totalSteps = steps,
              indicatorEffect: IndicatorEffect.jump,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    // Decrement activeStep, when previous button is tapped.
                    // IMPORTANT: Make sure the condition checks for greater than 1 and not for greater than 0.
                    if (activeStep > 1) {
                      setState(() {
                        activeStep--;
                      });
                    }
                  },
                  child: Text('Previous'),
                ),
                RaisedButton(
                  onPressed: () {
                    // Increment activeStep, when next button is tapped.
                    if (activeStep < totalSteps) {
                      setState(() {
                        activeStep++;
                      });
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
