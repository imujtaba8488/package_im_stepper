import 'package:flutter/material.dart';

import 'dot_offset.dart';
import 'dot_stepper.dart';
import 'shape_painter.dart';

class ShiftIndicator extends CustomPainter {
  ShiftIndicator({
    this.dotRadius,
    this.activeDotIndexOffset,
    this.oldDotIndexOffset,
    this.direction,
    this.shape,
    this.brush,
  });

  final double dotRadius;
  final DotOffset activeDotIndexOffset;
  final DotOffset oldDotIndexOffset;
  final Axis direction;
  final Shape shape;
  final Paint brush;

  @override
  void paint(Canvas canvas, Size size) {
    ShapePainter shapePainter = ShapePainter(
      brush: brush,
      canvas: canvas,
      direction: direction,
      dotOffset: activeDotIndexOffset,
      dotRadius: dotRadius,
    );

    shapePainter.draw(shape);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
