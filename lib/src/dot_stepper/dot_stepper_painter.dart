import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/dot_stepper_effects.dart';

import 'dot_stepper.dart';

class DotStepperPainter extends CustomPainter {
  final int _stepCount;
  final int _selectedIndex;
  final AnimationController _animationController;
  final Axis _axis;
  final Color _stepColor;
  final Color _indicatorColor;
  final bool _fillStep;
  final IndicatorEffect _indicatorEffect;
  final bool _translateForward;
  final DotStepperEffect _effect;

  double _stepRadius = 0.0;

  DotStepperPainter({
    int stepCount,
    int selectedIndex,
    AnimationController animationController,
    Axis axis,
    Color stepColor,
    Color indicatorColor,
    bool fillStep = true,
    IndicatorEffect indicatorEffect = IndicatorEffect.slide,
    bool translateForward,
    @required DotStepperEffect effect,
  })  : this._stepCount = stepCount,
        this._selectedIndex = selectedIndex,
        this._animationController = animationController,
        this._axis = axis,
        this._stepColor = stepColor,
        this._indicatorColor = indicatorColor,
        this._fillStep = fillStep,
        this._indicatorEffect = indicatorEffect,
        this._translateForward = translateForward,
        this._effect = effect;

  @override
  void paint(Canvas canvas, Size size) {
    _stepRadius = size.height;

    _drawSteps(canvas);
    _drawIndicator(canvas);
  }

  void _drawSteps(Canvas canvas) {
    Offset center = Offset(_stepRadius, _stepRadius / 2.0);

    for (int i = 0; i < _stepCount; i++) {
      canvas.drawCircle(
        center,
        _stepRadius / 4.0,
        Paint()
          ..color = _stepColor
          ..style = _fillStep ? PaintingStyle.fill : PaintingStyle.stroke
          ..strokeWidth = 1,
      );

      center = center.translate(_stepRadius, 0.0);
    }
  }

  void _drawIndicator(Canvas canvas) {
    _effect.selectedIndex = _selectedIndex;
    _effect.stepRadius = _stepRadius;
    _effect.translateForward = _translateForward;
    _effect.animationController = _animationController;
    _effect.draw(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
