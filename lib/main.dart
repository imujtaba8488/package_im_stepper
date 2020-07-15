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

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  List<ConnectorPainter> connectorPainters = [];
  List<IndicatorPainter> indicatorPainters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
      ),
      body: Column(
        children: <Widget>[
          Stepper(
            selectedIndex: selectedIndex,
            connectorPainters: connectorPainters,
            indicatorPainters: indicatorPainters,
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex--;
                    });
                  },
                  child: Text('Previous'),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex++;
                      connectorPainters[selectedIndex - 1].animate();
                    });
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

enum StepperDirection {
  horizontal,
  vertical,
}

class Stepper extends StatefulWidget {
  final int selectedIndex;
  final List<ConnectorPainter> connectorPainters;
  final List<IndicatorPainter> indicatorPainters;

  Stepper({this.selectedIndex, this.connectorPainters, this.indicatorPainters});

  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<Stepper> with SingleTickerProviderStateMixin {
  double totalWidth;
  double tileRadius;

  AnimationController animationController;
  Animation animation;

  bool hasFocus = false;
  int focussedIndex;

  int openIndex = 0;

  StepperDirection stepperDirection;

  @override
  void initState() {
    super.initState();

    stepperDirection = StepperDirection.horizontal;

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          });

    animation = Tween(begin: 16.0, end: 44.0).animate(animationController);
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: _buildList,
        itemCount: 5,
      ),
    );
  }

  Widget _buildList(context, index) {
    return Indicator(
      index: index,
      showConnector: index < 4,
      tappedIndex: (value) => print(value),
      hasFocus: hasFocus && openIndex == index,
      focusRecieved: (value) {
        setState(() {
          hasFocus = value;
          openIndex = index;
        });
      },
      isSelected: widget.selectedIndex == index,
      connectorPainters: widget.connectorPainters,
      indicatorPainters: widget.indicatorPainters,
    );
  }
}

class Indicator extends StatefulWidget {
  final Function tappedIndex;
  final int index;
  final bool showConnector;
  final bool hasFocus;
  final Function focusRecieved;
  final bool isSelected;
  final List<ConnectorPainter> connectorPainters;
  final List<IndicatorPainter> indicatorPainters;

  Indicator({
    this.tappedIndex,
    this.index,
    this.showConnector = false,
    this.hasFocus = false,
    this.focusRecieved,
    this.isSelected = false,
    this.connectorPainters,
    this.indicatorPainters,
  });

  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation indicatorAnimation, opacityAnimation;

  StepperDirection stepperDirection;

  ConnectorPainter connectorPainter;
  IndicatorPainter indicatorPainter;

  @override
  void initState() {
    super.initState();

    stepperDirection = StepperDirection.horizontal;

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });

    indicatorAnimation =
        Tween(begin: 0.0, end: 44.0).animate(animationController);

    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);

    connectorPainter = ConnectorPainter(
      controller: animationController,
      animation: indicatorAnimation,
    );

    widget.connectorPainters.add(connectorPainter);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(20),
      child: Opacity(
        opacity: 1.0, //widget.isSelected ? opacityAnimation.value : 1.0,
        child: CustomPaint(
          size: Size(25, 25),
          painter: connectorPainter,
          foregroundPainter: IndicatorPainter(
            widget.isSelected,
            animation: indicatorAnimation,
            animationController: animationController,
          ),
        ),
      ),
    );
  }
}

class IndicatorPainter extends CustomPainter {
  bool isSelected;
  bool showIndicator;
  IconData icon;
  Animation animation;
  AnimationController animationController;
  int indexSelected;

  Canvas canvas;

  IndicatorPainter(
    this.isSelected, {
    this.showIndicator = false,
    this.icon = Icons.home,
    this.animation,
    this.animationController,
    this.indexSelected,
  });

  @override
  void paint(Canvas canvas, Size size) {
    this.canvas = canvas;

    canvas.drawCircle(
      Offset(0.0, 0.0),
      16,
      Paint()
        ..color = isSelected ? Colors.blue : Colors.grey
        ..strokeWidth = 5,
    );

    if (isSelected) {
      canvas.drawCircle(
        Offset(0.0, 0.0),
        17,
        Paint()
          ..color = Colors.green
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5,
      );
    }

    paintIcon(canvas, size, icon: icon);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  void paintIcon(Canvas canvas, Size size, {IconData icon = Icons.home}) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontSize: 24.0,
        fontFamily: icon.fontFamily,
        color: Colors.black,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(-12, -12));
  }
}

class ConnectorPainter extends CustomPainter {
  AnimationController controller;
  Animation animation;

  ConnectorPainter({this.controller, this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    drawDottedLine(
      canvas: canvas,
      from: 16.0,
      to: animation.isDismissed ? 44.0 : animation.value,
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
