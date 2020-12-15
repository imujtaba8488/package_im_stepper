import 'package:flutter/material.dart';

import 'dot_offset.dart';
import 'dot_stepper.dart';

abstract class IndicatorPainter extends CustomPainter {
  double dotRadius;
  DotOffset activeDotOffset;
  DotOffset oldDotOffset;
  Axis direction;
  Shape shape;
  Paint brush;
  AnimationController animationController;
  Indicator indicator;
  bool isSteppingForward;

  @override
  void paint(Canvas canvas, Size size) => draw(canvas);

  void draw(Canvas canvas);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

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
