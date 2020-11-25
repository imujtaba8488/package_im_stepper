import 'package:flutter/material.dart';

import 'dot_stepper_painter.dart';
import 'effects/dot_stepper_effects.dart';
import 'effects/slide_effect.dart';
import 'effects/bullet_effect.dart';
import 'effects/flat_effect.dart';
import 'effects/magnify_effect.dart';
import 'effects/worm_effect.dart';
import 'effects/jump_effect.dart';
import 'effects/trail_effect.dart';
import 'effects/jump_over_effect.dart';

/// Callback fired when a dot is reached.
typedef DotReached = void Function(int index);

typedef StepCount = void Function(int minOrMax);

class DotStepper extends StatefulWidget {
  /// Total number of dots. Each dot represents a step.
  final int dotCount;

  /// The radius of each dot in the DotStepper.
  final double dotRadius;

  /// Whether to go to the next dot or not.
  final bool goNext;

  /// Whether to go to the previous dot or not.
  final bool goPrevious;

  /// Returns the index of the currently selected dot i.e. the index of the step currently reached.
  final DotReached dotReachedIndex;

  /// The direction in which to show the DotStepper.
  final Axis direction;

  /// The color of the dots.
  final Color dotColor;

  // The color of the indicator dot.
  final Color indicatorColor;

  /// Whether to fill the dots with color or show them as outlined.
  final bool fillStep;

  /// The step that is currently active.
  final int activeStep;

  final StepCount minSteps;

  /// The total number of available steps.
  final StepCount maxSteps;

  /// The effect to apply to the indicator.
  final IndicatorEffect indicatorEffect;

  /// The type of the indicator.
  final IndicatorType indicatorType;

  /// The shape of the dot. Can be circle, square, rounded_rectangle,or line.
  final DotShape dotShape;

  DotStepper({
    this.dotCount = 3,
    this.dotRadius = 24.0,
    @Deprecated(
      'Scheduled to be removed in version 0.1.3. Please consider using the activeStep instead. For more information, see examples on https://pub.dev/packages/im_stepper/example',
    )
        this.goNext = false,
    @Deprecated(
      'Scheduled to be removed in version 0.1.3. Please consider using the activeStep instead. For more information, see examples on https://pub.dev/packages/im_stepper/example',
    )
        this.goPrevious = false,
    @Deprecated(
      'Scheduled to be removed in version 0.1.3. After the removal of goNext and goPrevious in v-0.1.3, this function will be redundant, as the same can be tracked using the activeStep. For more information, see examples on https://pub.dev/packages/im_stepper/example',
    )
        this.dotReachedIndex,
    this.direction = Axis.horizontal,
    this.dotColor = Colors.grey,
    this.indicatorColor = Colors.black,
    this.fillStep = true,
    this.indicatorEffect = IndicatorEffect.slide,
    this.indicatorType = IndicatorType.fill,
    this.dotShape = DotShape.circle,
    @required
        this.activeStep,
    @required
        this.minSteps,
    @required
        this.maxSteps,
  }) {
    assert(
      dotCount > 1,
      'It does not make sense to have a dot stepper with less than 2 dots!',
    );

    assert(
      dotRadius >= 10.0,
      'Radius must be greater than or equal to 10.0. Current radius: $dotRadius',
    );

    assert(
      activeStep > 0 && activeStep <= dotCount,
      'activeStep out of range! activeStep must be greater than 0 and less than the total number of dots.',
    );
  }

  @override
  _DotStepperState createState() => _DotStepperState();
}

class _DotStepperState extends State<DotStepper>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  // Whether the stepping is moving in the forward direction or backward direction.
  bool isSteppingForward = true;

  // The currently selected dot. ** Must be set to 1 and not to 0. **
  int _selected;

  ScrollController _scrollController;

  @override
  void initState() {
    _selected = widget.activeStep;

    _scrollController = ScrollController();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward();

    super.initState();
  }

  @override
  void didUpdateWidget(DotStepper oldWidget) {
    //! This Must be removed in v 0.1.3.
    if (widget.goNext && _selected < widget.dotCount) {
      _selected++;
      isSteppingForward = true;

      _scrollToDot();
      _runAnimations();

      if (widget.dotReachedIndex != null) {
        widget.dotReachedIndex(_selected);
      }
    } else if (widget.goPrevious && _selected > 1) {
      _selected--;
      isSteppingForward = false;

      _scrollToDot();

      _runAnimations();

      if (widget.dotReachedIndex != null) {
        widget.dotReachedIndex(_selected);
      }
    }

    // Verify that the active step falls within a valid range.
    if (widget.activeStep > 0 && widget.activeStep < widget.dotCount + 1) {
      _selected = widget.activeStep;

      // Compare activeStep with oldWidget.activeStep. if the former is greater than the later, then stepping is moving forward, else stepping is moving backwards.
      widget.activeStep > oldWidget.activeStep
          ? isSteppingForward = true
          : isSteppingForward = false;

      _scrollToDot();
      _runAnimations();
    }

    super.didUpdateWidget(oldWidget);
  }

  /// Resets and runs the animations.
  void _runAnimations() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Return the min and max step count.
    widget.minSteps(1);
    widget.maxSteps(widget.dotCount);

    return Align(
      child: SingleChildScrollView(
        scrollDirection: widget.direction,
        controller: _scrollController,
        child: CustomPaint(
          painter: DotStepperPainter(
            dotCount: widget.dotCount,
            selectedIndex: _selected,
            axis: widget.direction,
            dotColor: widget.dotColor,
            indicatorColor: widget.indicatorColor,
            fillDot: widget.fillStep,
            animationController: _animationController,
            isSteppingForward: isSteppingForward,
            indicatorType: widget.indicatorType,
            effect: _applyEffect(widget.indicatorEffect),
            dotShape: widget.dotShape,
          ),
          size: Size(
            widget.direction == Axis.horizontal
                ? widget.dotRadius * (widget.dotCount + 1)
                : widget.dotRadius,
            widget.direction == Axis.horizontal
                ? widget.dotRadius
                : widget.dotRadius * (widget.dotCount + 1),
          ),
        ),
      ),
    );
  }

  /// Scrolls to the next selected dot.
  void _scrollToDot() {
    _scrollController.animateTo(
      (widget.dotRadius * _selected) - widget.dotRadius,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  /// Applies the effect to the indicator based on the type of indicator effect.
  DotStepperEffect _applyEffect(IndicatorEffect indicatorEffect) {
    switch (indicatorEffect) {
      case IndicatorEffect.worm:
        return Worm();

      case IndicatorEffect.jump:
        return Jump();

      case IndicatorEffect.bullet:
        return Bullet();

      case IndicatorEffect.magnify:
        return Magnify();

      case IndicatorEffect.flat:
        return Flat();

      case IndicatorEffect.trail:
        return Trail();

      case IndicatorEffect.jump_from_above:
        return JumpOver();

      case IndicatorEffect.jump_from_below:
        return JumpOver(jumpFromAbove: false);

      default:
        return Slide();
    }
  }
}

/// Defines the list of built-in indicator effects.
enum IndicatorEffect {
  worm,
  slide,
  jump,
  bullet,
  magnify,
  flat,
  trail,
  jump_from_above,
  jump_from_below,
}

/// Defines the type of indicator. Filled occupies the entire fixed dot, while as 'contain' appears inside the fixed dot.
enum IndicatorType {
  fill,
  contain,
}

/// Defines the shape of the dot.
enum DotShape {
  circle,
  square,
  rounded_rectangle,
  dash,
}
