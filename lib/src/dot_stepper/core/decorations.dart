import 'package:flutter/material.dart';

/// Defines the decoration for the line connectors between the dots.
class LineConnectorDecoration {
  /// The stroke color.
  final Color color;

  /// The width of the stroke.
  final double strokeWidth;

  const LineConnectorDecoration({
    this.color = Colors.blueGrey,
    this.strokeWidth = 1.0,
  });
}

/// Defines the decoration for the fixed dots.
class FixedDotDecoration {
  /// Fill or stroke color.
  final Color color;

  /// The style of the fixed dot, either fill or stroke.
  final PaintingStyle style;

  /// The width of the stroke, if style is `PaintingStyle.stroke`
  final double strokeWidth;

  const FixedDotDecoration({
    this.color = Colors.grey,
    this.style = PaintingStyle.fill,
    this.strokeWidth = 0.0,
  });
}

/// Defines the decoration for the Indicator.
class IndicatorDecoration {
  /// Fill or stroke color.
  final Color color;

  /// The style of the fixed dot, either fill or stroke.
  final PaintingStyle style;

  /// The width of the stroke, if style is `PaintingStyle.stroke`
  final double strokeWidth;

  const IndicatorDecoration({
    this.color = Colors.deepPurple,
    this.style = PaintingStyle.fill,
    this.strokeWidth = 1,
  });
}
