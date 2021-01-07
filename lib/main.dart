import 'package:flutter/material.dart';

import 'stepper.dart';

void main() => runApp(DotStepperDemo());

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('3 Ways to Control'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DotStepper(
                // direction: Axis.vertical,
                dotCount: dotCount,
                dotRadius: 20,

                /// THIS MUST BE SET. SEE HOW IT IS CHANGED IN NEXT/PREVIOUS BUTTONS AND JUMP BUTTONS.
                activeStep: activeStep,
                shape: Shape.circle,
                spacing: 30,
                indicator: Indicator.jump,

                /// TAPPING WILL NOT FUNCTION PROPERLY WITHOUT THIS PIECE OF CODE.
                onDotTapped: (tappedDotIndex) {
                  setState(() {
                    activeStep = tappedDotIndex;
                  });
                },

                // DOT-STEPPER DECORATIONS
                fixedDotDecoration: FixedDotDecoration(
                  // strokeColor: Colors.green,
                  // strokeWidth: 19,
                ),
                indicatorDecoration: IndicatorDecoration(
                  color: Colors.black,
                ),
                lineConnectorDecoration: LineConnectorDecoration(
                  color: Colors.red,
                ),
              ),

              /// Jump buttons.
              Padding(padding: const EdgeInsets.all(18.0), child: steps()),

              // Next and Previous buttons.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [previousButton(), nextButton()],
              )
            ],
          ),
        ),
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
