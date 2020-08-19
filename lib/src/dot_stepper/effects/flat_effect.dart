import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';

class Flat extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    canvas.drawCircle(
      center,
      dotRadius,
      paint,
    );
  }
}
