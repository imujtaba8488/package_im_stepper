import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';
import '../dot_stepper.dart';

class Bullet extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation start = Tween(
      begin: dotRadius,
      end: 0.5,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.8),
      ),
    );

    Animation bullet = Tween(
      begin: start.value,
      end: dotRadius,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 0.9),
      ),
    );

    if (dotShape == DotShape.circle) {
      canvas.drawCircle(
        centerTranslated,
        bullet.value,
        paint,
      );
    } else if (dotShape == DotShape.square) {
      canvas.drawRect(
        Rect.fromCenter(
          center: centerTranslated,
          width: bullet.value,
          height: bullet.value,
        ),
        paint,
      );
    } else if (dotShape == DotShape.rounded_rectangle) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: centerTranslated,
            width: dotRadius * 2,
            height: bullet.value,
          ),
          Radius.circular(5),
        ),
        paint,
      );
    } else if (dotShape == DotShape.line) {
      canvas.drawLine(
        Offset(centerTranslated.dx, centerTranslated.dy),
        Offset(centerTranslated.dx + dotRadius, centerTranslated.dy),
        paint..strokeWidth = bullet.value / 3.0,
      );
    }
  }
}
