part of indicators;

class JumpIndicator extends IndicatorPainter {
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
      inflationFactor: jumpDown.value,
    );

    shapePainter.draw(shape);
  }

  /// Jumps from the top to the actual size of the dot.
  Animation get jumpDown => Tween(
        begin: jumpUp.value,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: animationController!,
          curve: Interval(0.5, 1.0),
        ),
      );

  /// Jumps from the actual size of hte dot to the top.
  Animation get jumpUp => Tween(
        begin: 0.0,
        end: dotRadius! / 2,
      ).animate(
        CurvedAnimation(
          parent: animationController!,
          curve: Interval(0.0, 0.5),
        ),
      );
}
