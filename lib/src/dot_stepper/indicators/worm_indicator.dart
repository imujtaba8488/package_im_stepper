part of indicators;

class WormIndicator extends IndicatorPainter {
  @override
  void draw(Canvas canvas) {
    ShapePainter shapePainter = ShapePainter(
      canvas,
      brush,
      direction,
      dotRadius,
      direction == Axis.horizontal ? _hLeft : _vLeft,
      direction == Axis.horizontal ? _hTop : _vTop,
      direction == Axis.horizontal ? _hRight : _vRight,
      direction == Axis.horizontal ? _hBottom : _vBottom,
    );

    shapePainter.draw(shape);
  }

  /// Returns the left offset value of the dot when direction is horizontal.
  double get _hLeft =>
      isSteppingForward! ? _hStretch.value : activeDotOffset.left;

  /// Returns the top offset value of the dot when direction is horizontal.
  double get _hTop => activeDotOffset.top;

  /// Returns the right offset value of the dot when direction is horizontal.
  double get _hRight =>
      isSteppingForward! ? activeDotOffset.right : _hStretch.value;

  /// Returns the bottom value of the dot when direction is horizontaln.
  double get _hBottom => activeDotOffset.bottom;

  /// Returns the left offset value of the dot when direction is vertical.
  double get _vLeft => activeDotOffset.left;

  /// Returns the top offset value of the dot when direction is vertical.
  double get _vTop => isSteppingForward! ? _vStretch.value : activeDotOffset.top;

  /// Returns the right offset value of the dot when direction is vertical.
  double get _vRight => activeDotOffset.right;

  /// Returns the bottom offset value of the dot when direction is vertical.
  double get _vBottom =>
      isSteppingForward! ? activeDotOffset.bottom : _vStretch.value;

  /// Returns the animation which stretches the dot horizontally.
  Animation get _hStretch => Tween(
        begin: isSteppingForward! ? oldDotOffset.left : oldDotOffset.right,
        end: isSteppingForward! ? activeDotOffset.left : activeDotOffset.right,
      ).animate(animationController!);

  /// Returns the animation with stretches the dot vertically.
  Animation get _vStretch => Tween(
        begin: isSteppingForward! ? oldDotOffset.top : oldDotOffset.bottom,
        end: isSteppingForward! ? activeDotOffset.top : activeDotOffset.bottom,
      ).animate(animationController!);
}
