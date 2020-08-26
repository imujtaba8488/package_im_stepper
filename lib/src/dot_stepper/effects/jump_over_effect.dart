import 'package:flutter/material.dart';

import 'package:im_stepper/src/dot_stepper/effects/dot_stepper_effects.dart';

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

    canvas.drawCircle(
      centerTranslated.translate(0.0, jumpDown.value),
      dotRadius,
      paint,
    );
  }
}
