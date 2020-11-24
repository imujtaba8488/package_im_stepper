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
  // The step that is currently active. Can be set to any valid value.
  int activeStep = 2;

  // The total number of steps available. This will update automatically from the totalSteps function of the IconStepper widget.
  int totalSteps = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
        body: Column(
          children: <Widget>[
            IconStepper(
              icons: [
                Icon(Icons.home),
                Icon(Icons.person),
                Icon(Icons.account_balance),
                Icon(Icons.access_time),
                Icon(Icons.home),
              ],
              previousButtonIcon: Icon(Icons.g_translate),
              activeStep: activeStep,
              totalSteps: (steps) => totalSteps = steps,
              enableNextPreviousButtons: true,
              onStepReached: (index) {
                // Here the activeStep must be set to index.
                setState(() {
                  activeStep = index;
                });
              },
            ),
            _header(),
            _content(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    // Decrement activeStep.
                    if (activeStep > 0) {
                      setState(() {
                        activeStep--;
                      });
                    }
                  },
                  child: Text('Previous'),
                ),
                RaisedButton(
                  onPressed: () {
                    // Increment activeStep.
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

  /// Returns the header widget.
  Widget _header() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.1),
      ),
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: Text(headerText()),
    );
  }

  /// Returns the header text.
  String headerText() {
    switch (activeStep) {
      case 0:
        return 'Educational Background';

      case 1:
        return 'Professional Background';

      case 2:
        return 'Awards';

      case 3:
        return 'Sports';

      default:
        return 'Unknown';
    }
  }

  /// Returns the content widget.
  Widget _content() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: FittedBox(
          child: Center(
            child: Text('${activeStep + 1}'),
          ),
        ),
      ),
    );
  }
}
