import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/dot_offset.dart';
import 'package:im_stepper/stepper.dart';

class ShapePainter {
  ShapePainter({this.canvas, this.dotOffset, this.dotRadius});

  Canvas canvas;
  DotOffset dotOffset;
  double dotRadius;

  void draw(Shape shape) {
    switch (shape) {
      case Shape.square:
        _drawSquare();
        break;

      case Shape.stadium:
        _drawStadium();
        break;

      case Shape.squircle:
        _drawSquircle();
        break;

      default:
        _drawCircle();
    }
  }

  void _drawCircle() {
    canvas.drawCircle(
      dotOffset.center,
      dotRadius,
      Paint()..color = Colors.grey,
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
      Paint()..color = Colors.grey,
    );
  }

  void _drawStadium() {
    canvas.drawRRect(
      RRect.fromLTRBR(
        dotOffset.left.dx,
        dotOffset.top.dy + dotRadius / 2,
        dotOffset.right.dx,
        dotOffset.bottom.dy - dotRadius / 2,
        Radius.circular(dotRadius),
      ),
      Paint()..color = Colors.grey,
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
      Paint()..color = Colors.grey,
    );
  }
}
