import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class ShapePainter {
  ShapePainter({
    @required this.canvas,
    @required this.left,
    @required this.top,
    @required this.right,
    @required this.bottom,
    @required this.dotRadius,
    @required this.direction,
    @required this.brush,
    this.inflate = 0.0,
    this.deflate = 0.0,
    this.translate = 0.0,
    this.cornerRadius = 0.0,
  });

  final Canvas canvas;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double dotRadius;
  final Axis direction;
  final Paint brush;
  final double inflate;
  final double deflate;
  final double translate;
  final double cornerRadius;

  void draw(Shape shape) {
    switch (shape) {
      case Shape.square:
        _drawSquare();
        break;

      case Shape.rectangle:
        _drawRectangle();
        break;

      case Shape.stadium:
        _drawStadium();
        break;

      case Shape.squircle:
        _drawSquircle();
        break;

      case Shape.dash:
        _drawDash();
        break;

      case Shape.parallel:
        _drawParallelLines();
        break;

      default:
        _drawCircle();
    }
  }

  void _drawCircle() {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          left,
          top,
          right,
          bottom,
        ).inflate(inflate).deflate(0.0).translate(translate, translate),
        Radius.circular(cornerRadius),
      ),
      brush,
    );
  }

  void _drawSquare() {
    canvas.drawRect(
      Rect.fromLTRB(
        left,
        top,
        right,
        bottom,
      ).inflate(inflate).deflate(deflate).translate(translate, translate),
      brush,
    );
  }

  void _drawRectangle() {
    // The amount of padding required to achieve the dash shape.
    final double padding = dotRadius / 3;

    canvas.drawRect(
      Rect.fromLTRB(
        direction == Axis.horizontal ? left : left + padding,
        direction == Axis.horizontal ? top + padding : top,
        direction == Axis.horizontal ? right : right - padding,
        direction == Axis.horizontal ? bottom - padding : bottom,
      ).inflate(inflate).deflate(deflate).translate(translate, translate),
      brush,
    );
  }

  /// Draws a stadium shape. A stadium is a shape that resembles a baseball stadium. See [here](https://en.wikipedia.org/wiki/Stadium_(geometry)) for more information.
  void _drawStadium() {
    // The amount of padding required to achieve the stadium shape.
    final double padding = dotRadius / 2;

    canvas.drawRRect(
      RRect.fromLTRBR(
        direction == Axis.horizontal ? left : left + padding,
        direction == Axis.horizontal ? top + padding : top,
        direction == Axis.horizontal ? right : right - padding,
        direction == Axis.horizontal ? bottom - padding : bottom,
        Radius.circular(cornerRadius),
      ).inflate(inflate).deflate(deflate).shift(Offset(translate, translate)),
      brush,
    );
  }

  /// Draws a squircle shape. A squircle is a shape that is intermediate between a square and a circle. See [here](https://en.wikipedia.org/wiki/Squircle) for more information.
  void _drawSquircle() {
    canvas.drawRRect(
      RRect.fromLTRBR(
        left,
        top,
        right,
        bottom,
        Radius.circular(dotRadius / 2),
      ).inflate(inflate).deflate(deflate).shift(Offset(translate, translate)),
      brush,
    );
  }

  void _drawDash() {
    // The amount of padding required to achieve the dash shape.
    final double padding = dotRadius / 1.2;

    canvas.drawRect(
      Rect.fromLTRB(
        direction == Axis.horizontal ? left : left + padding,
        direction == Axis.horizontal ? top + padding : top,
        direction == Axis.horizontal ? right : right - padding,
        direction == Axis.horizontal ? bottom - padding : bottom,
      ).inflate(inflate).deflate(deflate).translate(translate, translate),
      brush,
    );
  }

  void _drawParallelLines() {
    final double padding = dotRadius / 1.1;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          direction == Axis.horizontal ? left + padding : left,
          direction == Axis.horizontal ? top : top + padding,
          direction == Axis.horizontal ? right - padding : right,
          direction == Axis.horizontal ? bottom : bottom - padding,
        ).inflate(inflate).deflate(0.0).translate(translate, translate),
        Radius.circular(cornerRadius),
      ),
      brush,
    );
  }
}
