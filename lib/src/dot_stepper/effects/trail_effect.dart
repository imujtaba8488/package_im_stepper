import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';
import '../dot_stepper.dart';

class Trail extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation fade = Tween(
      begin: dotRadius,
      end: 0.0,
    ).animate(animationController);

    if (dotShape == DotShape.circle) {
      canvas.drawCircle(
        centerTranslated.translate(
          isSteppingForward ? -dotRadius * 1.5 : dotRadius * 1.5,
          0.0,
        ),
        fade.value,
        paint,
      );

      canvas.drawCircle(
        centerTranslated,
        dotRadius,
        paint,
      );
    } else if (dotShape == DotShape.square) {
      canvas.drawRect(
        Rect.fromCenter(
          center: centerTranslated.translate(
            isSteppingForward ? -dotRadius * 1.5 : dotRadius * 1.5,
            0.0,
          ),
          width: fade.value,
          height: fade.value,
        ),
        paint,
      );

      canvas.drawRect(
        Rect.fromCenter(
          center: centerTranslated,
          width: dotRadius,
          height: dotRadius,
        ),
        paint,
      );
    } else if (dotShape == DotShape.rounded_rectange) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: centerTranslated.translate(
              isSteppingForward ? -dotRadius * 1.5 : dotRadius * 1.5,
              0.0,
            ),
            width: dotRadius * 2,
            height: fade.value,
          ),
          Radius.circular(5),
        ),
        paint,
      );

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: centerTranslated,
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
        Offset(centerTranslated.dx + fade.value, centerTranslated.dy),
        paint..strokeWidth = 2.0,
      );

      canvas.drawLine(
        Offset(center.dx, center.dy),
        Offset(center.dx + dotRadius, center.dy),
        paint..strokeWidth = 2.0,
      );
    }
  }
}
