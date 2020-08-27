import 'package:flutter/material.dart';
import 'package:im_stepper/src/first_stepper/opacity_animated.dart';

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
          stepRadius: 48.0,
          // fitImage: false,
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
        // body: IconStepper(
        //   icons: [
        //     Icon(Icons.hd),
        //     Icon(Icons.hd),
        //     Icon(Icons.hd),
        //     Icon(Icons.hd),
        //     Icon(Icons.hd),
        //     Icon(Icons.hd),
        //   ],
        // ),
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
