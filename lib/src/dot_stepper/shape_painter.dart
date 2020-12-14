import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/dot_offset.dart';
import 'package:im_stepper/stepper.dart';

class ShapePainter {
  ShapePainter(this.canvas, this.offset, this.dotRadius);

  Canvas canvas;
  DotOffset offset;
  double dotRadius;

  void draw(Shape shape) {
    switch (shape) {
      default:
        _drawCircle();
    }
  }

  void _drawCircle() {
    canvas.drawCircle(
      offset.center,
      dotRadius,
      Paint()..color = Colors.grey,
    );
  }
}
