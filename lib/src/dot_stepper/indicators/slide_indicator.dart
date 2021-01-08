part of indicators;

class SlideIndicator extends IndicatorPainter {
  @override
  void draw(Canvas canvas) {
    ShapePainter shapePainter = ShapePainter(
      canvas,
      brush,
      direction,
      dotRadius,
      oldDotOffset.left,
      oldDotOffset.top,
      oldDotOffset.right,
      oldDotOffset.bottom,
      xTranslationFactor: direction == Axis.horizontal ? slide.value : 0.0,
      yTranslationFactor: direction == Axis.vertical ? slide.value : 0.0,
    );

    ShapePainter borderPainter = ShapePainter(
      canvas,
      borderBrush,
      direction,
      dotRadius,
      oldDotOffset.left,
      oldDotOffset.top,
      oldDotOffset.right,
      oldDotOffset.bottom,
      xTranslationFactor: direction == Axis.horizontal ? slide.value : 0.0,
      yTranslationFactor: direction == Axis.vertical ? slide.value : 0.0,
    );

    shapePainter.draw(shape);
    borderPainter.draw(shape);
  }
}
