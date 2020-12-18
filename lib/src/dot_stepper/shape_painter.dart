import 'package:flutter/material.dart';

import 'enums.dart';

class ShapePainter {
  /// The canvas to use for painting.
  final Canvas canvas;

  /// The Paint object to use for painting.
  final Paint brush;

  /// The stepping direction.
  final Axis direction;

  /// The radius of the dot.
  final double dotRadius;

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
        _drawPipe();
        break;
      case Shape.pipe2:
        _drawPillar();
        break;
      case Shape.unnamed:
        _drawUnknown();
        break;
      case Shape.unnamed2:
        _drawUnnamed2();
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
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(_maxCornerRadius),
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
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(_minCornerRadius),
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
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(_minCornerRadius),
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
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(_maxCornerRadius),
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
            .translate(xTranslationFactor, yTranslationFactor)
            .inflate(inflationFactor)
            .deflate(deflationFactor),
        Radius.circular(dotRadius / 1.7),
      ),
      brush,
    );
  }

  void _drawPipe() {
    double squeezeFactor = dotRadius / 1.2;

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
      brush,
    );
  }

  void _drawPillar() {
    double squeezeFactor = dotRadius / 1.2;

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
      brush,
    );
  }

  void _drawUnknown() {
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
        Radius.circular(dotRadius / 2),
      ),
      brush,
    );

    canvas.drawOval(
      Rect.fromLTRB(
        left,
        top,
        right,
        bottom,
      )
          .deflate(dotRadius / 3)
          .translate(xTranslationFactor, yTranslationFactor),
      Paint()..color = Colors.white,
    );

    canvas.drawOval(
      Rect.fromLTRB(
        left,
        top,
        right,
        bottom,
      )
          .deflate(dotRadius / 2)
          .translate(xTranslationFactor, yTranslationFactor),
      brush,
    );
  }

  void _drawUnnamed2() {
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
        Radius.circular(dotRadius / 2),
      ),
      brush,
    );

    canvas.drawOval(
      Rect.fromLTRB(
        left - dotRadius / 2,
        top - dotRadius / 2,
        right - dotRadius / 2,
        bottom - dotRadius / 2,
      )
          .deflate(dotRadius / 1.2)
          .translate(xTranslationFactor, yTranslationFactor),
      brush,
    );

    canvas.drawOval(
      Rect.fromLTRB(
        left - dotRadius / 2,
        top + dotRadius / 3,
        right - dotRadius / 2,
        bottom - dotRadius / 3,
      )
          .deflate(dotRadius / 1.2)
          .translate(xTranslationFactor, yTranslationFactor),
      brush,
    );

    canvas.drawOval(
      Rect.fromLTRB(
        left - dotRadius / 2,
        top + dotRadius / 1.1,
        right - dotRadius / 2,
        bottom + dotRadius / 5,
      )
          .deflate(dotRadius / 1.2)
          .translate(xTranslationFactor, yTranslationFactor),
      brush,
    );
  }
}
