import 'package:flutter/material.dart';

import 'dot_stepper.dart';

class ShapePainter {
  final Canvas canvas;
  final Paint brush;
  final Axis direction;
  final double dotRadius;
  final double left;
  final double top;
  final double right;
  final double bottom;

  final double xTranslate;
  final double yTranslate;

  final double inflationFactor;
  final double deflationFactor;

  final double maxCornerRadius = 500000;
  final double minCornerRadius = 0.0;

  ShapePainter(
    this.canvas,
    this.brush,
    this.direction,
    this.dotRadius,
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
      case Shape.pipe:
        _drawDash();
        break;
      default:
        _drawCircle();
        break;
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
        )
            .translate(xTranslate, yTranslate)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(maxCornerRadius),
      ),
      brush,
    );
  }

  void _drawSquare() {
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
        Radius.circular(minCornerRadius),
      ),
      brush,
    );
  }

  void _drawRectangle() {
    double squeezeFactor = dotRadius / 3;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          direction == Axis.vertical ? left + squeezeFactor : left,
          direction == Axis.horizontal ? top + squeezeFactor : top,
          direction == Axis.vertical ? right - squeezeFactor : right,
          direction == Axis.horizontal ? bottom - squeezeFactor : bottom,
        )
            .translate(xTranslate, yTranslate)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(minCornerRadius),
      ),
      brush,
    );
  }

  void _drawStadium() {
    double squeezeFactor = dotRadius / 3;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          direction == Axis.vertical ? left + squeezeFactor : left,
          direction == Axis.horizontal ? top + squeezeFactor : top,
          direction == Axis.vertical ? right - squeezeFactor : right,
          direction == Axis.horizontal ? bottom - squeezeFactor : bottom,
        )
            .translate(xTranslate, yTranslate)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(maxCornerRadius),
      ),
      brush,
    );
  }

  void _drawSquircle() {
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
        Radius.circular(dotRadius / 1.7),
      ),
      brush,
    );
  }

  void _drawDash() {
    double squeezeFactor = dotRadius / 1.2;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          direction == Axis.vertical ? left + squeezeFactor : left,
          direction == Axis.horizontal ? top + squeezeFactor : top,
          direction == Axis.vertical ? right - squeezeFactor : right,
          direction == Axis.horizontal ? bottom - squeezeFactor : bottom,
        )
            .translate(xTranslate, yTranslate)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(minCornerRadius),
      ),
      brush,
    );
  }
}
