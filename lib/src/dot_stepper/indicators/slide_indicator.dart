import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/indicator_painter.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';

class SlideIndicator extends IndicatorPainter {
  @override
  void draw(Canvas canvas) {
    ShapePainter shapePainter = ShapePainter(
      left: slideLeft.value,
      top: slideTop.value,
      right: slideRight.value,
      bottom: slideBottom.value,
      canvas: canvas,
      brush: brush,
      direction: direction,
      dotRadius: dotRadius,
      cornerRadius: dotRadius,
    );

    shapePainter.draw(shape);
  }
}
