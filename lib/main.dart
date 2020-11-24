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
  int activeStep = 2;
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
              activeStep: activeStep,
              totalSteps: (steps) {
                totalSteps = steps;
              },
              enableNextPreviousButtons: true,
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
              icons: [
                Icon(Icons.home),
                Icon(Icons.person),
                Icon(Icons.account_balance),
                Icon(Icons.access_time),
                Icon(Icons.home),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.1),
              ),
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: Text(header()),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Center(
                    child: Text('${activeStep + 1}'),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
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
                    if (activeStep < totalSteps) {
                      setState(() {
                        activeStep++;
                      });
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String header() {
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
}
