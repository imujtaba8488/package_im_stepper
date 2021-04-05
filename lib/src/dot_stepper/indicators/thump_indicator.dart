part of indicators;

class ThumpIndicator extends IndicatorPainter {
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
      inflationFactor: _inflate.value,
    );

    shapePainter.draw(shape);
  }

  /// Inflates the dot size and then pushes it back to the normal size.
  Animation get _inflate {
    return Tween(
      begin: -dotRadius! * 5,
      end: 0.0,
    ).animate(animationController!);
  }
}
