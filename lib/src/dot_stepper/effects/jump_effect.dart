import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';
import '../dot_stepper.dart';

class Jump extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    // Animate from actual size to twice the size.
    Animation jumpUp = Tween(
      begin: dotRadius,
      end: dotRadius * 2,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.0,
        0.5,
      ),
    ));

    // Animate from twice the size to actual size.
    Animation jumpDown = Tween(
      begin: jumpUp.value,
      end: dotRadius,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.5,
        1.0,
      ),
    ));

    if (dotShape == DotShape.circle) {
      canvas.drawCircle(
        centerTranslated,
        jumpDown.value,
        paint,
      );
    } else if (dotShape == DotShape.square) {
      canvas.drawRect(
        Rect.fromCenter(
          center: centerTranslated,
          width: jumpDown.value,
          height: jumpDown.value,
        ),
        paint,
      );
    } else if (dotShape == DotShape.rounded_rectange) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: centerTranslated,
            width: dotRadius * 2,
            height: jumpDown.value,
          ),
          Radius.circular(5),
        ),
        paint,
      );
    } else if (dotShape == DotShape.line) {
      canvas.drawLine(
        Offset(centerTranslated.dx, centerTranslated.dy),
        Offset(centerTranslated.dx + dotRadius, centerTranslated.dy),
        paint..strokeWidth = jumpDown.value / 3.0,
      );
    }
  }
}
