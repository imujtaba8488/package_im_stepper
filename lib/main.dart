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
  int selectedIndex = 0;

  bool next = false;
  bool previous = false;

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
                goNext: next,
                goPrevious: previous,
                enableNextPreviousButtons: false,
                enableStepTapping: false,
                direction: Axis.horizontal,
                stepColor: Colors.white,
                activeStepColor: Colors.amber,
                lineColor: Colors.amberAccent,
                lineLength: 75,
                onStepReached: (value) {
                  selectedIndex = value;
                },
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
                    child: Text('${selectedIndex + 1}'),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      next = false;
                      previous = true;
                    });
                  },
                  child: Text('Previous'),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      next = true;
                      previous = false;
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
