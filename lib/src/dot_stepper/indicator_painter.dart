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

  Animation get slide => Tween(
        begin: 0.0,
        end: direction == Axis.horizontal
            ? xDistanceBetweenOldAndActiveDot
            : yDistanceBetweenOldAndActiveDot,
      ).animate(animationController);

  double get xDistanceBetweenOldAndActiveDot =>
      activeDotOffset.left - oldDotOffset.left;

  double get yDistanceBetweenOldAndActiveDot =>
      activeDotOffset.top - oldDotOffset.top;
}
