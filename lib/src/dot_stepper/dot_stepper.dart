import 'package:flutter/material.dart';

import 'dot_stepper_painter.dart';

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

  int selected = 0;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward();
  }

  @override
  void didUpdateWidget(DotStepper oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.goNext && selected < widget.stepCount - 1) {
      selected++;
      translateForward = true;

      _scrollToStep();
      _runAnimations();

      if (widget.stepReachedIndex != null) {
        widget.stepReachedIndex(selected);
      }
    } else if (widget.goPrevious && selected > 0) {
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
        child: widget.direction == Axis.horizontal
            ? Row(children: _buildSteps())
            : Column(children: _buildSteps()),
      ),
    );
  }

  List<Widget> _buildSteps() {
    return List.generate(widget.stepCount, (index) {
      return CustomPaint(
        foregroundPainter: ABCStepperPainter(
          isSelected: selected == index,
          axis: widget.direction,
          stepColor: widget.stepColor,
          indicatorColor: widget.indicatorColor,
          fillStep: widget.fillStep,
          indicatorEffect: widget.indicatorEffect,
          animationController: _animationController,
          translateForward: translateForward,
        ),
        size: Size(widget.stepRadius, widget.stepRadius),
      );
    });
  }

  void _scrollToStep() {
    // * This owes an explanation.
    for (int i = 0; i < widget.stepCount; i++) {
      _scrollController.animateTo(
        i * widget.stepRadius,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );

      if (selected == i) break;
    }
  }
}

enum IndicatorEffect {
  worm,
  slide,
  jumping,
  dotFill,
  magnifiedDotFill,
}
