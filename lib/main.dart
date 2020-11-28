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
  // THE FOLLOWING THREE VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  // Controls the currently active step. Can be set to any valid value i.e., a value that ranges from lowerBound to upperBound. Note: Steps are counted from 1 and NOT from 0.
  int activeStep = 1; // Initial step set to 5.

  // Must be used to control the lower and upper bound of the activeStep variable. Please see next and previous buttons below the build() method!
  int lowerBound = 0;
  int upperBound = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('DotStepper Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  previousButton(),
                  Expanded(
                    child: DotStepper(
                      dotCount: 5,

                      /// REQUIRED PROPERTIES.
                      activeStep: activeStep,
                      lowerBound: (bound) => lowerBound = bound,
                      upperBound: (bound) => upperBound = bound,
                    ),
                  ),
                  nextButton(),
                ],
              ),
              Expanded(
                child: FittedBox(
                  child: Center(
                    child: Text('$activeStep'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('Next'),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound.
        if (activeStep > lowerBound) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }
}
