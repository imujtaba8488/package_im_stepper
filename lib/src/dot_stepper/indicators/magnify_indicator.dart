part of indicators;

class MagnifyIndicator extends IndicatorPainter {
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

  Animation get _inflate {
    return Tween(
      begin: -dotRadius,
      end: dotRadius / 4,
    ).animate(animationController);
  }
}
