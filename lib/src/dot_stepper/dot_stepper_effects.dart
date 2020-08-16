import 'package:flutter/material.dart';

class SlidingEffect {
  Size stepSize;
  AnimationController animationController;
  bool translateForward;
  Animation translation;

  SlidingEffect({
    this.stepSize,
    this.animationController,
    this.translateForward,
  }) {
    translation = Tween(
      begin: translateForward ? 0.0 : stepSize.width,
      end: stepSize.width / 2.0,
    ).animate(animationController);
  }
}

class WormEffect {
  Size stepSize;
  AnimationController animationController;
  Animation translation;
  Animation size;
  bool translateForward;

  WormEffect(this.stepSize, this.animationController, this.translateForward) {
    translation = Tween(
      begin: translateForward ? 0.0 : stepSize.width,
      end: stepSize.width / 2.0,
    ).animate(animationController);

    size = Tween(
      begin: stepSize.width,
      end: stepSize.width / 2.0,
    ).animate(animationController);
  }
}

class DotFillEffect {
  Size stepSize;
  AnimationController animationController;
  Animation size;
  bool translateForward;

  DotFillEffect(
    this.stepSize,
    this.animationController,
    this.translateForward,
  ) {
    size = Tween(
      begin: 0.0,
      end: stepSize.width / 4.0,
    ).animate(animationController);
  }
}