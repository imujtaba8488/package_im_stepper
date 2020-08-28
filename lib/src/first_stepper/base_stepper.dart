import 'package:flutter/material.dart';

import 'base_indicator.dart';
import '../custom_paint/dotted_line.dart';

/// Callback is fired when a step is reached.
typedef OnStepReached = void Function(int index);

class BaseStepper extends StatefulWidget {
  /// Each child defines a step. Hence, total number of icons determines the total number of steps.
  final List<Widget> children;

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

  /// Amount of padding on each side of the child widget.
  final double padding;

  /// Amount of margin on each side of the step.
  final double margin;

  /// The width of the active step border.
  final double activeStepBorderWidth;

  BaseStepper({
    this.children,
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
    this.padding = 5.0,
    this.margin = 1.0,
    this.activeStepBorderWidth = 0.5,
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
  _BaseStepperState createState() => _BaseStepperState();
}

class _BaseStepperState extends State<BaseStepper> {
  ScrollController _scrollController;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _selectedIndex = 0;
    this._scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  /// Controls the step scrolling.
  void _afterLayout(_) {
    // * This owes an explanation.
    for (int i = 0; i < widget.children.length; i++) {
      _scrollController.animateTo(
        i * ((widget.stepRadius * 2) + widget.lineLength),
        duration: widget.stepReachedAnimationDuration,
        curve: widget.stepReachedAnimationEffect,
      );

      if (_selectedIndex == i) break;
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

  /// Builds the stepper.
  Widget _stepperBuilder() {
    return SingleChildScrollView(
      scrollDirection: widget.direction,
      controller: _scrollController,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(8.0),
        child: widget.direction == Axis.horizontal
            ? Row(children: _buildSteps())
            : Column(children: _buildSteps()),
      ),
    );
  }

  /// Builds the stepper steps.
  List<Widget> _buildSteps() {
    return List.generate(
      widget.children.length,
      (index) {
        return widget.direction == Axis.horizontal
            ? Row(
                children: <Widget>[
                  _customizedIndicator(index),
                  _customizedDottedLine(index, Axis.horizontal),
                ],
              )
            : Column(
                children: <Widget>[
                  _customizedIndicator(index),
                  _customizedDottedLine(index, Axis.vertical),
                ],
              );
      },
    );
  }

  /// A customized IconStep.
  Widget _customizedIndicator(int index) {
    return BaseIndicator(
      child: widget.children[index],
      isSelected: _selectedIndex == index,
      onPressed: widget.enableStepTapping
          ? () {
              if (widget.steppingEnabled) {
                setState(() {
                  _selectedIndex = index;

                  if (widget.onStepReached != null) {
                    widget.onStepReached(_selectedIndex);
                  }
                });
              }
            }
          : null,
      color: widget.stepColor,
      activeColor: widget.activeStepColor,
      activeBorderColor: widget.activeStepBorderColor,
      radius: widget.stepRadius,
      padding: widget.padding,
      margin: widget.margin,
      activeBorderWidth: widget.activeStepBorderWidth,
    );
  }

  /// A customized DottedLine.
  Widget _customizedDottedLine(int index, Axis axis) {
    return index < widget.children.length - 1
        ? DottedLine(
            length: widget.lineLength ?? 50,
            color: widget.lineColor ?? Colors.blue,
            dotRadius: widget.lineDotRadius ?? 1.0,
            spacing: 5.0,
            axis: axis,
          )
        : Container();
  }

  /// The previous button.
  Widget _previousButton() {
    return IgnorePointer(
      ignoring: _selectedIndex == 0,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: widget?.nextButtonIcon ??
            Icon(
              widget.direction == Axis.horizontal
                  ? Icons.arrow_left
                  : Icons.arrow_drop_up,
            ),
        onPressed: () {
          if (_selectedIndex > 0) {
            setState(() {
              _selectedIndex--;

              if (widget.onStepReached != null) {
                widget.onStepReached(_selectedIndex);
              }
            });
          }
        },
      ),
    );
  }

  /// The next button.
  Widget _nextButton() {
    return IgnorePointer(
      ignoring: _selectedIndex == widget.children.length - 1,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: widget?.nextButtonIcon ??
            Icon(
              widget.direction == Axis.horizontal
                  ? Icons.arrow_right
                  : Icons.arrow_drop_down,
            ),
        onPressed: () {
          if (_selectedIndex < widget.children.length - 1 &&
              widget.steppingEnabled) {
            setState(() {
              _selectedIndex++;

              if (widget.onStepReached != null) {
                widget.onStepReached(_selectedIndex);
              }
            });
          }
        },
      ),
    );
  }
}
