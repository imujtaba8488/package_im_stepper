# Examples - Table of Contents

- [IconStepper](#iconstepper)

- [ImageStepper](#imagestepper)

- [NumberStepper](#numberstepper)

- [DotStepper](#dotstepper)

## IconStepper

Controlled in three possible ways:-

- Using build-in next / previous buttons.

- Using external next / previous buttons.

- Using tapping.

```dart
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
  int activeStep = 0;

  // Maybe required in conditionals. Automatically set from totalSteps Function.
  int totalSteps = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IconStepper Example'),
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
              activeStep: activeStep,
              totalSteps: (steps) => totalSteps = steps,
              enableNextPreviousButtons: true,
              onStepReached: (index) {
                // activeStep must be set to index.
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
                    // Decrement activeStep, when previous button is tapped.
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
```

## ImageStepper

```Dart
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
  int activeStep = 2;

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
          children: <Widget>[
            ImageStepper(
              images: [
                AssetImage('assets/me.jpg'),
                AssetImage('assets/me.jpg'),
                AssetImage('assets/me.jpg'),
                AssetImage('assets/me.jpg'),
                AssetImage('assets/me.jpg'),
                AssetImage('assets/me.jpg'),
              ],
              activeStep: activeStep,
              activeStepBorderColor: Colors.black,
              activeStepBorderWidth: 2,
              totalSteps: (steps) => totalSteps = steps,
              enableNextPreviousButtons: true,
              onStepReached: (index) {
                // activeStep must be set to index.
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
                    // Decrement activeStep, when previous button is tapped.
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
```

## NumberStepper

```dart
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
  int activeStep = 2;

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
          children: <Widget>[
            NumberStepper(
              numbers: [
                1,
                2,
                3,
                4,
                5,
                6
              ],
              activeStep: activeStep,
              totalSteps: (steps) => totalSteps = steps,
              enableNextPreviousButtons: true,
              onStepReached: (index) {
                // activeStep must be set to index.
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
                    // Decrement activeStep, when previous button is tapped.
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
```

## DotStepper

```Dart
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
```
