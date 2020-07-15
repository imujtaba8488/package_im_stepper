import 'package:flutter/material.dart';

class DottedLine extends StatefulWidget {
  /// Width of the dotted line.
  final double length;

  /// Color of the dotted line.
  final Color color;

  /// Radius of each dot in the dotted line.
  final double dotRadius;

  /// Spacing between the dots in the dotted line.
  final double spacing;

  /// Show forward animation when displaying.
  final bool animateForward;

  final bool animateBackwards;

  final Duration animationDuration;

  DottedLine({
    this.length = 50.0,
    this.color = Colors.grey,
    this.dotRadius = 2.0,
    this.spacing = 3.0,
    this.animateForward = false,
    this.animateBackwards = false,
    this.animationDuration = const Duration(milliseconds: 100),
  });

  @override
  _DottedLineState createState() => _DottedLineState();
}

class _DottedLineState extends State<DottedLine>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation forwardAnimation, backwardAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..addListener(() {
        setState(() {});
      });

    forwardAnimation = Tween(
      begin: 0.0,
      end: widget.length,
    ).animate(animationController);

    backwardAnimation = Tween(
      begin: widget.length,
      end: 0.0,
    ).animate(animationController);

    if (widget.animateForward) {
      animationController.forward();
    } else if (widget.animateBackwards) {
      animationController.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // If this is not appled, top half of the dot gets offscreen, hence, hidden.
      margin: EdgeInsets.only(top: widget.dotRadius),
      width: widget.length,
      child: CustomPaint(
        painter: ConnectorPainter(
          brush: Paint()..color = widget.color ?? Colors.grey,
          length: widget.length,
          dotRadius: widget.dotRadius,
          spacing: widget.spacing,
          animate: widget.animateForward || widget.animateBackwards,
          animation:
              widget.animateBackwards ? backwardAnimation : forwardAnimation,
        ),
      ),
    );
  }
}

class ConnectorPainter extends CustomPainter {
  bool animate;
  Animation animation;
  double length;
  double dotRadius;
  double spacing;
  Paint brush;

  ConnectorPainter({
    this.animate = false,
    this.animation,
    this.length = 100,
    this.brush,
    this.dotRadius = 2.0,
    this.spacing = 3.0,
  }) {
    assert(brush != null);
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawDottedLine(
      canvas: canvas,
      from: 0.0,
      to: animate ? animation.value : length,
      paint: brush,
      dotRadius: dotRadius,
      dotSpace: spacing,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  void drawDottedLine({
    @required Canvas canvas,
    @required double from,
    @required double to,
    double dotRadius = 2.0,
    double dotSpace = 3.0,
    Paint paint,
    bool horizontal = true,
  }) {
    assert(paint != null);
    assert(dotSpace != 0.0);

    double start = from;
    double space = dotSpace;

    // Length of the line is calculated by dividing the supplied lenght [to] by dotRadius * space.
    int length = to ~/ (dotRadius * space);

    for (int i = 1; i < length; i++) {
      // New start becomes:
      start += dotRadius * space;

      canvas.drawCircle(
        Offset(horizontal ? start : 0.0, horizontal ? 0.0 : start),
        dotRadius,
        paint,
      );
    }
  }
}
