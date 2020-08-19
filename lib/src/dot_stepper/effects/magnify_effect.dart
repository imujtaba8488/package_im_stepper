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
        centerTranslated,
        magnify.value,
        paint,
      );
    } else if (dotShape == DotShape.square) {
      canvas.drawRect(
        Rect.fromCenter(
          center: centerTranslated,
          width: magnify.value,
          height: magnify.value,
        ),
        paint,
      );
    } else if (dotShape == DotShape.rounded_rectange) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: centerTranslated,
            width: dotRadius * 2,
            height: magnify.value,
          ),
          Radius.circular(5),
        ),
        paint,
      );
    } else if (dotShape == DotShape.line) {
      canvas.drawLine(
        Offset(centerTranslated.dx, centerTranslated.dy),
        Offset(centerTranslated.dx + dotRadius, centerTranslated.dy),
        paint .. strokeWidth = magnify.value / 3.0,
      );
    }
  }
}
