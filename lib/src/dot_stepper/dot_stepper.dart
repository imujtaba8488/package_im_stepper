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

/// Callback fired when a dot is reached.
typedef DotReached = void Function(int index);

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

  /// The effect to apply to the indicator.
  final IndicatorEffect indicatorEffect;

  /// The type of the indicator.
  final IndicatorType indicatorType;

  final DotShape dotShape;

  DotStepper({
    this.dotCount = 3,
    this.dotRadius = 24.0,
    this.goNext = false,
    this.goPrevious = false,
    this.dotReachedIndex,
    this.direction = Axis.horizontal,
    this.dotColor = Colors.grey,
    this.indicatorColor = Colors.black,
    this.fillStep = true,
    this.indicatorEffect = IndicatorEffect.slide,
    this.indicatorType = IndicatorType.fill,
    this.dotShape = DotShape.circle,
  }) {
    assert(
      dotRadius >= 10.0,
      'Radius must be greater than or equal to 10.0. Current radius: $dotRadius',
    );
  }

  @override
  _DotStepperState createState() => _DotStepperState();
}

class _DotStepperState extends State<DotStepper>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  // Whether the stepping is moving in the forward director or backward direction.
  bool isSteppingForward = true;

  // The currently selected dot. ** Must be set to 1 and not to 0. **
  int selected = 1;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward();
  }

  @override
  void didUpdateWidget(DotStepper oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.goNext && selected < widget.dotCount) {
      selected++;
      isSteppingForward = true;

      _scrollToDot();
      _runAnimations();

      if (widget.dotReachedIndex != null) {
        widget.dotReachedIndex(selected);
      }
    } else if (widget.goPrevious && selected > 1) {
      selected--;
      isSteppingForward = false;

      _scrollToDot();

      _runAnimations();

      if (widget.dotReachedIndex != null) {
        widget.dotReachedIndex(selected);
      }
    }
  }

  /// Resets and runs the animations.
  void _runAnimations() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SingleChildScrollView(
        scrollDirection: widget.direction,
        controller: _scrollController,
        child: CustomPaint(
          painter: DotStepperPainter(
            dotCount: widget.dotCount,
            selectedIndex: selected,
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
      (widget.dotRadius * selected) - widget.dotRadius,
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
}

/// Defines the type of indicator. Filled occupies the entire fixed dot, while as 'contain' appears inside the fixed dot.
enum IndicatorType {
  fill,
  contain,
}

enum DotShape {
  circle,
  square,
  rounded_rectangle,
  line,
}
