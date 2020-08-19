import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

abstract class DotStepperEffect {
  /// The radius of a single dot.
  double dotRadius;

  /// The amount of spacing between the dots.
  double spacing;

  /// The index of the dot currently selected.
  int selectedIndex;

  /// Whether the stepping is proceeding in forward or backward direction.
  bool isSteppingForward;

  /// Color of the selected dot.
  Color dotColor;

  /// Whether to dots are shown horizontally or vertically.
  Axis axis;

  /// Animation controller controlling all the animations.
  AnimationController animationController;

  DotType dotType;

  void draw(Canvas canvas);

  Animation get _translateForward {
    return Tween(
      begin: selectedIndex > 1 ? spacing * (selectedIndex - 1) : spacing,
      end: spacing * selectedIndex,
    ).animate(animationController);
  }

  Animation get _translateBackward {
    return Tween(
      begin: (selectedIndex + 1) * spacing,
      end: selectedIndex * spacing,
    ).animate(animationController);
  }

  Offset get center {
    return Offset(
      axis == Axis.horizontal ? spacing * selectedIndex : spacing / 2.0,
      axis == Axis.horizontal ? spacing / 2.0 : spacing * selectedIndex,
    );
  }

  Offset get centerTranslated {
    return Offset(
      axis == Axis.horizontal
          ? isSteppingForward
              ? _translateForward.value
              : _translateBackward.value
          : spacing / 2.0,
      axis == Axis.horizontal
          ? spacing / 2.0
          : isSteppingForward
              ? _translateForward.value
              : _translateBackward.value,
    );
  }

  Paint get paint => Paint()..color = dotColor;
}

class Slide extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    if (dotType == DotType.circle) {
      canvas.drawCircle(
        centerTranslated,
        dotRadius,
        paint,
      );
    } else if (dotType == DotType.square) {
      canvas.drawRect(
        Rect.fromCenter(
          center: centerTranslated,
          width: dotRadius,
          height: dotRadius,
        ),
        paint,
      );
    } else if (dotType == DotType.rounded_rectange) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: centerTranslated,
            width: dotRadius * 2,
            height: dotRadius,
          ),
          Radius.circular(5.0),
        ),
        paint,
      );
    } else if (dotType == DotType.line) {
      canvas.drawLine(
        Offset(centerTranslated.dx, centerTranslated.dy),
        Offset(centerTranslated.dx + dotRadius, centerTranslated.dy),
        Paint()
          ..color = dotColor
          ..strokeWidth = 2.0,
      );
    }
  }
}

class Worm extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation stretch = Tween(
      begin: spacing * 1.5,
      end: dotRadius * 2,
    ).animate(animationController);

    Animation centerExcessForward = Tween(
      begin: dotRadius * 2,
      end: 0.0,
    ).animate(animationController);

    Animation centerExcessBackward = Tween(
      begin: -(dotRadius * 2),
      end: 0.0,
    ).animate(animationController);

    Rect rect = Rect.fromCenter(
      center: centerTranslated.translate(
        axis == Axis.horizontal
            ? isSteppingForward
                ? centerExcessForward.value
                : centerExcessBackward.value
            : 0.0,
        axis == Axis.horizontal
            ? 0.0
            : isSteppingForward
                ? centerExcessForward.value
                : centerExcessBackward.value,
      ),
      height: axis == Axis.horizontal ? dotRadius * 2.0 : stretch.value,
      width: axis == Axis.horizontal ? stretch.value : dotRadius * 2.0,
    );

    RRect rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(dotRadius),
    );

    canvas.drawRRect(
      rRect,
      paint,
    );
  }
}

class Jump extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    // Animate from actual size to twice the size.
    Animation jumpUp = Tween(
      begin: dotRadius,
      end: dotRadius * 2,
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
      end: dotRadius,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.5,
        1.0,
      ),
    ));

    // canvas.drawCircle(
    //   centerTranslated,
    //   jumpDown.value,
    //   paint,
    // );

    if (dotType == DotType.circle) {
      canvas.drawCircle(
        centerTranslated,
        jumpDown.value,
        paint,
      );
    } else if (dotType == DotType.square) {
      canvas.drawRect(
        Rect.fromCenter(
          center: centerTranslated,
          width: jumpDown.value,
          height: jumpDown.value,
        ),
        paint,
      );
    } else if (dotType == DotType.rounded_rectange) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: centerTranslated,
            width: dotRadius * 2,
            height: jumpDown.value,
          ),
          Radius.circular(5.0),
        ),
        paint,
      );
    } else if (dotType == DotType.line) {
      canvas.drawLine(
        Offset(centerTranslated.dx, centerTranslated.dy),
        Offset(centerTranslated.dx + dotRadius, centerTranslated.dy),
        Paint()
          ..color = dotColor
          ..strokeWidth = jumpDown.value,
      );
    }
  }
}

class Bullet extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation start = Tween(
      begin: dotRadius,
      end: 0.5,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.8),
      ),
    );

    Animation bullet = Tween(
      begin: start.value,
      end: dotRadius,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 0.9),
      ),
    );

    canvas.drawCircle(
      centerTranslated,
      bullet.value,
      paint,
    );
  }
}

class Magnify extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation magnify = Tween<double>(
      begin: 0.0,
      end: dotRadius * 1.5,
    ).animate(animationController);

    canvas.drawCircle(
      center,
      magnify.value,
      paint,
    );
  }
}

class Flat extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    canvas.drawCircle(
      center,
      dotRadius,
      paint,
    );
  }
}

class Trail extends DotStepperEffect {
  @override
  void draw(Canvas canvas) {
    Animation fade = Tween(
      begin: dotRadius,
      end: 0.0,
    ).animate(animationController);

    canvas.drawCircle(
      centerTranslated.translate(
        isSteppingForward ? -dotRadius * 1.5 : dotRadius * 1.5,
        0.0,
      ),
      fade.value,
      paint,
    );

    canvas.drawCircle(
      centerTranslated,
      dotRadius,
      paint,
    );
  }
}
