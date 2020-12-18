import 'dart:ui';

import 'package:im_stepper/src/dot_stepper/indicator_painter.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';

class ShiftIndicator extends IndicatorPainter {
  @override
  void draw(Canvas canvas) {
    ShapePainter shapePainter = ShapePainter(
      canvas,
      brush,
      direction,
      dotRadius,
      activeDotOffset.left,
      activeDotOffset.top,
      activeDotOffset.right,
      activeDotOffset.bottom,
    );

    shapePainter.draw(shape);
  }
}
