import 'package:flutter/material.dart';

/// Takes center and radius of a dot, then calculates the left-dx, top-dy, right-dx, and bottom-dy of a dot.
class DotOffset {
  DotOffset(this._center, this._dotRadius);

  /// The center of the dot.
  Offset _center;

  /// The radius of the dot.
  double _dotRadius;

  /// Returns the left dx offset of the dot.
  double get left => _center.dx - _dotRadius;

  /// Returns the top dy offset of the dot.
  double get top => _center.dy - _dotRadius;

  /// Returns the right dx offset of the dot.
  double get right => _center.dx + _dotRadius;

  /// Returns the bottom dy offset of the dot.
  double get bottom => _center.dy + _dotRadius;

  /// Returns the center dx offset of the dot.
  double get center => _center.dx;
}
