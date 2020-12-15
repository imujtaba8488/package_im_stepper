library dot_stepper;

import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/dot_offset.dart';
import 'package:im_stepper/src/dot_stepper/fixed_dot_painter.dart';
import 'package:im_stepper/src/dot_stepper/indicators/worm_indicator.dart';

import 'indicator_painter.dart';
import 'indicators/slide_indicator.dart';

part 'enums.dart';

class DotStepper extends StatefulWidget {
  DotStepper({
    this.dotCount = 5,
    this.dotRadius = 40,
    this.spacing = 15,
    this.direction = Axis.horizontal,
    this.shape = Shape.circle,
    this.activeStep = 0,
    this.indicator = Indicator.shift,
  }) {
    assert(
      activeStep >= 0 && activeStep < dotCount,
      'activeStep must be greater than or equal to 0 and less than dotCount',
    );
  }

  final int dotCount;
  final double dotRadius;
  final double spacing;
  final Axis direction;
  final Shape shape;
  final int activeStep;
  final Indicator indicator;

  @override
  _DotStepperState createState() => _DotStepperState();
}

class _DotStepperState extends State<DotStepper>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  int activeDotIndex;
  int oldDotIndex;
  bool isSteppingForward;

  Paint fixedDotBrush;
  Paint lineConnectorBrush;
  Paint indicatorBrush;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    activeDotIndex = widget.activeStep;
    oldDotIndex = 0;
    isSteppingForward = false;

    fixedDotBrush = Paint()..color = Colors.grey;
    lineConnectorBrush = Paint()..color = Colors.blueGrey;
    indicatorBrush = Paint()..color = Colors.black;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: FixedDotPainter(
            dotCount: widget.dotCount,
            dotRadius: widget.dotRadius,
            dotOffsets: buildDotOffsets,
            direction: widget.direction,
            shape: widget.shape,
            brush: fixedDotBrush,
            lineConnectorBrush: lineConnectorBrush,
          ),
          size: Size(
            widget.direction == Axis.horizontal ? axisLength : diameter,
            widget.direction == Axis.horizontal ? diameter : axisLength,
          ),
        ),
        CustomPaint(
          painter: applyIndicator
            ..dotRadius = widget.dotRadius
            ..activeDotOffset = buildDotOffsets[activeDotIndex]
            ..oldDotOffset = buildDotOffsets[oldDotIndex]
            ..direction = widget.direction
            ..shape = widget.shape
            ..brush = indicatorBrush
            ..animationController = animationController
            ..indicator = widget.indicator
            ..isSteppingForward = isSteppingForward,
        ),
      ],
    );
  }

  List<DotOffset> get buildDotOffsets {
    List<DotOffset> dotOffsets = [];

    Offset center = Offset(widget.dotRadius, widget.dotRadius);

    dotOffsets.add(DotOffset(center, widget.dotRadius));

    for (int index = 0; index < widget.dotCount; index++) {
      center = center.translate(
        widget.direction == Axis.horizontal ? diameter + widget.spacing : 0.0,
        widget.direction == Axis.horizontal ? 0.0 : diameter + widget.spacing,
      );

      dotOffsets.add(DotOffset(center, widget.dotRadius));
    }

    return dotOffsets;
  }

  double get axisLength => (diameter * widget.dotCount) + totalSpacing;
  double get totalSpacing => widget.spacing * (widget.dotCount - 1);
  double get diameter => widget.dotRadius * 2;

  IndicatorPainter get applyIndicator {
    switch (widget.indicator) {
      case Indicator.slide:
        return SlideIndicator();

      // case Indicator.jump:
      //   return JumpIndicator();

      // case Indicator.trail:
      //   return TrailIndicator();

      case Indicator.worm:
        return WormIndicator();

      default:
        return WormIndicator();
    }
  }

  @override
  void didUpdateWidget(covariant DotStepper oldWidget) {
    oldDotIndex = oldWidget.activeStep;
    activeDotIndex = widget.activeStep;

    animationController.reset();
    animationController.forward();

    isSteppingForward = widget.activeStep > oldWidget.activeStep;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
