import 'package:flutter/material.dart';

import 'dot_offset.dart';
import 'dot_stepper.dart';
import 'shape_painter.dart';

class SlidePainter extends CustomPainter {
  SlidePainter({
    this.dotRadius,
    this.activeDotIndexOffset,
    this.oldDotIndexOffset,
    this.direction,
    this.shape,
    this.brush,
    this.animationController,
  });

  final double dotRadius;
  final DotOffset activeDotIndexOffset;
  final DotOffset oldDotIndexOffset;
  final Axis direction;
  final Shape shape;
  final Paint brush;
  final AnimationController animationController;

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
