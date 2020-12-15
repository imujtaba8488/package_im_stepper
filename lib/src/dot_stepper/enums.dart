part of dot_stepper;

enum Shape {
  circle,
  square,
  rectangle,

  /// A stadium shape resembles a baseball stadium. See [here](https://en.wikipedia.org/wiki/Stadium_(geometry)) for more information.
  stadium,

  /// A squircle is a shape that is intermediate between a square and a circle. See [here](https://en.wikipedia.org/wiki/Squircle) for more information.
  squircle,
  dash,
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
