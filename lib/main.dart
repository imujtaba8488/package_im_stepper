import 'package:flutter/material.dart';

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
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomPaint(
        painter: ConnectorPainter(),
      ),
    );
  }
}

class ConnectorPainter extends CustomPainter {
  AnimationController controller;
  Animation animation;
  double length;

  ConnectorPainter({this.controller, this.animation, this.length});

  @override
  void paint(Canvas canvas, Size size) {
    drawDottedLine(
      canvas: canvas,
      from: 0.0,
      to: animation.isDismissed ? length : animation.value,
      dotRadius: 1.0,
      paint: Paint()..color = animation.isDismissed ? Colors.grey : Colors.blue,
    );
  }

  void animate() {
    controller.forward();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  void drawDottedLine({
    @required Canvas canvas,
    @required double from,
    @required double to,
    double dotRadius = 2.0,
    double dotSpace = 3.0,
    Paint paint,
  }) {
    assert(paint != null);
    assert(dotSpace != 0.0);

    double start = from;
    double space = dotSpace;

    // Length of the line is calculated by dividing the supplied lenght [to] by dotRadius * space.
    int length = to ~/ (dotRadius * space);

    for (int i = 1; i < length; i++) {
      // New start becomes:
      start += dotRadius * space;

      canvas.drawCircle(
        Offset(start, 0.0),
        dotRadius,
        paint,
      );
    }
  }
}
