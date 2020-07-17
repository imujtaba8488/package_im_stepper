import 'package:flutter/material.dart';

import 'stepper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MyStepper(
                  // direction: Axis.vertical,
                  // enableNextPreviousButtons: false,
                  onSelection: (value) {
                    print('value: $value');
                  },
                  steps: [
                    CircleStep(
                      icon: Icon(Icons.home),
                    ),
                    CircleStep(
                      icon: Icon(Icons.home),
                    ),
                    CircleStep(
                      icon: Icon(Icons.home),
                    ),
                    CircleStep(
                      icon: Icon(Icons.home),
                    ),
                    CircleStep(
                      icon: Icon(Icons.home),
                    ),
                    CircleStep(
                      icon: Icon(Icons.home),
                    ),
                    CircleStep(
                      icon: Icon(Icons.home),
                    ),
                    CircleStep(
                      icon: Icon(Icons.home),
                    ),
                    CircleStep(
                      icon: Icon(Icons.home),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
