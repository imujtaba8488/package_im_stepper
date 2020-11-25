import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';
import '../dot_stepper.dart';

class Flat extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    if (dotShape == DotShape.circle) {
      canvas.drawCircle(
        center,
        dotRadius,
        paint,
      );
    } else if (dotShape == DotShape.square) {
      canvas.drawRect(
        Rect.fromCenter(
          center: center,
          width: dotRadius,
          height: dotRadius,
        ),
        paint,
      );
    } else if (dotShape == DotShape.rounded_rectangle) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center,
            width: dotRadius * 2,
            height: dotRadius,
          ),
          Radius.circular(5),
        ),
        paint,
      );
    } else if (dotShape == DotShape.dash) {
      canvas.drawLine(
        Offset(center.dx, center.dy),
        Offset(center.dx + dotRadius, center.dy),
        paint..strokeWidth = 2.0,
      );
    }
  }
}
