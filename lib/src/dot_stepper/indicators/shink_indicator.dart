import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/indicator_painter.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';

class ShinkIndicator extends IndicatorPainter {
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
      xTranslationFactor: direction == Axis.horizontal ? slideFast.value : 0.0,
      yTranslationFactor: direction == Axis.vertical ? slideFast.value : 0.0,
      inflationFactor: _inflate.value,
    );

    shapePainter.draw(shape);
  }

  Animation get slideFast => Tween(
        begin: 0.0,
        end: direction == Axis.horizontal
            ? xDistanceBetweenOldAndActiveDot
            : yDistanceBetweenOldAndActiveDot,
      ).animate(
        CurvedAnimation(
          curve: Interval(0.0, 0.3),
          parent: animationController,
        ),
      );

  Animation get _inflate {
    return Tween(
      begin: 0.0,
      end: -dotRadius / 2,
    ).animate(
      CurvedAnimation(
        curve: Interval(0.5, 1.0),
        parent: animationController,
      ),
    );
  }
}
