import 'package:flutter/material.dart';

class DotOffset {
  DotOffset(this.center, this.dotRadius);

  Offset center;
  double dotRadius;

  double get left => center.dx - dotRadius;

  double get top => center.dy - dotRadius;

  double get right => center.dx + dotRadius;

  double get bottom => center.dy + dotRadius;

  @override
  String toString() => '${center.dx}, ${center.dy}';
}
