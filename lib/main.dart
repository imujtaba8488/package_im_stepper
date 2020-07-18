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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Icon Stepper Example'),),
        body: Row(
          children: <Widget>[
            IconStepper(
              direction: Axis.vertical,
              onStepReached: (value) {
                setState(() {
                  print('value: $value');
                  selectedIndex = value;
                });
              },
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
            Expanded(
              child: FittedBox(
                child: Center(
                  child: Text('$selectedIndex'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
