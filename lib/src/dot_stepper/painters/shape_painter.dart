import 'package:flutter/material.dart';

import '../core/enums.dart';

/// Responsible for painting various shapes.
class ShapePainter {
  /// The canvas to use for painting.
  final Canvas canvas;

  /// The Paint object to use for painting.
  final Paint? brush;

  /// The stepping direction.
  final Axis? direction;

  /// The radius of the dot.
  final double? dotRadius;

  /// The left offset of the dot.
  final double left;

  /// The top offset of the dot.
  final double top;

  /// The right offset of the dot.
  final double right;

  /// The bottom offset of the dot.
  final double bottom;

  /// The factor by which to translate the dot along the x-axis.
  final double xTranslationFactor;

  /// The factor by which to translate the dot along the y-axis.
  final double yTranslationFactor;

  /// The factor by which to inflate the dot.
  final double inflationFactor;

  /// The factor by which to deflate the dot.
  final double deflationFactor;

  /// The maximum corner radius.
  final double _maxCornerRadius = 500000;

  /// The minimum corner radius.
  final double _minCornerRadius = 0.0;

  ShapePainter(
    this.canvas,
    this.brush,
    this.direction,
    this.dotRadius,
    this.left,
    this.top,
    this.right,
    this.bottom, {
    this.xTranslationFactor = 0.0,
    this.yTranslationFactor = 0.0,
    this.inflationFactor = 0.0,
    this.deflationFactor = 0.0,
  });

  /// Draw shape based on the given shape.
  void draw(Shape? shape) {
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
        _drawPipe();
        break;
      case Shape.pipe2:
        _drawPipe2();
        break;
      default:
        _drawCircle();
        break;
    }
  }

  /// Draws a circle.
  void _drawCircle() {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          left,
          top,
          right,
          bottom,
        )
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(_maxCornerRadius),
      ),
      brush!,
    );
  }

  /// Draws a square.
  void _drawSquare() {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          left,
          top,
          right,
          bottom,
        )
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(_minCornerRadius),
      ),
      brush!,
    );
  }

  /// Draws a rectangle.
  void _drawRectangle() {
    double squeezeFactor = dotRadius! / 3;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          direction == Axis.vertical ? left + squeezeFactor : left,
          direction == Axis.horizontal ? top + squeezeFactor : top,
          direction == Axis.vertical ? right - squeezeFactor : right,
          direction == Axis.horizontal ? bottom - squeezeFactor : bottom,
        )
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(_minCornerRadius),
      ),
      brush!,
    );
  }

  /// Draws a stadium shape.
  void _drawStadium() {
    double squeezeFactor = dotRadius! / 3;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          direction == Axis.vertical ? left + squeezeFactor : left,
          direction == Axis.horizontal ? top + squeezeFactor : top,
          direction == Axis.vertical ? right - squeezeFactor : right,
          direction == Axis.horizontal ? bottom - squeezeFactor : bottom,
        )
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(_maxCornerRadius),
      ),
      brush!,
    );
  }

  /// Draws a squircle shape.
  void _drawSquircle() {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          left,
          top,
          right,
          bottom,
        )
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(dotRadius! / 1.7),
      ),
      brush!,
    );
  }

  /// Draws a pipe shape.
  void _drawPipe() {
    double squeezeFactor = dotRadius! / 1.2;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          direction == Axis.vertical ? left + squeezeFactor : left,
          direction == Axis.horizontal ? top + squeezeFactor : top,
          direction == Axis.vertical ? right - squeezeFactor : right,
          direction == Axis.horizontal ? bottom - squeezeFactor : bottom,
        )
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(_minCornerRadius),
      ),
      brush!,
    );
  }

  /// Draws the pipe2 shape.
  void _drawPipe2() {
    double squeezeFactor = dotRadius! / 1.2;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          direction == Axis.horizontal ? left + squeezeFactor : left,
          direction == Axis.vertical ? top + squeezeFactor : top,
          direction == Axis.horizontal ? right - squeezeFactor : right,
          direction == Axis.vertical ? bottom - squeezeFactor : bottom,
        )
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(_maxCornerRadius),
      ),
      brush!,
    );
  }
}
