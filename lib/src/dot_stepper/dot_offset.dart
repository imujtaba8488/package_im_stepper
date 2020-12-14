import 'package:flutter/material.dart';

class DotOffset {
  DotOffset(this.center, this.radius);

  Offset center;
  double radius;

  Offset get left => Offset(center.dx - radius, radius);

  Offset get top => Offset(radius, center.dy - radius);

  Offset get right => Offset(center.dx + radius, radius);

  Offset get bottom => Offset(radius, center.dy + radius);

  @override
  String toString() => '${center.dx}, ${center.dy}';
}
