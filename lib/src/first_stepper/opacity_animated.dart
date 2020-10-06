import 'package:flutter/material.dart';

class OpacityAnimated extends StatefulWidget {
  final Widget child;
  final double begin;
  final double end;
  final Duration duration;
  final bool animationDisabled;

  OpacityAnimated({
    @required this.child,
    this.begin = 0.0,
    this.end = 1.0,
    this.duration = const Duration(milliseconds: 1000),
    this.animationDisabled = false,
  }) {
    assert(
      begin >= 0.0 && begin <= 1.0 && begin <= end,
      'The value of begin must be greater than or equal to 0.0 and less than or equal to 1.0 and less than or equal to the value of end.',
    );

    assert(
      end >= 0.0 && end <= 1.0 && end >= begin,
      'The value of end must be greater than or equal to 0.0 and less than or equal to 1.0 and greater than or equal to the value of begin.',
    );
  }

  @override
  _OpacityAnimatedState createState() => _OpacityAnimatedState();
}

class _OpacityAnimatedState extends State<OpacityAnimated>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _opacity;

  @override
  Widget build(BuildContext context) {
    _opacity = Tween(
      begin: widget.begin,
      end: widget.end,
    ).animate(_animationController);

    return Opacity(
      opacity: widget.animationDisabled ? widget.end : _opacity.value,
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(OpacityAnimated oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_animationController.isDismissed) {
      if (oldWidget.duration != widget.duration)
        _animationController.duration = widget.duration;

      _animationController.forward();
    } else if (_animationController.isCompleted) {
      if (oldWidget.duration != widget.duration)
        _animationController.duration = widget.duration;

      _animationController.reset();
      _animationController.forward();
    }
  }
}
