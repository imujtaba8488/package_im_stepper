import 'package:flutter/material.dart';

import 'opacity_animated.dart';

class BaseIndicator extends StatelessWidget {
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

  /// The amount of padding around each side of the child.
  final double padding;

  /// The amount of margin around each side of the indicator.
  final double margin;

  final activeBorderWidth;

  BaseIndicator({
    this.isSelected = false,
    this.child,
    this.onPressed,
    this.color,
    this.activeColor,
    this.activeBorderColor,
    this.radius = 24.0,
    this.padding = 5.0,
    this.margin = 1.0,
    this.activeBorderWidth = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return OpacityAnimated(
      animationDisabled: !isSelected,
      child: Container(
        padding: isSelected ? EdgeInsets.all(margin) : EdgeInsets.zero,
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  color: activeBorderColor ?? Colors.blue,
                  width: activeBorderWidth,
                )
              : null,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: onPressed,
          child: OpacityAnimated(
            animationDisabled: !isSelected,
            child: Container(
              height: radius * 2,
              width: radius * 2,
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: isSelected
                    ? activeColor ?? Colors.green
                    : color ?? Colors.grey,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StepDecoration {
  Color activeColor;
  Color inactiveColor;
  Color activeBorderColor;
  Color activeBorderWidth;
}
