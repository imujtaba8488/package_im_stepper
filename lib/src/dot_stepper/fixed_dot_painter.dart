import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/dot_offset.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';
import 'package:im_stepper/stepper.dart';

class FixedDotPainter extends CustomPainter {
  FixedDotPainter({this.dotRadius, this.dotCount, this.dotOffsets});

  final int dotCount;
  final double dotRadius;
  final List<DotOffset> dotOffsets;

  @override
  void paint(Canvas canvas, Size size) {
    for (int index = 0; index < dotCount; index++) {
      ShapePainter shapePainter = ShapePainter(
        canvas: canvas,
        dotRadius: dotRadius,
        dotOffset: dotOffsets[index],
      );

      shapePainter.draw(Shape.circle);
    }
  }

  @override
  bool shouldRepaint(FixedDotPainter oldDelegate) => true;
}
