import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/indicator_painter.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';

class WormIndicator extends IndicatorPainter {
  @override
  void draw(Canvas canvas) {
    ShapePainter shapePainter = ShapePainter(
      left: direction == Axis.horizontal ? hLeft : vLeft,
      top: direction == Axis.horizontal ? hTop : vTop,
      right: direction == Axis.horizontal ? hRight : vRight,
      bottom: direction == Axis.horizontal ? hBottom : vBottom,
      canvas: canvas,
      brush: brush,
      direction: direction,
      dotRadius: dotRadius,
    );

    shapePainter.draw(shape);
  }

  double get hLeft => isSteppingForward ? hStretch.value : activeDotOffset.left;

  double get hTop => activeDotOffset.top;

  double get hRight =>
      isSteppingForward ? activeDotOffset.right : hStretch.value;

  double get hBottom => activeDotOffset.bottom;

  double get vLeft => activeDotOffset.left;

  double get vTop => isSteppingForward ? vStretch.value : activeDotOffset.top;

  double get vRight => activeDotOffset.right;

  double get vBottom =>
      isSteppingForward ? activeDotOffset.bottom : vStretch.value;

  Animation get hStretch => Tween(
        begin: isSteppingForward ? oldDotOffset.left : oldDotOffset.right,
        end: isSteppingForward ? activeDotOffset.left : activeDotOffset.right,
      ).animate(animationController);

  Animation get vStretch => Tween(
        begin: isSteppingForward ? oldDotOffset.top : oldDotOffset.bottom,
        end: isSteppingForward ? activeDotOffset.top : activeDotOffset.bottom,
      ).animate(animationController);
}
