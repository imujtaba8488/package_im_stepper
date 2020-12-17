part of dot_stepper;

/// Controls the shape of the fixed-dot as well as the indicator.
enum Shape {
  circle,
  square,
  rectangle,

  /// A shape that resembles a baseball stadium. See [here](https://en.wikipedia.org/wiki/Stadium_(geometry)) for more information.
  stadium,

  /// A squircle is a shape that is intermediate between a square and a circle. See [here](https://en.wikipedia.org/wiki/Squircle) for more information.
  squircle,
  pipe,
}

/// Controls the type of indicator to use.
enum Indicator {
  shift,
  slide,
  worm,
  jump,
  trail,
  magnify,
  bullet,
  ball_roll,
}
