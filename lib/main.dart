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
      home: Stepper(),
    );
  }
}

enum StepperDirection {
  horizontal,
  vertical,
}

class Stepper extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<Stepper> with SingleTickerProviderStateMixin {
  double totalWidth;
  double tileRadius;

  AnimationController animationController;
  Animation animation;

  bool hasFocus;
  int focussedIndex;

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
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        // height: 50,
        child: ListView.builder(
          scrollDirection: stepperDirection == StepperDirection.horizontal
              ? Axis.horizontal
              : Axis.vertical,
          itemBuilder: _buildList,
          itemCount: 4,
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, int index) {
    return Step(
      value: index + 1,
      focusRecieved: (value) {
        if (value) {
          setState(() {
            hasFocus = true;
            focussedIndex = index;
          });
        }
      },
      hasFocus: focussedIndex == index,
      showConnector: true,//index < 3,
      stepperDirection: stepperDirection,
    );
  }
}

class Step extends StatefulWidget {
  final int value;
  final bool hasFocus;
  final Function focusRecieved;
  final bool showConnector;
  final StepperDirection stepperDirection;

  Step({
    this.value = 1,
    this.focusRecieved,
    this.hasFocus = false,
    this.showConnector = true,
    this.stepperDirection = StepperDirection.horizontal,
  });

  @override
  _StepState createState() => _StepState();
}

class _StepState extends State<Step> with TickerProviderStateMixin {
  // Add BUZZ ANIMATION !!!
  AnimationController animationController;
  AnimationController connectorAnimationController;

  Animation animation;
  Animation connectorAnimation;

  double radius = 20;

  bool connectorAnimationForward = true;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    connectorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);

    connectorAnimation =
        Tween(begin: 0.0, end: 88.0).animate(connectorAnimationController);
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.hasFocus) {
      connectorAnimationController.reverse();
    }

    return widget.stepperDirection == StepperDirection.horizontal
        ? Row(
            children: <Widget>[
              _face(),
              _connector(),
            ],
          )
        : Column(
            children: <Widget>[
              _face(),
              _connector(),
            ],
          );
  }

  Widget _face() {
    return InkWell(
      onTap: () {
        widget.focusRecieved(true);

        animationController.reset();
        animationController.forward();

        connectorAnimationController.forward();
      },
      child: Opacity(
        opacity: widget.hasFocus ? animation.value : 1.0,
        child: Container(
          padding: widget.hasFocus ? EdgeInsets.all(1.0) : EdgeInsets.zero,
          decoration: BoxDecoration(
            border: widget.hasFocus
                ? Border.all(
                    width: connectorAnimation.isCompleted ? 1.0 : 0.5,
                    color: connectorAnimation.isCompleted
                        ? Colors.blue
                        : Colors.grey,
                  )
                : null,
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: widget.hasFocus ? Colors.green : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${widget.value}',
                style: TextStyle(
                  color: Colors.black,
                  // fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _connector() {
    return widget.showConnector
        ? Container(
            height: widget.stepperDirection == StepperDirection.horizontal
                ? 2.0
                : connectorAnimation.value,
            width: widget.stepperDirection == StepperDirection.horizontal
                ? connectorAnimation.isDismissed
                    ? 5.0
                    : connectorAnimation.value
                : 2.0,
            color: connectorAnimationController.isAnimating ||
                    connectorAnimation.isCompleted
                ? Colors.blue
                : Colors.grey,
          )
        : Container();
  }
}
