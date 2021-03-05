import 'package:flutter/material.dart';

import '../core/dot_offset.dart';
import '../core/enums.dart';
import 'shape_painter.dart';

/// Callback that provides the index of the dot that was tapped.
typedef TappedAt = void Function(int index);

/// Configures and draws the fixed dots as well as the line connectors.
class FixedDotPainter extends CustomPainter {
  FixedDotPainter({
    this.dotRadius = 24.0,
    this.dotCount = 1,
    this.direction = Axis.horizontal,
    this.shape = Shape.circle,
    this.lineConnectorsEnabled = true,
    required this.dotOffsets,
    required this.strokeBrush,
    required this.fillBrush,
    required this.lineConnectorBrush,
    required this.tappedAt,
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

  /// The `Paint` object used for drawing the border of the fixed dot.
  final Paint? strokeBrush;

  /// The Paint object used for drawing the dot.
  final Paint? fillBrush;

  /// The `Paint` object used for drawing the line connectors.
  final Paint? lineConnectorBrush;

  /// Callback which provides the index of the dot that was tapped.
  final TappedAt tappedAt;

  /// Whether to enable or disable line connectors between dots.
  final bool lineConnectorsEnabled;

  @override
  void paint(Canvas canvas, Size size) {
    for (int index = 0; index < dotCount; index++) {
      // Create dot painter.
      ShapePainter fillPainter = ShapePainter(
        canvas,
        fillBrush,
        direction,
        dotRadius,
        dotOffsets[index].left,
        dotOffsets[index].top,
        dotOffsets[index].right,
        dotOffsets[index].bottom,
      );

      // Create border painter.
      ShapePainter borderPainter = ShapePainter(
        canvas,
        strokeBrush,
        direction,
        dotRadius,
        dotOffsets[index].left,
        dotOffsets[index].top,
        dotOffsets[index].right,
        dotOffsets[index].bottom,
      );

      // Draw the dot and it's border.
      fillPainter.draw(shape);
      borderPainter.draw(shape);
    }

    // Mind the if statement!
    if (lineConnectorsEnabled) _drawLineConnectors(canvas);
  }

  /// Draw the line connectors.
  void _drawLineConnectors(Canvas canvas) {
    // The factor by which to adjust the offsets in order to compensate for the strokeWidth of the fixedDot.
    double strokeAdjustment = (strokeBrush!.strokeWidth / 2);

    // (index < dotCount -1) because omit the line connector after the last dot.
    for (int index = 0; index < dotCount - 1; index++) {
      canvas.drawLine(
        direction == Axis.horizontal
            ? Offset(dotOffsets[index].right + strokeAdjustment, dotRadius)
            : Offset(dotRadius, dotOffsets[index].bottom + strokeAdjustment),
        direction == Axis.horizontal
            ? Offset(dotOffsets[index + 1].left - strokeAdjustment, dotRadius)
            : Offset(dotRadius, dotOffsets[index + 1].top - strokeAdjustment),
        lineConnectorBrush!,
      );
    }
  }

  /// Used to control tapping on dots.
  @override
  bool? hitTest(Offset position) {
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
