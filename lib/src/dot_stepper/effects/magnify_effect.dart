import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';
import '../dot_stepper.dart';

class Magnify extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation magnify = Tween<double>(
      begin: 0.0,
      end: dotRadius * 1.5,
    ).animate(animationController);

    if (dotShape == DotShape.circle) {
      canvas.drawCircle(
        center,
        magnify.value,
        paint,
      );
    } else if (dotShape == DotShape.square) {
      canvas.drawRect(
        Rect.fromCenter(
          center: center,
          width: magnify.value,
          height: magnify.value,
        ),
        paint,
      );
    } else if (dotShape == DotShape.rounded_rectangle) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center,
            width: dotRadius * 3.0,
            height: magnify.value,
          ),
          Radius.circular(8),
        ),
        paint,
      );
    } else if (dotShape == DotShape.dash) {
      canvas.drawLine(
        Offset(center.dx, center.dy),
        Offset(center.dx + dotRadius, center.dy),
        paint..strokeWidth = magnify.value / 3.0,
      );
    }
  }
}
