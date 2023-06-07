import 'package:flutter/material.dart';

import 'core/base_stepper.dart';

/// In general, the stepper widgets help you to show or collect information from users using organized steps. The IconStepper is a simple to use icon stepper widget, wherein each icon defines a step. Hence, the total number of icons represents the total number of available steps.
class IconStepper extends StatelessWidget {
  /// Each icon defines a step. Hence, total number of icons determines the total number of steps.
  final List<Icon>? icons;

  /// Whether to enable or disable the next and previous buttons.
  final bool enableNextPreviousButtons;

  /// Whether to allow tapping a step to move to that step or not.
  final bool enableStepTapping;

  /// Icon to be used for the previous button.
  final Icon? previousButtonIcon;

  /// Icon to be used for the next button.
  final Icon? nextButtonIcon;

  /// Determines what should happen when a step is reached. This callback provides the __index__ of the step that was reached.
  final OnStepReached? onStepReached;

  /// Whether to show the steps horizontally or vertically. __Note: Ensure horizontal stepper goes inside a column and vertical goes inside a row.__
  final Axis direction;

  /// The color of the step when it is not reached.
  final Color? stepColor;

  /// The amount of padding inside a step.
  final double stepPadding;

  /// The color of a step when it is reached.
  final Color? activeStepColor;

  /// The border color of a step when it is reached.
  final Color? activeStepBorderColor;

  /// The border width of the active step.
  final double activeStepBorderWidth;

  /// Determines how far away the border should be drawn from the step when it is reached.
  final double activeStepBorderPadding;

  /// The color of the line that separates the steps.
  final Color? lineColor;

  /// The length of the line that separates the steps.
  final double lineLength;

  /// The radius of individual dot within the line that separates the steps.
  final double lineDotRadius;

  /// The radius of a step.
  final double stepRadius;

  //if Complete function call
  final Function? stepsCompletedStatusMap;

  /// The animation effect to show when a step is reached.
  final Curve stepReachedAnimationEffect;

  /// The duration of the animation effect to show when a step is reached.
  final Duration stepReachedAnimationDuration;

  /// Whether the stepping is enabled or disabled.
  final bool steppingEnabled;

  /// Whether the scrolling is disabled or not.
  final bool scrollingDisabled;

  /// The currently active step.
  final int activeStep;

  /// Specifies the alignment of IconStepper widget.
  final AlignmentGeometry alignment;

  //completed Stepper color
  final Color? stepCompletedColor;

  //Animate Selected Stepper in middle
  final bool? stepperAnimateInMiddle;

  // completed Map
  final Map<String, int>? completedTasks;

  //Enable Text
  final bool enableText;

  //Text Style
  final TextStyle? textStyle;

  //text for icons
  final List<String>? texts;

  //Space between Icon and Text
  final double iconAndTextSpacing;

  /// Creates an IconStepper widget.
  const IconStepper({
    super.key,
    this.completedTasks,
    this.stepperAnimateInMiddle,
    this.stepsCompletedStatusMap,
    this.stepCompletedColor,
    this.icons,
    this.enableNextPreviousButtons = true,
    this.enableStepTapping = true,
    this.previousButtonIcon,
    this.nextButtonIcon,
    this.onStepReached,
    this.direction = Axis.horizontal,
    this.stepColor,
    this.stepPadding = 1.0,
    this.activeStepColor,
    this.activeStepBorderColor,
    this.activeStepBorderWidth = 0.5,
    this.activeStepBorderPadding = 5.0,
    this.lineColor,
    this.lineLength = 50.0,
    this.lineDotRadius = 1.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
    this.steppingEnabled = true,
    this.scrollingDisabled = false,
    this.activeStep = 0,
    this.alignment = Alignment.center,
    this.enableText = false,
    this.textStyle,
    this.texts,
    this.iconAndTextSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BaseStepper(
      completedSteps: completedTasks,
      stepperAnimateInMiddle: stepperAnimateInMiddle,
      stepCompetedColor: stepCompletedColor,
      nextPreviousButtonsDisabled: enableNextPreviousButtons,
      stepTappingDisabled: enableStepTapping,
      previousButtonIcon: previousButtonIcon,
      nextButtonIcon: nextButtonIcon,
      onStepReached: onStepReached,
      direction: direction,
      stepColor: stepColor,
      activeStepColor: activeStepColor,
      activeStepBorderColor: activeStepBorderColor,
      activeStepBorderWidth: activeStepBorderWidth,
      lineColor: lineColor,
      lineLength: lineLength,
      lineDotRadius: lineDotRadius,
      stepRadius: stepRadius,
      stepReachedAnimationEffect: stepReachedAnimationEffect,
      stepReachedAnimationDuration: stepReachedAnimationDuration,
      steppingEnabled: steppingEnabled,
      margin: activeStepBorderPadding,
      padding: stepPadding,
      scrollingDisabled: scrollingDisabled,
      activeStep: activeStep,
      alignment: alignment,
      enableText: enableText,
      textStyle: textStyle,
      texts: texts,
      iconAndTextSpacing: iconAndTextSpacing,
      children: _iconsWithSizeOverridden(),
    );
  }

  // Overrides the size of the icons to almost fit the step.
  List<Icon> _iconsWithSizeOverridden() {
    return List.generate(icons!.length, (index) {
      return Icon(
        icons![index].icon,
        color: icons![index].color,
        size: stepRadius * 1.2,
      );
    });
  }
}
