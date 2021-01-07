/// Controls the shape of the fixed-dot as well as the indicator.
enum Shape {
  circle,
  square,
  rectangle,

  /// A shape that resembles a baseball stadium. See [here](https://en.wikipedia.org/wiki/Stadium_(geometry)) for more information.
  stadium,

  /// A squircle is a shape that is intermediate between a square and a circle. See [here](https://en.wikipedia.org/wiki/Squircle) for more information.
  squircle,

  /// Horizontal butt edged pipes.
  pipe,

  /// Vertical round edged pipes, if the direction is `Axis.horizontal` and horizontal round edged pies, if the direction is `Axis.vertical`.
  pipe2,

  // Circle with a hole in the middle.
  ring,
}

/// Controls the type of indicator to use.
enum Indicator {
  /// Indicator moves to active dot.
  shift,

  /// Indictor slides to active dot.
  slide,

  /// Indicator moves to the active dot with a worm effect.
  worm,

  /// Indicator moves to the active dot with a jump effect.
  jump,

  /// Indicator moves to next dot, then magnifies.
  magnify,

  /// Indicator moves to the next dot and appears as a thump.
  thump,

  /// Indicator slides to the next dot and then shrinks.
  shrink,

  /// Indicator slides to the next dot and then blinks once.
  blink,
}
