library dot_stepper;

import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/dot_offset.dart';
import 'package:im_stepper/src/dot_stepper/fixed_dot_painter.dart';

part 'enums.dart';

class DotStepper extends StatefulWidget {
  DotStepper({this.dotCount = 5, this.dotRadius = 24, this.spacing = 15});

  final int dotCount;
  final double dotRadius;
  final double spacing;

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
    return Stack(
      children: [
        CustomPaint(
          painter: FixedDotPainter(
            dotCount: widget.dotCount,
            dotRadius: widget.dotRadius,
            dotOffsets: buildDotOffsets,
          ),
          size: Size(
            axisLength,
            diameter,
          ),
        )
      ],
    );
  }

  List<DotOffset> get buildDotOffsets {
    List<DotOffset> dotOffsets = [];

    Offset center = Offset(widget.dotRadius, widget.dotRadius);

    dotOffsets.add(DotOffset(center, widget.dotRadius));

    for (int index = 0; index < widget.dotCount; index++) {
      center = center.translate(
        diameter + widget.spacing,
        0.0,
      );

      dotOffsets.add(DotOffset(center, widget.dotRadius));
    }

    return dotOffsets;
  }

  double get axisLength => (diameter * widget.dotCount) + totalSpacing;
  double get totalSpacing => widget.spacing * (widget.dotCount - 1);
  double get diameter => widget.dotRadius * 2;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
