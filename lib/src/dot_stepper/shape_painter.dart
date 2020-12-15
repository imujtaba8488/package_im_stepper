import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class ShapePainter {
  ShapePainter({
    this.canvas,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.dotRadius,
    this.direction,
    this.brush,
    this.inflate = 0.0,
    this.deflate = 0.0,
    this.translate = 0.0,
    this.cornerRadius = 0.0,
  });

  Canvas canvas;
  double left;
  double top;
  double right;
  double bottom;
  double dotRadius;
  Axis direction;
  Paint brush;
  double inflate;
  double deflate;
  double translate;
  double cornerRadius;

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
}
