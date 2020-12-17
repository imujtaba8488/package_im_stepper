import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/indicator_painter.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';

class MagnifyIndicator extends IndicatorPainter {
  @override
  void draw(Canvas canvas) {
    ShapePainter shapePainter = ShapePainter(
      left: activeDotOffset.left,
      top: activeDotOffset.top,
      right: activeDotOffset.right,
      bottom: activeDotOffset.bottom,
      canvas: canvas,
      brush: brush,
      direction: direction,
      dotRadius: dotRadius,
      cornerRadius: dotRadius * 100,
      // deflate: deflate.value,
      inflate: inflate.value,
    );

    shapePainter.draw(shape);
  }

  Animation get deflate => Tween(
        begin: 0.0,
        end: activeDotOffset.center *  3,
      ).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.5),
      ));

  Animation get inflate => Tween(
        begin: deflate.value,
        end: 6.0,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(0.5, 1.0),
        ),
      );
}
