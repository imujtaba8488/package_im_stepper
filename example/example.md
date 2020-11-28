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

`DotStepper` contains a family of fully customizable, beautiful __page indicator__ widgets with awesome built-in animations. Each dot in a `DotStepper` represents a step. The example below builds the following DotStepper:

[DotStepper](#todo)

In the above `DotStepper`, we have a total of __5__ steps (represented by the 5 dots). The next and previous buttons are used to control stepping forward and backwards, respectively. The content of each step can be fully customized and in this example, just displays the index of the `activeStep`.

### Code Explanation

In the following code snippet, we must define three variables, namely; `activeStep`, `lowerBound`, and `upperBound` to control the stepper. The `activeStep` is assigned to the required `activeStep` property of the stepper. The `lowerBound` and the `upperBound` _variables_ __receive__ their values from the `lowerBound`, and `upperBound` required _functions_ of the stepper.

Following the `build()` method we define the next and previous buttons which control the stepper. The next and previous buttons increment and decrement the `activeStep` variable, respectively. However, the incrementing and decrementing is constrained by the upperBound and lowerBound variables, which is a must for the stepper to function properly.

### Things to remember

- You can set the initial step to any valid value, i.e., values must range from lowerBound to upperBound.

- The `activeStep` must start from 1 and NOT from 0.

- `activeStep` can also be used to jump around different steps.

### Code

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
  // THE FOLLOWING THREE VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  // Controls the currently active step. Can be set to any valid value i.e., a value that ranges from lowerBound to upperBound. Note: Steps are counted from 1 and NOT from 0.
  int activeStep = 5; // Initial step set to 5.

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
```
