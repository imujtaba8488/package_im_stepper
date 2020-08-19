import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';

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

    canvas.drawCircle(
      centerTranslated,
      bullet.value,
      paint,
    );
  }
}
