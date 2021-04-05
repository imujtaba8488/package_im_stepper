library indicators;

import 'package:flutter/material.dart';

import '../core/dot_offset.dart';
import '../core/enums.dart';
import 'shape_painter.dart';

part '../indicators/blink_indicator.dart';
part '../indicators/jump_indicator.dart';
part '../indicators/magnify_indicator.dart';
part '../indicators/shift_indicator.dart';
part '../indicators/shrink_indicator.dart';
part '../indicators/slide_indicator.dart';
part '../indicators/thump_indicator.dart';
part '../indicators/worm_indicator.dart';

abstract class IndicatorPainter extends CustomPainter {
  /// The radius of the indicator.
  double? dotRadius;

  /// The offset of the activeDot.
  late DotOffset activeDotOffset;

  /// The offset of the dot that was selected before the activeDot.
  late DotOffset oldDotOffset;

  /// The stepping direction.
  Axis? direction;

  /// The shape of the indicator.
  Shape? shape;

  /// The Paint() object to use for drawing the indicator.
  Paint? brush;

  Paint? borderBrush;

  /// The animation controller to control the indicator animations.
  AnimationController? animationController;

  /// The type of the indicator to use.
  Indicator? indicator;

  /// Whether the stepping is moving forward or backward.
  bool? isSteppingForward;

  /// Call `draw()` when `paint()` is called by the Flutter engine.
  @override
  void paint(Canvas canvas, Size size) => draw(canvas);

  /// Must be overridden in the subclasses to provide the indicator.
  void draw(Canvas canvas);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  /// Slides the dot based on the direction from the oldDot to the activeDot.
  Animation get slide => Tween(
        begin: 0.0,
        end: direction == Axis.horizontal
            ? xDistanceBetweenOldAndActiveDot
            : yDistanceBetweenOldAndActiveDot,
      ).animate(animationController!);

  /// Returns the distance between the old and activeDot when direction is horizontal.
  double get xDistanceBetweenOldAndActiveDot =>
      activeDotOffset.left - oldDotOffset.left;

  /// Returns the distance between the old and the activeDot when direction is vertical.
  double get yDistanceBetweenOldAndActiveDot =>
      activeDotOffset.top - oldDotOffset.top;
}
