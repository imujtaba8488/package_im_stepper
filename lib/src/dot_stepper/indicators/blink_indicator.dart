part of indicators;

class BlinkIndicator extends IndicatorPainter {
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
      xTranslationFactor: direction == Axis.horizontal ? _slideFast.value : 0.0,
      yTranslationFactor: direction == Axis.vertical ? _slideFast.value : 0.0,
      inflationFactor: _inflate.value,
    );

    shapePainter.draw(shape);
  }

  /// Slides the dot faster than the normal
  Animation get _slideFast => Tween(
        begin: 0.0,
        end: direction == Axis.horizontal
            ? xDistanceBetweenOldAndActiveDot
            : yDistanceBetweenOldAndActiveDot,
      ).animate(
        CurvedAnimation(
          curve: Interval(0.0, 0.3),
          parent: animationController!,
        ),
      );

  /// Inflates the dot from (-dotRadius * 2) to the actual size of the dot.
  Animation get _inflate {
    return Tween(
      begin: -dotRadius! * 2,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        curve: Interval(0.4, 1.0),
        parent: animationController!,
      ),
    );
  }
}
