import 'package:flutter/material.dart';

/// Defines the decoration for the line connectors between the dots.
class LineConnectorDecoration {
  /// The stroke color.
  final Color color;

  /// The width of the stroke.
  final double strokeWidth;

  final double linePadding;

  const LineConnectorDecoration({
    this.color = Colors.blueGrey,
    this.strokeWidth = 1.0,
    this.linePadding = 0.0,
  });
}

/// Defines the decoration for the fixed dots.
class FixedDotDecoration {
  /// Fill color.
  final Color color;

  /// The width of the stroke, if style is `PaintingStyle.stroke`
  final double strokeWidth;

  /// The color of the stroke.
  final Color strokeColor;

  const FixedDotDecoration({
    this.color = Colors.grey,
    this.strokeWidth = 0.0,
    this.strokeColor = Colors.grey,
  });
}

/// Defines the decoration for the Indicator.
class IndicatorDecoration {
  /// Fill or stroke color.
  final Color color;

  final Color strokeColor;

  /// The width of the stroke, if style is `PaintingStyle.stroke`
  final double strokeWidth;

  const IndicatorDecoration({
    this.color = Colors.deepPurple,
    this.strokeColor = Colors.deepPurple,
    this.strokeWidth = 1,
  });
}
