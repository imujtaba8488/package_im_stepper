import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';

class Trail extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation fade = Tween(
      begin: dotRadius,
      end: 0.0,
    ).animate(animationController);

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
  }
}
