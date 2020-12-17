import 'package:flutter/material.dart';

import 'dot_stepper.dart';

class ShapePainter {
  Canvas canvas;
  Paint brush;
  Axis direction;
  double left;
  double top;
  double right;
  double bottom;

  final double xTranslate;
  final double yTranslate;

  final double inflationFactor;
  final double deflationFactor;

  ShapePainter(
    this.canvas,
    this.brush,
    this.direction,
    this.left,
    this.top,
    this.right,
    this.bottom, {
    this.xTranslate = 0.0,
    this.yTranslate = 0.0,
    this.inflationFactor = 0.0,
    this.deflationFactor = 0.0,
  });

  void draw(Shape shape) {
    switch (shape) {
      default:
        drawCircle();
        break;
    }
  }

  void drawCircle() {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          left,
          top,
          right,
          bottom,
        )
            .translate(xTranslate, yTranslate)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(5000),
      ),
      brush,
    );
  }
}
