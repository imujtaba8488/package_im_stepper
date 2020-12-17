import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/dot_offset.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';
import 'package:im_stepper/stepper.dart';

class FixedDotPainter extends CustomPainter {
  FixedDotPainter({
    this.dotRadius,
    this.dotCount,
    this.dotOffsets,
    this.direction,
    this.shape,
    this.brush,
    this.lineConnectorBrush,
  });

  final int dotCount;
  final double dotRadius;
  final List<DotOffset> dotOffsets;
  final Axis direction;
  final Shape shape;
  final Paint brush;
  final Paint lineConnectorBrush;

  @override
  void paint(Canvas canvas, Size size) {
    for (int index = 0; index < dotCount; index++) {
      ShapePainter shapePainter = ShapePainter(
        canvas,
        brush,
        direction,
        dotOffsets[index].left,
        dotOffsets[index].top,
        dotOffsets[index].right,
        dotOffsets[index].bottom,
      );

      shapePainter.draw(shape);
    }

    drawLineConnectors(canvas);
  }

  void drawLineConnectors(Canvas canvas) {
    for (int index = 0; index < dotCount - 1; index++) {
      canvas.drawLine(
        direction == Axis.horizontal
            ? Offset(dotOffsets[index].right, dotRadius)
            : Offset(dotRadius, dotOffsets[index].bottom),
        direction == Axis.horizontal
            ? Offset(dotOffsets[index + 1].left, dotRadius)
            : Offset(dotRadius, dotOffsets[index + 1].top),
        lineConnectorBrush,
      );
    }
  }

  @override
  bool shouldRepaint(FixedDotPainter oldDelegate) => true;
}
