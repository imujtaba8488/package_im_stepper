import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/dot_offset.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';
import 'package:im_stepper/stepper.dart';

/// Callback that provides the index of the dot that was tapped.
typedef TappedAt = void Function(int index);

class FixedDotPainter extends CustomPainter {
  FixedDotPainter({
    this.dotRadius = 24.0,
    this.dotCount = 1,
    this.direction = Axis.horizontal,
    this.shape = Shape.circle,
    @required this.dotOffsets,
    @required this.brush,
    @required this.lineConnectorBrush,
    @required this.tappedAt,
  });

  final int dotCount;
  final double dotRadius;
  final List<DotOffset> dotOffsets;
  final Axis direction;
  final Shape shape;
  final Paint brush;
  final Paint lineConnectorBrush;
  final TappedAt tappedAt;

  @override
  void paint(Canvas canvas, Size size) {
    for (int index = 0; index < dotCount; index++) {
      ShapePainter shapePainter = ShapePainter(
        canvas,
        brush,
        direction,
        dotRadius,
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

  /// Used to control tapping on dots.
  @override
  bool hitTest(Offset position) {
    // Compare the position (where a hit was received) to find out if it matches with any of the dot offsets.

    for (int index = 0; index < dotOffsets.length; index++) {
      if (direction == Axis.horizontal) {
        if (position.dx >= dotOffsets[index].left.dx &&
            position.dx <= dotOffsets[index].right.dx) {
          // A match was found, hence send the index of the dot that was tapped.
          tappedAt(index);
          break;
        }
      } else if (direction == Axis.vertical) {
        if (position.dy >= dotOffsets[index].top.dy &&
            position.dy <= dotOffsets[index].bottom.dy) {
          // A match was found, hence send the index of the dot that was tapped.
          tappedAt(index);
          break;
        }
      }
    }

    return super.hitTest(position);
  }

  @override
  bool shouldRepaint(FixedDotPainter oldDelegate) => true;
}
