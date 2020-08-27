import 'package:flutter/material.dart';

class CircleIndicator extends StatefulWidget {
  /// Whether this indicator is selected or not.
  final bool isSelected;

  /// The child to be placed within the indicator.
  final Widget child;

  /// Action to be taken when this indictor is pressed.
  final Function onPressed;

  /// Color of this indicator when it is not selected.
  final Color color;

  /// Color of this indicator when it is selected.
  final Color activeColor;

  /// Border color of this indicator when it is selected.
  final Color activeBorderColor;

  /// Radius of this indicator.
  final double radius;

  final double insets;

  CircleIndicator({
    this.isSelected = false,
    this.child,
    this.onPressed,
    this.color,
    this.activeColor,
    this.activeBorderColor,
    this.radius = 24.0,
    this.insets = 5.0,
  });

  @override
  _CircleIndicatorState createState() => _CircleIndicatorState();
}

class _CircleIndicatorState extends State<CircleIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();
  }

  @override
  void didUpdateWidget(CircleIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected && _animationController.isDismissed) {
      _animationController.forward();
    } else if (widget.isSelected && _animationController.isCompleted) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isSelected ? _opacityAnimation.value : 1.0,
      child: Container(
        padding: widget.isSelected ? EdgeInsets.all(1.0) : EdgeInsets.zero,
        decoration: BoxDecoration(
          border: widget.isSelected
              ? Border.all(
                  color: widget.activeBorderColor ?? Colors.blue,
                  width: 1.5,
                )
              : null,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: widget.onPressed,
          child: Container(
            height: widget.radius * 2,
            width: widget.radius * 2,
            padding: EdgeInsets.all(widget.insets),
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? widget.activeColor ?? Colors.green
                  : widget.color ?? Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
