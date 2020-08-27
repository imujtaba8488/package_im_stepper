import 'package:flutter/material.dart';

import 'base_stepper.dart';

class ImageStepper extends StatelessWidget {
  /// Each image defines a step. Hence, total number of images determines the total number of steps.
  final List<Image> images;

  /// Whether to enable or disable the next and previous buttons.
  final bool enableNextPreviousButtons;

  /// Whether to allow tapping a step to move to that step or not.
  final bool enableStepTapping;

  /// Icon to be used for the previous button.
  final Icon previousButtonIcon;

  /// Icon to be used for the next button.
  final Icon nextButtonIcon;

  /// Determines what should happen when a step is reached. This callback provides the __index__ of the step that was reached.
  final OnStepReached onStepReached;

  /// Whether to show the steps horizontally or vertically. __Note: Ensure horizontal stepper goes inside a column and vertical goes inside a row.__
  final Axis direction;

  /// The color of the step when it is not reached.
  final Color stepColor;

  /// The color of a step when it is reached.
  final Color activeStepColor;

  /// The border color of a step when it is reached.
  final Color activeStepBorderColor;

  /// The color of the line that separates the steps.
  final Color lineColor;

  /// The length of the line that separates the steps.
  final double lineLength;

  /// The radius of individual dot within the line that separates the steps.
  final double lineDotRadius;

  /// The radius of a step.
  final double stepRadius;

  /// The animation effect to show when a step is reached.
  final Curve stepReachedAnimationEffect;

  /// The duration of the animation effect to show when a step is reached.
  final Duration stepReachedAnimationDuration;

  /// Whether the stepping is enabled or disabled.
  final bool steppingEnabled;

  ImageStepper({
    this.images,
    this.enableNextPreviousButtons = true,
    this.enableStepTapping = true,
    this.previousButtonIcon,
    this.nextButtonIcon,
    this.onStepReached,
    this.direction = Axis.horizontal,
    this.stepColor,
    this.activeStepColor,
    this.activeStepBorderColor,
    this.lineColor,
    this.lineLength = 50.0,
    this.lineDotRadius = 1.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
    this.steppingEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return CircleStepper(
      children: _imagesWrappedInCircleAvatar(),
      enableNextPreviousButtons: enableNextPreviousButtons,
      enableStepTapping: enableStepTapping,
      previousButtonIcon: previousButtonIcon,
      nextButtonIcon: nextButtonIcon,
      onStepReached: onStepReached,
      direction: direction,
      stepColor: stepColor,
      activeStepColor: activeStepColor,
      activeStepBorderColor: activeStepBorderColor,
      lineColor: lineColor,
      lineLength: lineLength,
      lineDotRadius: lineDotRadius,
      stepRadius: stepRadius,
      stepReachedAnimationEffect: stepReachedAnimationEffect,
      stepReachedAnimationDuration: stepReachedAnimationDuration,
      steppingEnabled: steppingEnabled,
    );
  }

  List<CircleAvatar> _imagesWrappedInCircleAvatar() {
    return List.generate(images.length, (index) {
      return CircleAvatar(
        radius: stepRadius,
        backgroundImage: images[index].image,
      );
    });
  }
}
