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
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  // Controls the currently active step. Can be set to any valid value i.e., a value that ranges from 0 to upperBound.
  int activeStep = 0; // Initial step set to 5.

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
              DotStepper(
                // direction: Axis.vertical,
                dotCount: 3,
                dotRadius: 28,
                activeStep: activeStep,
                shape: Shape.stadium,
                spacing: 30,
                indicator: Indicator.slide,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    step1(),
                    step2(),
                    step3(),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    previousButton(),
                    nextButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget step1() {
    return ElevatedButton(
      child: Text('1'),
      onPressed: () {
        setState(() {
          activeStep = 0;
        });
      },
    );
  }

  Widget step2() {
    return ElevatedButton(
      child: Text('2'),
      onPressed: () {
        setState(() {
          activeStep = 1;
        });
      },
    );
  }

  Widget step3() {
    return ElevatedButton(
      child: Text('3'),
      onPressed: () {
        setState(() {
          activeStep = 2;
        });
      },
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      child: Text('Next'),
      onPressed: () {
        setState(() {
          activeStep++;
        });
      },
    );
  }

  Widget previousButton() {
    return ElevatedButton(
      child: Text('Prev'),
      onPressed: () {
        setState(() {
          activeStep--;
        });
      },
    );
  }
}
