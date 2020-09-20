# Examples - Table of Contents

- [IconStepper](#iconstepper)

- [IconStepper Externally Controlled](#iconstepper-externally-controlled)

- [DotStepper](#dotstepper)

- [ImageStepper](#imagestepper)

- [NumberStepper](#numberstepper)

## IconStepper

```dart
import 'package:flutter/material.dart';

import 'package:im_stepper/stepper.dart';

void main() {
  runApp(IconStepperDemo());
}

class MyApp extends StatefulWidget {
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<IconStepperDemo> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
        body: Row(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1.0,
                    blurRadius: 2.0,
                  )
                ],
                // borderRadius: BorderRadius.circular(5.0),
              ),
              child: IconStepper(
                direction: Axis.vertical,
                // enableNextPreviousButtons: false,
                stepColor: Colors.white,
                activeStepColor: Colors.amber,
                lineColor: Colors.amberAccent,
                // lineDotRadius: 2,
                lineLength: 75,
                onStepReached: (value) {
                  setState(() {
                    print('value: $value');
                    selectedIndex = value;
                  });
                },
                steppingEnabled: true,
                icons: [
                  Icon(Icons.home),
                  Icon(Icons.person),
                  Icon(Icons.account_balance),
                  Icon(Icons.access_time),
                  Icon(Icons.dashboard),
                  Icon(Icons.cached),
                  Icon(Icons.unarchive),
                  Icon(Icons.backspace),
                  Icon(Icons.backup),
                  Icon(Icons.battery_unknown),
                  Icon(Icons.cake),
                  Icon(Icons.call),
                  Icon(Icons.call_end),
                  Icon(Icons.block),
                  Icon(Icons.mail),
                  Icon(Icons.face),
                  Icon(Icons.fast_forward),
                  Icon(Icons.gamepad),
                ],
              ),
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
                    child: Text('${selectedIndex + 1}'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String header() {
    switch (selectedIndex) {
      case 0:
        return 'Educational Background';

      case 1:
        return 'Professional Background';

      case 2:
        return 'Awards';

      case 3:
        return 'Sports';

      case 4:
        return 'Specially abled';

      case 5:
        return 'Personal Details';

      case 6:
        return 'Social Details';

      case 7:
        return 'Review';

      default:
        return 'Unknown';
    }
  }
}
```

## IconStepper-Externally Controlled

When the IconStepper requires to be controlled from external buttons rather than the built-in next/previous buttons or the stepTapping itself, then `IconStepper.externallyControlled` constructor must be used. __Note__ same applies to ImageStepper and NumberStepper.

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
  // MUST BE MAINTAINED, SEPARATELY.
  int currentIndex = 0;

  // THESE MUST BE USED TO CONTROL THE STEPPER FROM EXTERNALLY.
  bool goNext = false;
  bool goPrevious = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1.0,
                    blurRadius: 2.0,
                  )
                ],
                // borderRadius: BorderRadius.circular(5.0),
              ),
              child: IconStepper.externallyControlled(
                goNext: goNext,
                goPrevious: goPrevious,
                direction: Axis.horizontal,
                stepColor: Colors.white,
                activeStepColor: Colors.amber,
                lineColor: Colors.amberAccent,
                lineLength: 75,
                steppingEnabled: true,
                icons: [
                  Icon(Icons.home),
                  Icon(Icons.person),
                  Icon(Icons.account_balance),
                  Icon(Icons.access_time),
                ],
              ),
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
                    child: Text('${currentIndex + 1}'),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    // MUST TO CONTROL STEPPER FROM EXTERNAL BUTTONS.
                    setState(() {
                      goNext = false;
                      goPrevious = true;

                      if (currentIndex > 0) {
                        currentIndex--;
                      }
                    });
                  },
                  child: Text('Previous'),
                ),
                RaisedButton(
                  onPressed: () {
                    // MUST TO CONTROL STEPPER FROM EXTERNAL BUTTONS.
                    setState(() {
                      goNext = true;
                      goPrevious = false;

                      if (currentIndex < 3) {
                        currentIndex++;
                      }
                    });
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
    switch (currentIndex) {
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
```

## DotStepper

```Dart
import 'package:flutter/material.dart';

import 'package:im_stepper/stepper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool stepNext = false;
  bool stepPrevious = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // ***DON'T FORGET***
                        stepNext = false;
                        stepPrevious = true;
                      });
                    },
                    icon: Icon(Icons.chevron_left),
                  ),
                  DotStepper(
                    goNext: stepNext,
                    goPrevious: stepPrevious,
                    dotCount: 5,
                    indicatorEffect: IndicatorEffect.jump,
                    // indicatorType: IndicatorType.contain,
                    // direction: Axis.vertical,
                    // dotRadius: 150,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // ***DON'T FORGET***
                        stepPrevious = false;
                        stepNext = true;
                      });
                    },
                    icon: Icon(Icons.chevron_right),
                  )
                ],
              )
            ],
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


import 'package:im_stepper/stepper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
        body: ImageStepper(
          // direction: Axis.vertical,
          // stepRadius: 48.0,
          activeStepBorderPadding: 20.0,
          images: [
            AssetImage('assets/me.jpg'),
            AssetImage('assets/me.jpg'),
            AssetImage('assets/me.jpg'),
            AssetImage('assets/me.jpg'),
            AssetImage('assets/me.jpg'),
            AssetImage('assets/me.jpg'),
            AssetImage('assets/me.jpg'),
          ],
        ),
      ),
    );
  }
}
```

## NumberStepper

```dart
import 'package:flutter/material.dart';

import 'package:im_stepper/stepper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
        body: NumberStepper(
          // stepRadius: 48.0,
          numbers: [1, 2, 3, 4, 5, 6],
          direction: Axis.vertical,
          numberStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
```
