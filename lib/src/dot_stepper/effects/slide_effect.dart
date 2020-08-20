import 'package:flutter/material.dart';

import '../dot_stepper.dart';
import 'dot_stepper_effects.dart';

class Slide extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    if (dotShape == DotShape.circle) {
      canvas.drawCircle(
        centerTranslated,
        dotRadius,
        paint,
      );
    } else if (dotShape == DotShape.square) {
      canvas.drawRect(
        Rect.fromCenter(
          center: centerTranslated,
          width: dotRadius,
          height: dotRadius,
        ),
        paint,
      );
    } else if (dotShape == DotShape.rounded_rectangle) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: centerTranslated,
            width: dotRadius * 2,
            height: dotRadius,
          ),
          Radius.circular(5.0),
        ),
        paint,
      );
    } else if (dotShape == DotShape.line) {
      canvas.drawLine(
        Offset(centerTranslated.dx, centerTranslated.dy),
        Offset(centerTranslated.dx + dotRadius, centerTranslated.dy),
        Paint()
          ..color = dotColor
          ..strokeWidth = 2.0,
      );
    }
  }
}
