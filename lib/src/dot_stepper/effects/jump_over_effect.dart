import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';
import '../dot_stepper.dart';

//? Doesn't work for DotShape.line.
class JumpOver extends DotStepperEffect {
  bool jumpFromAbove;

  JumpOver({this.jumpFromAbove = true});

  @override
  void draw(Canvas canvas) {
    Animation jumpUp = Tween(
      begin: 0.0,
      end: jumpFromAbove ? -dotRadius * 4.0: dotRadius * 4.0,
    ).animate(animationController);

    Animation jumpDown = Tween(
      begin: jumpUp.value,
      end: 0.0,
    ).animate(animationController);

    if (dotShape == DotShape.circle) {
      canvas.drawCircle(
        centerTranslated.translate(0.0, jumpDown.value),
        dotRadius,
        paint,
      );
    } else if (dotShape == DotShape.square) {
      canvas.drawRect(
        Rect.fromCenter(
          center: centerTranslated.translate(0.0, jumpDown.value),
          width: dotRadius,
          height: dotRadius,
        ),
        paint,
      );
    } else if (dotShape == DotShape.rounded_rectangle) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: centerTranslated.translate(0.0, jumpDown.value),
            width: dotRadius * 2,
            height: dotRadius,
          ),
          Radius.circular(5),
        ),
        paint,
      );
    } else if (dotShape == DotShape.line) {
      canvas.drawLine(
        Offset(centerTranslated.dx, centerTranslated.dy),
        Offset(centerTranslated.dx + dotRadius, centerTranslated.dy),
        paint..strokeWidth = 2.0,
      );
    }
  }
}
