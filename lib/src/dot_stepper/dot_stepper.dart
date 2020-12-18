library dot_stepper;

import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/decorations.dart';
import 'package:im_stepper/src/dot_stepper/dot_offset.dart';
import 'package:im_stepper/src/dot_stepper/fixed_dot_painter.dart';
import 'package:im_stepper/src/dot_stepper/indicators/slide_indicator.dart';

import 'indicator_painter.dart';
import 'indicators/jump_indicator.dart';
import 'indicators/worm_indicator.dart';

part 'enums.dart';

class DotStepper extends StatefulWidget {
  final int dotCount;
  final double dotRadius;
  final double spacing;
  final Axis direction;
  final Shape shape;
  final int activeStep;
  final Indicator indicator;
  final FixedDotDecoration fixedDotDecoration;
  final IndicatorDecoration indicatorDecoration;
  final LineConnectorDecoration lineConnectorDecoration;

  DotStepper({
    this.dotCount = 2,
    this.dotRadius = 40,
    this.spacing = 0.0,
    this.direction = Axis.horizontal,
    this.shape = Shape.circle,
    this.activeStep = 0,
    this.indicator = Indicator.shift,
    this.fixedDotDecoration = const FixedDotDecoration(),
    this.indicatorDecoration = const IndicatorDecoration(),
    this.lineConnectorDecoration = const LineConnectorDecoration(),
  }) {
    assert(dotCount >= 2, 'It does not make sense to have less than 2 dots.');

    assert(spacing >= 0.0, 'spacing must be greater than or equal to 0.0');

    assert(
      activeStep >= 0 && activeStep < dotCount,
      'activeStep must be greater than or equal to 0 and less than dotCount',
    );
  }

  @override
  _DotStepperState createState() => _DotStepperState();
}

class _DotStepperState extends State<DotStepper>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  /// The dot that is currently active.
  int _activeDotIndex;

  /// The dot that was active before the currently active dot.
  int _oldDotIndex;

  /// Whether stepping is moving forward or backward.
  bool _isSteppingForward;

  /// The `Paint` object used for drawing the fixed dots.
  Paint _fixedDotBrush;

  /// The `Paint` object used for drawing the line connectors.
  Paint _lineConnectorBrush;

  /// The `Paint` object used for drawing the `Indicator`.
  Paint _indicatorBrush;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _activeDotIndex = widget.activeStep;
    _oldDotIndex = 0;
    _isSteppingForward = false;

    _fixedDotBrush = Paint()
      ..color = widget.fixedDotDecoration.color
      ..style = widget.fixedDotDecoration.style
      ..strokeWidth = widget.fixedDotDecoration.strokeWidth;

    _lineConnectorBrush = Paint()
      ..color = widget.lineConnectorDecoration.color
      ..strokeWidth = widget.lineConnectorDecoration.weight;

    _indicatorBrush = Paint()
      ..color = widget.indicatorDecoration.color
      ..style = widget.indicatorDecoration.style
      ..strokeWidth = widget.indicatorDecoration.strokeWidth;

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
            dotOffsets: _buildDotOffsets,
            direction: widget.direction,
            shape: widget.shape,
            brush: _fixedDotBrush,
            lineConnectorBrush: _lineConnectorBrush,
          ),
          size: Size(
            widget.direction == Axis.horizontal ? _axisLength : _diameter,
            widget.direction == Axis.horizontal ? _diameter : _axisLength,
          ),
        ),
        CustomPaint(
          painter: _applyIndicator
            ..dotRadius = widget.dotRadius
            ..activeDotOffset = _buildDotOffsets[_activeDotIndex]
            ..oldDotOffset = _buildDotOffsets[_oldDotIndex]
            ..direction = widget.direction
            ..shape = widget.shape
            ..brush = _indicatorBrush
            ..animationController = animationController
            ..indicator = widget.indicator
            ..isSteppingForward = _isSteppingForward,
        ),
      ],
    );
  }

  /// Builds and returns the dot offsets.
  List<DotOffset> get _buildDotOffsets {
    List<DotOffset> dotOffsets = [];

    // Create and save the first offset.
    Offset center = Offset(widget.dotRadius, widget.dotRadius);
    dotOffsets.add(DotOffset(center, widget.dotRadius));

    // Create successive offsets by translating and save them to the list.
    for (int index = 0; index < widget.dotCount; index++) {
      center = center.translate(
        widget.direction == Axis.horizontal ? _diameter + widget.spacing : 0.0,
        widget.direction == Axis.horizontal ? 0.0 : _diameter + widget.spacing,
      );

      dotOffsets.add(DotOffset(center, widget.dotRadius));
    }

    return dotOffsets;
  }

  /// Returns the width or height depending on the direction i.e., horizontally or vertically, that is required to accomodate the total number of dots.
  double get _axisLength => (_diameter * widget.dotCount) + _totalSpacing;

  /// Returnst the total amount spacing between the dots. The spacing after the last dot is omitted.
  double get _totalSpacing => widget.spacing * (widget.dotCount - 1);

  /// Returns the diameter of a dot.
  double get _diameter => widget.dotRadius * 2;

  /// Returns a built-in `Indicator` based on the value of the `indicator`.
  IndicatorPainter get _applyIndicator {
    switch (widget.indicator) {
      // case Indicator.slide:
      //   return SlideIndicator();

      case Indicator.jump:
        return JumpIndicator();

      // case Indicator.magnify:
      //   return MagnifyIndicator();

      // case Indicator.ball_roll:
      //   return BallRollIndicator();

      // // case Indicator.trail:
      // //   return TrailIndicator();

      case Indicator.worm:
        return WormIndicator();

      // default:
      //   return WormIndicator();

      default:
        return Slide();
    }
  }

  @override
  void didUpdateWidget(covariant DotStepper oldWidget) {
    // Update old and active dot indices.
    _oldDotIndex = oldWidget.activeStep;
    _activeDotIndex = widget.activeStep;

    // Reset and run animations.
    animationController.reset();
    animationController.forward();

    _isSteppingForward = widget.activeStep > oldWidget.activeStep;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
