import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';

class Worm extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation stretch = Tween(
      begin: spacing * 1.5,
      end: dotRadius * 2,
    ).animate(animationController);

    Animation centerExcessForward = Tween(
      begin: dotRadius * 2,
      end: 0.0,
    ).animate(animationController);

    Animation centerExcessBackward = Tween(
      begin: -(dotRadius * 2),
      end: 0.0,
    ).animate(animationController);

    Rect rect = Rect.fromCenter(
      center: centerTranslated.translate(
        axis == Axis.horizontal
            ? isSteppingForward
                ? centerExcessForward.value
                : centerExcessBackward.value
            : 0.0,
        axis == Axis.horizontal
            ? 0.0
            : isSteppingForward
                ? centerExcessForward.value
                : centerExcessBackward.value,
      ),
      height: axis == Axis.horizontal ? dotRadius * 2.0 : stretch.value,
      width: axis == Axis.horizontal ? stretch.value : dotRadius * 2.0,
    );

    RRect rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(dotRadius),
    );

    canvas.drawRRect(
      rRect,
      paint,
    );
  }
}
