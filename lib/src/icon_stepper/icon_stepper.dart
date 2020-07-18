import 'package:flutter/material.dart';

import 'src/icon_stepper/../../icon_indicator.dart';
import '../custom_paint/dotted_line.dart';

/// Callback is fired when a step is reached.
typedef OnStepReached = void Function(int index);

class IconStepper extends StatefulWidget {
  /// Each icon defines a step. Hence, total number of icon determines the total number of steps.
  final List<Icon> icons;

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

  /// Whether to show the steps horizontally or vertically. __Note: If wrapping within a column, ensure horizontal stepper goes inside a column and vertical goes inside a row.__
  final Axis direction;

  /// The color of a step when it is reached.
  final Color activeColor;

  /// The border color of a step when it is reached.
  final Color activeBorderColor;

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

  IconStepper({
    this.icons,
    this.enableNextPreviousButtons = true,
    this.enableStepTapping = true,
    this.previousButtonIcon,
    this.nextButtonIcon,
    this.onStepReached,
    this.direction = Axis.horizontal,
    this.activeColor,
    this.activeBorderColor,
    this.lineColor,
    this.lineLength = 50.0,
    this.lineDotRadius = 1.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
  }) {
    assert(
      lineDotRadius <= 10 && lineDotRadius > 0,
      'lineDotRadius must be less than or equal to 10 and greater than 0',
    );

    assert(
      stepRadius > 0,
      'iconIndicatorRadius must be greater than 0',
    );
  }

  @override
  _IconStepperState createState() => _IconStepperState();
}

class _IconStepperState extends State<IconStepper>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    this.scrollController = ScrollController();
    // widget.onStepReached(selectedIndex);
  }

  void _afterLayout(_) {
    for (int i = 0; i < widget.icons.length; i++) {
      scrollController.animateTo(
        i * ((widget.stepRadius * 2.0) + widget.lineLength),
        duration: widget.stepReachedAnimationDuration,
        curve: widget.stepReachedAnimationEffect,
      );

      if (selectedIndex == i) {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);

    return widget.direction == Axis.horizontal
        ? Row(
            children: <Widget>[
              widget.enableNextPreviousButtons
                  ? _previousButton()
                  : Container(),
              Expanded(
                child: _stepperBuilder(),
              ),
              widget.enableNextPreviousButtons ? _nextButton() : Container(),
            ],
          )
        : Column(
            children: <Widget>[
              widget.enableNextPreviousButtons
                  ? _previousButton()
                  : Container(),
              Expanded(
                child: _stepperBuilder(),
              ),
              widget.enableNextPreviousButtons ? _nextButton() : Container(),
            ],
          );
  }

  Widget _stepperBuilder() {
    return SingleChildScrollView(
      scrollDirection: widget.direction,
      controller: scrollController,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(8.0),
        child: widget.direction == Axis.horizontal
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildSteps(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildSteps(),
              ),
      ),
    );
  }

  List<Widget> buildSteps() {
    return List.generate(
      widget.icons.length,
      (index) {
        return widget.direction == Axis.horizontal
            ? Row(
                children: <Widget>[
                  IconIndicator(
                    index: index + 1,
                    icon: Icon(
                      widget.icons[index].icon,
                      size: widget.stepRadius,
                      color: widget.icons[index].color,
                    ),
                    isSelected: selectedIndex == index,
                    onPressed: widget.enableStepTapping
                        ? () {
                            setState(() {
                              selectedIndex = index;
                              widget.onStepReached(selectedIndex);
                            });
                          }
                        : null,
                    activeColor: widget.activeColor,
                    activeBorderColor: widget.activeBorderColor,
                    radius: widget.stepRadius,
                  ),
                  index < widget.icons.length - 1
                      ? DottedLine(
                          length: widget.lineLength ?? 50,
                          color: widget.lineColor ?? Colors.blue,
                          dotRadius: widget.lineDotRadius ?? 1.0,
                          spacing: 5.0,
                        )
                      : Container(),
                ],
              )
            : Column(
                children: <Widget>[
                  IconIndicator(
                    index: index + 1,
                    icon: Icon(
                      widget.icons[index].icon,
                      size: widget.stepRadius,
                      color: widget.icons[index].color,
                    ),
                    isSelected: selectedIndex == index,
                    onPressed: widget.enableStepTapping
                        ? () {
                            setState(() {
                              selectedIndex = index;
                              widget.onStepReached(selectedIndex);
                            });
                          }
                        : null,
                    activeColor: widget.activeColor,
                    activeBorderColor: widget.activeBorderColor,
                    radius: widget.stepRadius,
                  ),
                  index < widget.icons.length - 1
                      ? DottedLine(
                          length: 50,
                          color: Colors.blue,
                          dotRadius: 1.0,
                          spacing: 5.0,
                          axis: Axis.vertical,
                        )
                      : Container(),
                ],
              );
      },
    );
  }

  Widget _previousButton() {
    return IgnorePointer(
      ignoring: selectedIndex == 0,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: widget?.nextButtonIcon ??
            Icon(
              widget.direction == Axis.horizontal
                  ? Icons.arrow_left
                  : Icons.arrow_drop_up,
            ),
        onPressed: () {
          if (selectedIndex > 0) {
            setState(() {
              selectedIndex--;
              widget.onStepReached(selectedIndex);
            });
          } else {
            print('No more Next steps.');
          }
        },
      ),
    );
  }

  Widget _nextButton() {
    return IgnorePointer(
      ignoring: selectedIndex == widget.icons.length - 1,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: widget?.nextButtonIcon ??
            Icon(
              widget.direction == Axis.horizontal
                  ? Icons.arrow_right
                  : Icons.arrow_drop_down,
            ),
        onPressed: () {
          if (selectedIndex < widget.icons.length - 1) {
            setState(() {
              selectedIndex++;
              widget.onStepReached(selectedIndex);
            });
          } else {
            print('No more Next steps.');
          }
        },
      ),
    );
  }
}

class IconStep {
  final Icon icon;

  IconStep({
    this.icon,
  });
}
