import 'package:flutter/material.dart';

abstract class DotStepperEffect {
  AnimationController animationController;
  double stepRadius;
  bool translateForward;
  int selectedIndex;
  Color stepColor;

  void draw(Canvas canvas);

  Animation get forward {
    return Tween(
      begin: selectedIndex > 1 ? stepRadius * (selectedIndex - 1) : stepRadius,
      end: stepRadius * selectedIndex,
    ).animate(animationController);
  }

  Animation get backward {
    return Tween(
      begin: (selectedIndex + 1) * stepRadius,
      end: selectedIndex * stepRadius,
    ).animate(animationController);
  }
}

class Slide extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    canvas.drawCircle(
      Offset(
        translateForward ? forward.value : backward.value,
        stepRadius / 2.0,
      ),
      stepRadius / 4.0,
      Paint()
        ..color = stepColor
        ..style = PaintingStyle.fill
        ..strokeWidth = 1,
    );
  }
}

class Worm extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation stretch = Tween(
      begin: stepRadius,
      end: stepRadius / 2.0,
    ).animate(animationController);

    Rect rect = Rect.fromCenter(
      center: Offset(
        translateForward ? forward.value : backward.value,
        stepRadius / 2.0,
      ),
      height: stepRadius / 2.0,
      width: stretch.value,
    );

    RRect rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(stepRadius / 2.0),
    );

    canvas.drawRRect(
      rRect,
      Paint()..color = stepColor,
    );
  }
}

class Jump extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    // Animate from actual size to twice the size.
    Animation jumpUp = Tween(
      begin: stepRadius / 4.0,
      end: stepRadius / 2,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.0,
        0.5,
      ),
    ));

    // Animate from twice the size to actual size.
    Animation jumpDown = Tween(
      begin: jumpUp.value,
      end: stepRadius / 4.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.5,
        1.0,
      ),
    ));

    canvas.drawCircle(
      Offset(
        translateForward ? forward.value : backward.value,
        stepRadius / 2.0,
      ),
      jumpDown.value,
      Paint()..color = stepColor,
    );
  }
}

class Bullet extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation start = Tween(
      begin: stepRadius / 4.0,
      end: 0.5,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.8),
      ),
    );

    Animation bullet = Tween(
      begin: start.value,
      end: stepRadius / 4.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 0.9),
      ),
    );

    canvas.drawCircle(
      Offset(
        translateForward ? forward.value : backward.value,
        stepRadius / 2.0,
      ),
      bullet.value,
      Paint()..color = stepColor,
    );
  }
}
