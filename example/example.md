# Examples - Table of Contents

- [IconStepper](#iconstepper)

- [ImageStepper](#imagestepper)

- [NumberStepper](#numberstepper)

- [DotStepper](#dotstepper)

## IconStepper

Simple to use icon stepper widget, wherein each icon defines a step. Hence, the total number of icons represents the total number of available steps. The example below builds the following `IconStepper`:

![IconStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/examples/icon_stepper.gif)

### Three ways to control the steppers, using:-

- build-in next / previous buttons.

- external next / previous buttons or events.

- step-tapping.

In the above `IconStepper,` we have a total of __7__ steps (represented by 7 icons) separated by dotted lines. The built-in next and previous buttons, the buttons along the bottom, and tapping an individual step, all control the stepping in this specific example. Each step's content i.e. header, and the page content, as well as the dotted line separator, next and previous buttons, etc., are fully all customizable.

### Code Explanation

In the following code snippet, we must define two variables: `activeStep` and `upperBound` to control the stepper. The `activeStep` is assigned to the `activeStep` property of the stepper. The `upperBound` _variable_ __receives__ its value from the `upperBound` _function_ of the stepper.

Following the `build()` method, we define the next and previous buttons which control the stepper externally. The next and previous buttons increment and decrement the `activeStep` variable, respectively. However, the incrementing and decrementing is constrained by the `upperBound` and the `if` statement for lowerBound, which is a __must__ for the stepper to function properly from external Buttons.

Another way to control the stepper is by enabling the built-in buttons. When the built-in buttons are tapped, they fire the `onStepReached(index)` callback, which provides the `index` of the step reached. This is where you can add logic for what to display when a specific step is reached.

The last way to control the stepper is by enabling the `stepTapping` property. Like built-in buttons, it also fires the `onStepReached(index)` callback. However, observe in the code below that it sets the `activeStep` to the step's `index`.

### Things to remember

- You can set the initial step to any valid value, i.e., values must range from __0__ to __`upperBound`__.

- `activeStep` can also be used to jump around different steps.

### Code

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
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  // Controls the currently active step. Can be set to any valid value i.e., a value that ranges from 0 to upperBound.
  int activeStep = 5; // Initial step set to 5.

  // Must be used to control the upper bound of the activeStep variable. Please see next button below the build() method!
  int upperBound = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('IconStepper Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              IconStepper(
                icons: [
                  Icon(Icons.supervised_user_circle),
                  Icon(Icons.flag),
                  Icon(Icons.access_alarm),
                  Icon(Icons.supervised_user_circle),
                  Icon(Icons.flag),
                  Icon(Icons.access_alarm),
                  Icon(Icons.supervised_user_circle),
                ],

                // activeStep property set to activeStep variable defined above.
                activeStep: activeStep,

                // bound receives value from upperBound.
                upperBound: (bound) => upperBound = bound,

                // This ensures step-tapping updates the activeStep. 
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),
              header(),
              Expanded(
                child: FittedBox(
                  child: Center(
                    child: Text('$activeStep'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  previousButton(),
                  nextButton(),
                ],
              ),
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
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Preface';

      case 2:
        return 'Table of Contents';

      case 3:
        return 'About the Author';

      case 4:
        return 'Publisher Information';

      case 5:
        return 'Reviews';

      case 6:
        return 'Chapters #1';

      default:
        return 'Introduction';
    }
  }
}
```

## ImageStepper

Simple to use image stepper widget, wherein each image defines a step. Hence, the total number of images defines the total number of steps. It is used the same way as the IconStepper; the only difference is that it accepts images instead of icons, as:

```Dart
ImageStepper(
    images:[
        AssetImage('assets/me.jpg'),
        AssetImage('assets/you.jpg'),
        AssetImage('assets/star.jpg),
    ]
),
```

## NumberStepper

A simple to use number stepper widget, wherein each number defines a step. Hence, the total count of numbers defines the total number of steps. It is used the same way as the IconStepper; the only difference is that it accepts numbers, i.e., 1, 2, 3, etc., instead of icons, as:

```Dart
ImageStepper(
    numbers:[
        1,
        2,
        3,
        4,
    ]
),
```

## DotStepper

`DotStepper` contains a family of fully customizable, beautiful __page indicator__ widgets with awesome built-in animations. Each dot in a `DotStepper` represents a step. The example below builds the following DotStepper:

![DotStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/examples/dot_stepper.gif)

In the above `DotStepper,` we have a total of __5__ steps (represented by the 5 dots). The next and previous buttons are used to control stepping forward and backward, respectively. Each step's content can be fully customized, and in this example, it just displays the index of the `activeStep`.

### Code Explanation

In the following code snippet, we must define three variables: `activeStep`, `lowerBound`, and `upperBound` to control the stepper. The `activeStep` is assigned to the `activeStep` property of the stepper. The `lowerBound` and the `upperBound` _variables_ __receive__ their values from the `lowerBound,` and `upperBound` _functions_ of the stepper.

Following the `build()` method, we define the next and previous buttons which control the stepper. The next and previous buttons increment and decrement the `activeStep` variable, respectively. However, the incrementing and decrementing is constrained by the `upperBound` and `lowerBound` variables, which is a __must__ for the stepper to function properly.

### Things to remember

- You can set the initial step to any valid value, i.e., values must range from lowerBound to upperBound.

- The `activeStep` must start from 1 and NOT from 0.

- `activeStep` can also be used to jump around different steps.

### Code

```Dart
import 'package:flutter/material.dart';

import 'stepper.dart';

void main() {
  runApp(DotStepperDemo());
}

class DotStepperDemo extends StatefulWidget {
  @override
  _DotStepperDemo createState() => _DotStepperDemo();
}

class _DotStepperDemo extends State<DotStepperDemo> {
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

                      /// MUST BE SET.
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
