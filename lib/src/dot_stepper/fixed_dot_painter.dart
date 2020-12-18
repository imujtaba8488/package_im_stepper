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
    this.lineConnectorsEnabled = true,
    @required this.dotOffsets,
    @required this.brush,
    @required this.lineConnectorBrush,
    @required this.tappedAt,
  });

  /// The total number of dots to paint.
  final int dotCount;

  /// The radius of a dot.
  final double dotRadius;

  /// The list of offsets where the dots are to be painted.
  final List<DotOffset> dotOffsets;

  /// The direction in which to display the dots on the screen, i.e., horizontally or vertically.
  final Axis direction;

  /// The shape of the fixed dots.
  final Shape shape;

  /// The `Paint` object used for drawing the fixed dots.
  final Paint brush;

  /// The `Paint` object used for drawing the line connectors.
  final Paint lineConnectorBrush;

  /// Callback which provides the index of the dot that was tapped.
  final TappedAt tappedAt;

  /// Whether to enable or disable line connectors between dots.
  final bool lineConnectorsEnabled;

  @override
  void paint(Canvas canvas, Size size) {
    for (int index = 0; index < dotCount; index++) {
      // Create an instance of the `ShapePainter`, supply the required properties and use its draw method to draw the shape based on the `shape` property provide.
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

    // Mind the if statement!
    if (lineConnectorsEnabled) _drawLineConnectors(canvas);
  }

  /// Draw the line connectors.
  void _drawLineConnectors(Canvas canvas) {
    // (index < dotCount -1) because omit the line connector after the last dot.
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
        if (position.dx >= dotOffsets[index].left &&
            position.dx <= dotOffsets[index].right) {
          // A match was found, hence send the index of the dot that was tapped.
          tappedAt(index);
          break;
        }
      } else if (direction == Axis.vertical) {
        if (position.dy >= dotOffsets[index].top &&
            position.dy <= dotOffsets[index].bottom) {
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
