import 'package:flutter/material.dart';

abstract class DotStepperEffect {
  AnimationController animationController;
  double stepRadius;
  bool translateForward;
  int selectedIndex;

  void draw(Canvas canvas);
}

class Slide extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation forward = Tween(
      begin: selectedIndex > 1 ? stepRadius * (selectedIndex - 1) : stepRadius,
      end: stepRadius * selectedIndex,
    ).animate(animationController);

    Animation backward = Tween(
      begin: (selectedIndex + 1) * stepRadius,
      end: selectedIndex * stepRadius,
    ).animate(animationController);

    canvas.drawCircle(
      Offset(
        translateForward ? forward.value : backward.value,
        stepRadius / 2.0,
      ),
      stepRadius / 4.0,
      Paint()
        ..color = Colors.blueGrey
        ..style = PaintingStyle.fill
        ..strokeWidth = 1,
    );
  }
}

class Worm extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation forward = Tween(
      begin: selectedIndex > 1 ? stepRadius * (selectedIndex - 1) : stepRadius,
      end: stepRadius * selectedIndex,
    ).animate(animationController);

    Animation backward = Tween(
      begin: (selectedIndex + 1) * stepRadius,
      end: selectedIndex * stepRadius,
    ).animate(animationController);

    Animation stretch = Tween(
      begin: stepRadius,
      end: stepRadius / 2,
    ).animate(animationController);

    Rect rect = Rect.fromCenter(
      center: Offset(
        translateForward ? forward.value : backward.value,
        stepRadius / 2.0,
      ),
      height: stepRadius / 2,
      width: stretch.value,
    );

    RRect rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(stepRadius / 2.0),
    );

    canvas.drawRRect(
      rRect,
      Paint()..color = Colors.blueGrey,
    );
  }
}
