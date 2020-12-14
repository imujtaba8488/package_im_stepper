import 'package:flutter/material.dart';

class DotOffset {
  DotOffset(this.radius);

  double radius;

  Offset get center => Offset(radius, radius);

  Offset get left => Offset(center.dx - radius, radius);

  Offset get top => Offset(radius, center.dy - radius);

  Offset get right => Offset(center.dx + radius, radius);

  Offset get bottom => Offset(radius, center.dy + radius);
}
