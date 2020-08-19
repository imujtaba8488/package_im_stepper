import 'package:flutter/material.dart';

import 'package:im_stepper/stepper.dart';

abstract class DotStepperEffect {
  /// The radius of a single dot.
  double dotRadius;

  /// The amount of spacing between the dots.
  double spacing;

  /// The index of the dot currently selected.
  int selectedIndex;

  /// Whether the stepping is proceeding in forward or backward direction.
  bool isSteppingForward;

  /// Color of the selected dot.
  Color dotColor;

  /// Whether to dots are shown horizontally or vertically.
  Axis axis;

  /// Animation controller controlling all the animations.
  AnimationController animationController;

  DotShape dotShape;

  void draw(Canvas canvas);

  Animation get _translateForward {
    return Tween(
      begin: selectedIndex > 1 ? spacing * (selectedIndex - 1) : spacing,
      end: spacing * selectedIndex,
    ).animate(animationController);
  }

  Animation get _translateBackward {
    return Tween(
      begin: (selectedIndex + 1) * spacing,
      end: selectedIndex * spacing,
    ).animate(animationController);
  }

  Offset get center {
    return Offset(
      axis == Axis.horizontal ? spacing * selectedIndex : spacing / 2.0,
      axis == Axis.horizontal ? spacing / 2.0 : spacing * selectedIndex,
    );
  }

  Offset get centerTranslated {
    return Offset(
      axis == Axis.horizontal
          ? isSteppingForward
              ? _translateForward.value
              : _translateBackward.value
          : spacing / 2.0,
      axis == Axis.horizontal
          ? spacing / 2.0
          : isSteppingForward
              ? _translateForward.value
              : _translateBackward.value,
    );
  }

  Paint get paint => Paint()..color = dotColor;
}
