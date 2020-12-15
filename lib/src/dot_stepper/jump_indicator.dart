import 'package:flutter/material.dart';

import 'dot_offset.dart';
import 'dot_stepper.dart';
import 'shape_painter.dart';

class JumpIndicator extends CustomPainter {
  JumpIndicator({
    this.dotRadius,
    this.activeDotIndexOffset,
    this.oldDotIndexOffset,
    this.direction,
    this.shape,
    this.brush,
    this.animationController,
  });

  final double dotRadius;
  final DotOffset activeDotIndexOffset;
  final DotOffset oldDotIndexOffset;
  final Axis direction;
  final Shape shape;
  final Paint brush;
  final AnimationController animationController;

  @override
  void paint(Canvas canvas, Size size) {
    ShapePainter shapePainter = ShapePainter(
      brush: brush,
      canvas: canvas,
      direction: direction,
      center: Offset(
        direction == Axis.horizontal ? forward.value : dotRadius,
        direction == Axis.horizontal ? dotRadius : forward.value,
      ),
      dotRadius: down.value,
    );

    shapePainter.draw(shape);
  }

  Animation get forward => Tween(
        begin: direction == Axis.horizontal
            ? oldDotIndexOffset.center.dx
            : oldDotIndexOffset.center.dy,
        end: direction == Axis.horizontal
            ? activeDotIndexOffset.center.dx
            : activeDotIndexOffset.center.dy,
      ).animate(animationController);

  Animation get up => Tween(
        begin: dotRadius,
        end: dotRadius * 2,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(0.0, 0.5),
        ),
      );

  Animation get down => Tween(
        begin: up.value,
        end: dotRadius,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(0.5, 1.0),
        ),
      );

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
