import 'dart:ui';

import 'package:im_stepper/src/dot_stepper/indicator_painter.dart';
import 'package:im_stepper/src/dot_stepper/shape_painter.dart';

class ShiftIndicator extends IndicatorPainter {
  @override
  void draw(Canvas canvas) {
    ShapePainter shapePainter = ShapePainter(
      left: activeDotOffset.left,
      top: activeDotOffset.top,
      right: activeDotOffset.right,
      bottom: activeDotOffset.bottom,
      dotRadius: dotRadius,
      direction: direction,
      brush: brush,
      canvas: canvas,
      cornerRadius: dotRadius,
    );

    shapePainter.draw(shape);
  }
}
