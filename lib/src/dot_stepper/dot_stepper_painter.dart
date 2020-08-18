import 'package:flutter/material.dart';

import 'dot_stepper.dart';
import 'dot_stepper_effects.dart';

class DotStepperPainter extends CustomPainter {
  /// Total number of dots.
  final int dotCount;

  /// The index of the step that is currently selected.
  final int selectedIndex;

  /// Whether the stepping is moving forward or backward.
  final bool isSteppingForward;

  /// Color of dot.
  final Color dotColor;

  /// Color of the indicator.
  final Color indicatorColor;

  /// Whether to fill the dot with color or display it as outlined.
  final bool fillDot;

  /// The effect to apply to the indicator.
  final DotStepperEffect effect;

  /// The type of the indicator i.e. whether filled or contained
  final IndicatorType indicatorType;

  /// The axis along which to show the dots i.e. horizontal or vertical.
  final Axis axis;

  /// Controls the indicator animations.
  final AnimationController animationController;

  DotStepperPainter({
    this.dotCount = 3,
    this.selectedIndex,
    this.isSteppingForward,
    this.dotColor = Colors.blueGrey,
    this.indicatorColor = Colors.deepPurple,
    this.fillDot = true,
    this.effect,
    this.indicatorType = IndicatorType.contain,
    this.axis = Axis.horizontal,
    this.animationController,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Radius of a single dot.
    double dotRadius =
        axis == Axis.horizontal ? size.height / 4.0 : size.width / 4.0;

    // Spacing between dots.
    double spacing = axis == Axis.horizontal ? size.height : size.width;

    _drawFixedDots(canvas, dotRadius, spacing);
    _drawIndicator(canvas, dotRadius, spacing);
  }

  /// Draws the fixed dots.
  void _drawFixedDots(Canvas canvas, double dotRadius, double spacing) {
    // Center determines where each dot will be painted. This changes by an amount of spacing each time through the loop.
    Offset center = Offset(
      axis == Axis.horizontal ? spacing : spacing / 2.0,
      axis == Axis.horizontal ? spacing / 2.0 : spacing,
    );

    for (int index = 0; index < dotCount; index++) {
      canvas.drawCircle(
        center,
        dotRadius,
        Paint()
          ..color = dotColor
          ..style = fillDot ? PaintingStyle.fill : PaintingStyle.stroke
          ..strokeWidth = 1,
      );

      /// Move the dot by an amount of spacing.
      center = center.translate(
        axis == Axis.horizontal ? spacing : 0.0,
        axis == Axis.horizontal ? 0.0 : spacing,
      );
    }
  }

  /// Sets the indicator effect properties and draws in the indicator.
  void _drawIndicator(Canvas canvas, double dotRadius, double spacing) {
    // Set indicator effect properties.
    effect.dotRadius =
        indicatorType == IndicatorType.fill ? dotRadius : dotRadius / 1.5;
    effect.spacing = spacing;
    effect.selectedIndex = selectedIndex;
    effect.isSteppingForward = isSteppingForward;
    effect.stepColor = indicatorColor;
    effect.axis = axis;
    effect.animationController = animationController;

    // draw the indicator.
    effect.draw(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
