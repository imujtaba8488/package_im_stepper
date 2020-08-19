import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';

class Magnify extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation magnify = Tween<double>(
      begin: 0.0,
      end: dotRadius * 1.5,
    ).animate(animationController);

    canvas.drawCircle(
      center,
      magnify.value,
      paint,
    );
  }
}
