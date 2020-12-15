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
    );

    shapePainter.draw(shape);
  }

  Animation get slideLeft => Tween(
        begin: oldDotOffset.left,
        end: activeDotOffset.left,
      ).animate(animationController);

  Animation get slideTop => Tween(
        begin: oldDotOffset.top,
        end: activeDotOffset.top,
      ).animate(animationController);

  Animation get slideRight => Tween(
        begin: oldDotOffset.right,
        end: activeDotOffset.right,
      ).animate(animationController);

  Animation get slideBottom => Tween(
        begin: oldDotOffset.bottom,
        end: activeDotOffset.bottom,
      ).animate(animationController);
}
