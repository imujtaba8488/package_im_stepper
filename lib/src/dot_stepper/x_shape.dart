import 'package:flutter/material.dart';

class RectX extends Rect {
  final double left;
  final double top;
  final double right;
  final double bottom;

  RectX.fromLTRB(this.left, this.top, this.right, this.bottom)
      : super.fromLTRB(left, top, right, bottom);

  /// Move horizontally by an amount of factor.
  Rect horizontalMove(double factor) {
    return Rect.fromLTRB(
      left + factor,
      top,
      right + factor,
      bottom,
    );
  }

  /// Move vertically by an amount of factor.
  Rect verticalMove(double factor) {
    return Rect.fromLTRB(
      left,
      top + factor,
      right,
      bottom + factor,
    );
  }

  /// Expand the rectangle horizontal on the right side.
  Rect horizontalRightExpand(double factor) {
    return Rect.fromLTRB(
      left,
      top,
      right + factor,
      bottom,
    );
  }

  /// Expand the rectangle vertically on the bottom side.
  Rect verticalBottomExpand(double factor) {
    return Rect.fromLTRB(
      left,
      top,
      right,
      bottom + factor,
    );
  }
}
