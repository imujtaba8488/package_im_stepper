import 'package:flutter/material.dart';

import 'src/dot_stepper/decorations.dart';
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
  int dotCount = 5;

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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DotStepper(
                // direction: Axis.vertical,
                dotCount: dotCount,
                dotRadius: 24,
                activeStep: activeStep,
                shape: Shape.squircle,
                spacing: 30,
                indicator: Indicator.shift,
                onDotTapped: (tappedDotIndex) {
                  setState(() {
                    activeStep = tappedDotIndex;
                  });
                },
                fixedDotDecoration: FixedDotDecoration(
                  color: Colors.red,
                  style: PaintingStyle.stroke,
                  strokeWidth: 3,
                ),
                indicatorDecoration: IndicatorDecoration(
                  style: PaintingStyle.stroke,
                  strokeWidth: 8,
                  color: Colors.orange,
                ),
                lineConnectorDecoration: LineConnectorDecoration(
                  color: Colors.red,
                  strokeWidth: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: steps(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  previousButton(),
                  nextButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

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

  Widget nextButton() {
    return ElevatedButton(
      child: Text('Next'),
      onPressed: () {
        if (activeStep < dotCount - 1) {
          setState(() {
            activeStep++;
          });
        }
      },
    );
  }

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
