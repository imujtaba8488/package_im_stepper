import 'package:flutter/material.dart';

import 'stepper.dart';

void main() => runApp(
      MaterialApp(
        home: DotStepperDemo(),
      ),
    );

class DotStepperDemo extends StatefulWidget {
  @override
  _DotStepperDemo createState() => _DotStepperDemo();
}

class _DotStepperDemo extends State<DotStepperDemo> {
  // REQUIRED: USED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 5.

  // OPTIONAL: can be set directly.
  int dotCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3 Ways to Control'),
      ),
      body: Column(
        children: [
          NumberStepper(
            // direction: Axis.vertical,
            scrollingDisabled: true,
            activeStep: activeStep,
            enableNextPreviousButtons: false,
            stepRadius:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 40
                    : 24,
            numbers: [
              1,
              2,
              3,
              4,
              5,
            ],
            onStepReached: (index) {
              setState(() {
                activeStep = index;
                print('index: $index');
              });
            },
          ),
          steps(),
        ],
      ),
    );
  }

  /// Generates jump steps for dotCount number of steps, and returns them in a row.
  Row steps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dotCount, (index) {
        return ElevatedButton(
          child: Text('${index + 1}'),
          onPressed: () {
            setState(() {
              activeStep = index;
            });
          },
        );
      }),
    );
  }

  /// Returns the next button widget.
  Widget nextButton() {
    return ElevatedButton(
      child: Text('Next'),
      onPressed: () {
        /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount TO PREVENT Overflow ERROR.
        if (activeStep < dotCount - 1) {
          setState(() {
            activeStep++;
          });
        }
      },
    );
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return ElevatedButton(
      child: Text('Prev'),
      onPressed: () {
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
    );
  }
}
