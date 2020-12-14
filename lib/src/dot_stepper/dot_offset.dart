import 'package:flutter/material.dart';

class DotOffset {
  DotOffset(this.center, this.dotRadius);

  Offset center;
  double dotRadius;

  Offset get left => Offset(center.dx - dotRadius, dotRadius);

  Offset get top => Offset(dotRadius, center.dy - dotRadius);

  Offset get right => Offset(center.dx + dotRadius, dotRadius);

  Offset get bottom => Offset(dotRadius, center.dy + dotRadius);

  @override
  String toString() => '${center.dx}, ${center.dy}';
}
