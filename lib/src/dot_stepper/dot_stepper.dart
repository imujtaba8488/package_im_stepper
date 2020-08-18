import 'package:flutter/material.dart';

import 'dot_stepper_painter.dart';
import 'dot_stepper_effects.dart';

typedef StepReached = void Function(int index);

class DotStepper extends StatefulWidget {
  final double stepRadius;
  final int stepCount;
  final bool goNext;
  final bool goPrevious;
  final StepReached stepReachedIndex;
  final Axis direction;
  final Color stepColor;
  final Color indicatorColor;
  final bool fillStep;
  final IndicatorEffect indicatorEffect;

  DotStepper({
    this.stepCount = 3,
    this.stepRadius = 24.0,
    this.goNext = false,
    this.goPrevious = false,
    this.stepReachedIndex,
    this.direction = Axis.horizontal,
    this.stepColor = Colors.grey,
    this.indicatorColor = Colors.green,
    this.fillStep = true,
    this.indicatorEffect = IndicatorEffect.slide,
  }) {
    assert(
      stepRadius >= 10.0,
      'Radius must be greater than or equal to 10.0. Current radius: $stepRadius',
    );
  }

  @override
  _DotStepperState createState() => _DotStepperState();
}

class _DotStepperState extends State<DotStepper>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  bool translateForward = true;

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

    if (widget.goNext && selected < widget.stepCount) {
      selected++;
      translateForward = true;

      _scrollToStep();
      _runAnimations();

      if (widget.stepReachedIndex != null) {
        widget.stepReachedIndex(selected);
      }
    } else if (widget.goPrevious && selected > 1) {
      selected--;
      translateForward = false;

      _scrollToStep();

      _runAnimations();

      if (widget.stepReachedIndex != null) {
        widget.stepReachedIndex(selected);
      }
    }
  }

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
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: CustomPaint(
          foregroundPainter: DotStepperPainter(
            stepCount: widget.stepCount,
            selectedIndex: selected,
            axis: widget.direction,
            stepColor: widget.stepColor,
            indicatorColor: widget.indicatorColor,
            fillStep: widget.fillStep,
            indicatorEffect: widget.indicatorEffect,
            animationController: _animationController,
            translateForward: translateForward,
            effect: _applyEffect(widget.indicatorEffect),
          ),
          size: Size(
            widget.stepRadius * (widget.stepCount + 1),
            widget.stepRadius,
          ),
        ),
      ),
    );
  }

  void _scrollToStep() {
    // * This owes an explanation.
    for (int i = 0; i < widget.stepCount; i++) {
      _scrollController.animateTo(
        i * (widget.stepRadius / 2.0),
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );

      if (selected == i) break;
    }
  }

  DotStepperEffect _applyEffect(IndicatorEffect indicatorEffect) {
    switch (indicatorEffect) {
      case IndicatorEffect.worm:
        return Worm();

      case IndicatorEffect.jumping:
        return Jump();

      case IndicatorEffect.bullet:
        return Bullet();

      default:
        return Slide();
    }
  }
}

enum IndicatorEffect {
  worm,
  slide,
  jumping,
  bullet,
}
