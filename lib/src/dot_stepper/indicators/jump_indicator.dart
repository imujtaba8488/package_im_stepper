import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';

import '../indicator_painter.dart';

class JumpIndicator extends IndicatorPainter {
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
      xTranslationFactor: direction == Axis.horizontal ? slide.value : 0.0,
      yTranslationFactor: direction == Axis.vertical ? slide.value : 0.0,
      inflationFactor: jumpDown.value,
    );

    shapePainter.draw(shape);
  }

  Animation get jumpDown => Tween(
        begin: jumpUp.value,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(0.5, 1.0),
        ),
      );

  Animation get jumpUp => Tween(
        begin: 0.0,
        end: dotRadius / 2,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(0.0, 0.5),
        ),
      );
}
