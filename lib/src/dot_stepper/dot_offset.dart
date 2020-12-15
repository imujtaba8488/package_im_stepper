import 'package:flutter/material.dart';

class DotOffset {
  DotOffset(this._center, this._dotRadius);

  Offset _center;
  double _dotRadius;

  double get left => _center.dx - _dotRadius;

  double get top => _center.dy - _dotRadius;

  double get right => _center.dx + _dotRadius;

  double get bottom => _center.dy + _dotRadius;

  double get center => _dotRadius;
}
