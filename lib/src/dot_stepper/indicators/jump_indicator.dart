import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/indicator_painter.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';

class JumpIndicator extends IndicatorPainter {
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
      inflate: zoomOut.value,
      cornerRadius: dotRadius * 2,
    );

    shapePainter.draw(shape);
  }

  Animation get zoomIn => Tween(
        begin: 0.0,
        end: dotRadius,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(0.0, 0.5),
        ),
      );

  Animation get zoomOut => Tween(
        begin: zoomIn.value,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(0.5, 1.0),
        ),
      );
}
