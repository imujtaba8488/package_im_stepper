import 'package:flutter/material.dart';

class DotOffset {
  DotOffset(this._center, this.dotRadius);

  Offset _center;
  double dotRadius;

  double get left => _center.dx - dotRadius;

  double get top => _center.dy - dotRadius;

  double get right => _center.dx + dotRadius;

  double get bottom => _center.dy + dotRadius;

  double get center => dotRadius;
}
