import 'package:flutter/material.dart';

class LineConnectorDecoration {
  final Color color;
  final double weight;

  const LineConnectorDecoration({
    this.color = Colors.blueGrey,
    this.weight = 1.0,
  });
}

class FixedDotDecoration {
  final Color color;
  final PaintingStyle style;
  final double strokeWidth;

  const FixedDotDecoration({
    this.color = Colors.grey,
    this.style = PaintingStyle.fill,
    this.strokeWidth = 0.0,
  });
}

class IndicatorDecoration {
  final Color color;
  final PaintingStyle style;
  final double strokeWidth;

  const IndicatorDecoration({
    this.color = Colors.deepPurple,
    this.style = PaintingStyle.fill,
    this.strokeWidth = 1,
  });
}
