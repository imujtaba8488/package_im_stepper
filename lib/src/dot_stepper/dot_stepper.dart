import 'package:flutter/material.dart';

class DotStepper extends StatefulWidget {
  DotStepper({this.dotCount, this.radius});
  
  final int dotCount;
  final double radius;

  @override
  _DotStepperState createState() => _DotStepperState();
}

class _DotStepperState extends State<DotStepper>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
