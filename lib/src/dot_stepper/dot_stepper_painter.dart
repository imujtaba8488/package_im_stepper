import 'package:flutter/material.dart';

import 'dot_stepper_effects.dart';
import 'dot_stepper.dart';

class ABCStepperPainter extends CustomPainter {
  final bool _isSelected;
  final AnimationController _animationController;
  final Axis _axis;
  final Color _stepColor;
  final Color _indicatorColor;
  final bool _fillStep;
  final IndicatorEffect _indicatorEffect;
  final bool _translateForward;

  ABCStepperPainter({
    bool isSelected,
    AnimationController animationController,
    Axis axis,
    Color stepColor,
    Color indicatorColor,
    bool fillStep = true,
    IndicatorEffect indicatorEffect = IndicatorEffect.slide,
    bool translateForward,
  })  : _isSelected = isSelected,
        this._animationController = animationController,
        _axis = axis,
        _stepColor = stepColor,
        _indicatorColor = indicatorColor,
        this._fillStep = fillStep,
        this._indicatorEffect = indicatorEffect,
        this._translateForward = translateForward;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2.0, size.height / 2.0);
    _drawStep(canvas, size, center);
    _drawIndicator(canvas, size, center);
  }

  void _drawStep(Canvas canvas, Size size, Offset center) {
    canvas.drawCircle(
      center,
      size.height / 3.0,
      Paint()
        ..color = _stepColor
        ..style = _fillStep ? PaintingStyle.fill : PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  void _drawIndicator(Canvas canvas, Size size, Offset center) {
    if (_isSelected) {
      switch (_indicatorEffect) {
        case IndicatorEffect.worm:
          _drawWorm(canvas, size);
          break;

        case IndicatorEffect.dotFill:
          _drawDotFill(canvas, size);
          break;

        case IndicatorEffect.magnifiedDotFill:
          _drawMagnifiedDotFill(canvas, size);
          break;

        default:
          _drawSliding(canvas, size);
          break;
      }
    }
  }

  void _drawSliding(Canvas canvas, Size size) {
    SlidingEffect slidingEffect = SlidingEffect(
      stepSize: size,
      animationController: _animationController,
      translateForward: _translateForward,
    );

    canvas.drawCircle(
      Offset(
        _axis == Axis.horizontal
            ? slidingEffect.translation.value
            : size.width / 2.0,
        _axis == Axis.horizontal
            ? size.height / 2.0
            : slidingEffect.translation.value,
      ),
      size.height / 3.0,
      Paint()
        ..color = _indicatorColor
        ..style = PaintingStyle.fill
        ..strokeWidth = 1,
    );
  }

  void _drawWorm(Canvas canvas, Size size) {
    WormEffect wormEffect = WormEffect(
      size,
      _animationController,
      _translateForward,
    );

    // Rect rect = Rect.fromCenter(
    //   center: Offset(
    //     _axis == Axis.horizontal
    //         ? wormEffect.translation.value
    //         : size.width / 2.0,
    //     _axis == Axis.horizontal
    //         ? size.height / 2.0
    //         : wormEffect.translation.value,
    //   ),
    //   height:
    //       _axis == Axis.horizontal ? size.height / 2.0 : wormEffect.size.value,
    //   width:
    //       _axis == Axis.horizontal ? wormEffect.size.value : size.width / 2.0,
    // );

    // RRect rRect = RRect.fromRectAndRadius(
    //   rect,
    //   Radius.circular(size.width),
    // );

    // canvas.drawRRect(
    //   rRect,
    //   Paint()..color = _indicatorColor,
    // );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(
            _axis == Axis.horizontal
                ? wormEffect.translation.value
                : size.width / 2.0,
            _axis == Axis.horizontal
                ? size.height / 2.0
                : wormEffect.translation.value,
          ),
          height: _axis == Axis.horizontal
              ? size.height / 2.0
              : wormEffect.size.value,
          width: _axis == Axis.horizontal
              ? wormEffect.size.value
              : size.width / 2.0,
        ),
        Radius.circular(size.width),
      ),
      Paint()..color = _indicatorColor,
    );
  }

  void _drawDotFill(Canvas canvas, Size size) {
    DotFillEffect dotFillEffect = DotFillEffect(
      size,
      _animationController,
      _translateForward,
    );

    canvas.drawCircle(
      Offset(size.width / 2.0, size.height / 2.0),
      dotFillEffect.size.value,
      Paint()
        ..color = _indicatorColor
        ..style = PaintingStyle.fill
        ..strokeWidth = 1,
    );
  }

  void _drawMagnifiedDotFill(Canvas canvas, Size size) {
    MagnifiedDotFillEffect magnifiedDotFill = MagnifiedDotFillEffect(
      stepSize: size,
      animationController: _animationController,
    );

    canvas.drawCircle(
      Offset(size.width / 2.0, size.height / 2.0),
      magnifiedDotFill.size.value,
      Paint()
        ..color = _indicatorColor
        ..style = PaintingStyle.fill
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
