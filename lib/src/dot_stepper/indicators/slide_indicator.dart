import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/indicator_painter.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';

class Slide extends IndicatorPainter {
  @override
  void draw(Canvas canvas) {
    ShapePainter shapePainter = ShapePainter(
        canvas,
        brush,
        direction,
        dotRadius,
        oldDotOffset.left,
        oldDotOffset.top,
        oldDotOffset.right,
        oldDotOffset.bottom,
        xTranslate: direction == Axis.horizontal ? slide.value : 0.0,
        yTranslate: direction == Axis.vertical ? slide.value : 0.0);

    shapePainter.draw(shape);
  }
}
