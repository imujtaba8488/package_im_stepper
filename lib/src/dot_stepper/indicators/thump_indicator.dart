import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/indicator_painter.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';

class ThumpIndicator extends IndicatorPainter {
  @override
  void draw(Canvas canvas) {
    ShapePainter shapePainter = ShapePainter(
      canvas,
      brush,
      direction,
      dotRadius,
      activeDotOffset.left,
      activeDotOffset.top,
      activeDotOffset.right,
      activeDotOffset.bottom,
      inflationFactor: _inflate.value,
    );

    shapePainter.draw(shape);
  }

  Animation get _inflate {
    return Tween(
      begin: -dotRadius * 5,
      end: 0.0,
    ).animate(animationController);
  }
}