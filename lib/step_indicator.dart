import 'package:flutter/material.dart';

class StepIndicator extends StatefulWidget {
  final int index;
  final bool isSelected;
  final Icon icon;
  final Function onPressed;

  StepIndicator({
    @required this.index,
    this.isSelected = false,
    this.icon,
    this.onPressed,
  });

  @override
  _StepIndicatorState createState() => _StepIndicatorState();
}

class _StepIndicatorState extends State<StepIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation opacityAnimation, backwardAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    animationController.forward();
  }

  @override
  void didUpdateWidget(StepIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected && animationController.isDismissed) {
      animationController.forward();
    } else if (widget.isSelected && animationController.isCompleted) {
      animationController.reset();
      animationController.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isSelected ? opacityAnimation.value : 1.0,
      child: Container(
        padding: widget.isSelected ? EdgeInsets.all(1.0) : EdgeInsets.zero,
        decoration: BoxDecoration(
          border: widget.isSelected
              ? Border.all(
                  color: Colors.blue,
                  width: 0.5,
                )
              : null,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: widget.onPressed,
          child: Container(
            height: 48,
            width: 48,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: widget.isSelected ? Colors.green : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: widget.icon ?? Text('${widget.index}'),
            ),
          ),
        ),
      ),
    );
  }
}
