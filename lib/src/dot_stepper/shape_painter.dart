import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/dot_offset.dart';
import 'package:im_stepper/stepper.dart';

class ShapePainter {
  ShapePainter({
    this.canvas,
    this.dotOffset,
    this.dotRadius,
    this.direction,
    this.brush,
  });

  Canvas canvas;
  DotOffset dotOffset;
  double dotRadius;
  Axis direction;
  Paint brush;

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
    canvas.drawCircle(
      dotOffset.center,
      dotRadius,
      brush,
    );
  }

  void _drawSquare() {
    canvas.drawRect(
      Rect.fromLTRB(
        dotOffset.left.dx,
        dotOffset.top.dy,
        dotOffset.right.dx,
        dotOffset.bottom.dy,
      ),
      brush,
    );
  }

  void _drawRectangle() {
    // The amount of padding required to achieve the dash shape.
    final double padding = dotRadius / 2;

    canvas.drawRect(
      Rect.fromLTRB(
        direction == Axis.horizontal
            ? dotOffset.left.dx
            : dotOffset.left.dx + padding,
        direction == Axis.horizontal
            ? dotOffset.top.dy + padding
            : dotOffset.top.dy,
        direction == Axis.horizontal
            ? dotOffset.right.dx
            : dotOffset.right.dx - padding,
        direction == Axis.horizontal
            ? dotOffset.bottom.dy - padding
            : dotOffset.bottom.dy,
      ),
      brush,
    );
  }

  void _drawStadium() {
    // The amount of padding required to achieve the stadium shape.
    final double padding = dotRadius / 2;

    canvas.drawRRect(
      RRect.fromLTRBR(
        direction == Axis.horizontal
            ? dotOffset.left.dx
            : dotOffset.left.dx + padding,
        direction == Axis.horizontal
            ? dotOffset.top.dy + padding
            : dotOffset.top.dy,
        direction == Axis.horizontal
            ? dotOffset.right.dx
            : dotOffset.right.dx - padding,
        direction == Axis.horizontal
            ? dotOffset.bottom.dy - padding
            : dotOffset.bottom.dy,
        Radius.circular(dotRadius),
      ),
      brush,
    );
  }

  void _drawSquircle() {
    canvas.drawRRect(
      RRect.fromLTRBR(
        dotOffset.left.dx,
        dotOffset.top.dy,
        dotOffset.right.dx,
        dotOffset.bottom.dy,
        Radius.circular(dotRadius / 2),
      ),
      brush,
    );
  }

  void _drawDash() {
    // The amount of padding required to achieve the dash shape.
    final double padding = dotRadius / 1.2;

    canvas.drawRect(
      Rect.fromLTRB(
        direction == Axis.horizontal
            ? dotOffset.left.dx
            : dotOffset.left.dx + padding,
        direction == Axis.horizontal
            ? dotOffset.top.dy + padding
            : dotOffset.top.dy,
        direction == Axis.horizontal
            ? dotOffset.right.dx
            : dotOffset.right.dx - padding,
        direction == Axis.horizontal
            ? dotOffset.bottom.dy - padding
            : dotOffset.bottom.dy,
      ),
      brush,
    );
  }
}
