import 'package:flutter/material.dart';

typedef StepReached = void Function(int index);

class ABCStepper extends StatefulWidget {
  final double radius;
  final double spacing;
  final int steps;
  final bool stepNext;
  final bool stepPrevious;
  final StepReached stepReachedIndex;

  ABCStepper({
    this.steps = 3,
    this.radius = 24.0,
    this.spacing = 24.0,
    this.stepNext = false,
    this.stepPrevious = false,
    this.stepReachedIndex,
  }) {
    assert(
      radius >= 10.0,
      'Radius must be greater than or equal to 0.0. Radius was: $radius',
    );
    assert(
      spacing >= radius,
      'Spacing must be greater than or equal to radius. Spacing was $spacing and radius is $radius ',
    );
  }

  @override
  _ABCStepperState createState() => _ABCStepperState();
}

class _ABCStepperState extends State<ABCStepper>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation forwardTranslation;
  Animation backwardTranslation;

  bool translateForward = true;

  int selected = 0;
  Size shapeSize;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    shapeSize = Size(widget.spacing, widget.radius);

    _scrollController = ScrollController();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });

    forwardTranslation = Tween(
      begin: 0.0,
      end: shapeSize.width / 2.0,
    ).animate(_animationController);

    backwardTranslation = Tween(
      begin: shapeSize.width,
      end: shapeSize.width / 2,
    ).animate(_animationController);

    _animationController.forward();
  }

  @override
  void didUpdateWidget(ABCStepper oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.stepNext && selected < widget.steps - 1) {
      selected++;
      translateForward = true;

      _scrollToStep();
      _runAnimations();

      if (widget.stepReachedIndex != null) {
        widget.stepReachedIndex(selected);
      }
    } else if (widget.stepPrevious && selected > 0) {
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
        child: Row(
          children: _buildSteps(),
        ),
      ),
    );
  }

  List<Widget> _buildSteps() {
    return List.generate(widget.steps, (index) {
      return CustomPaint(
        foregroundPainter: Painter(
          selected: selected == index,
          translation:
              translateForward ? forwardTranslation : backwardTranslation,
        ),
        size: shapeSize,
      );
    });
  }

  void _scrollToStep() {
    // * This owes an explanation.
    for (int i = 0; i < widget.steps; i++) {
      _scrollController.animateTo(
        i * widget.spacing,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );

      if (selected == i) break;
    }
  }
}

class Painter extends CustomPainter {
  bool selected;
  Animation translation;

  Painter({
    this.selected = false,
    this.translation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2.0, size.height / 2.0);

    canvas.drawCircle(
      center,
      size.height / 3.0,
      Paint()
        ..color = Colors.blueGrey
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    if (selected) {
      canvas.drawCircle(
        Offset(translation.value, size.height / 2.0),
        size.height / 4.0,
        Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill
          ..strokeWidth = 1,
      );

      // canvas.drawCircle(
      //   Offset(transateAnimation.value, size.height / 2.0),
      //   size.height / 4.0,
      //   Paint()
      //     ..color = Colors.green
      //     ..style = PaintingStyle.fill
      //     ..strokeWidth = 1,
      // );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
