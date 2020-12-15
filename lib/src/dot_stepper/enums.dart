part of dot_stepper;

enum Shape {
  circle,
  square,
  rectangle,

  /// A shape that resembles a baseball stadium. See [here](https://en.wikipedia.org/wiki/Stadium_(geometry)) for more information.
  stadium,

  /// A squircle is a shape that is intermediate between a square and a circle. See [here](https://en.wikipedia.org/wiki/Squircle) for more information.
  squircle,
  dash,

  /// Draws rounded cap lines that are side by side.
  parallel,
}

enum Indicator {
  shift,
  slide,
  worm,
  jump,
  trail,
}

enum IndicatorType {
  filled,
  outlined,
  squashed,
}
