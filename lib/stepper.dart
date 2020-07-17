import 'package:flutter/material.dart';

import 'step_indicator.dart';
import 'dotted_line.dart';

class MyStepper extends StatefulWidget {
  final List<CircleStep> steps;
  final BoxDecoration decoration;
  final bool enableNextPreviousButtons;
  final Icon previousButtonIcon;
  final Icon nextButtonIcon;
  final Function onSelection;
  final Axis direction;

  MyStepper({
    this.steps,
    this.decoration,
    this.enableNextPreviousButtons = true,
    this.previousButtonIcon,
    this.nextButtonIcon,
    this.onSelection,
    this.direction = Axis.horizontal,
  });

  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    this.scrollController = ScrollController();
    widget.onSelection(selectedIndex);
  }

  void _afterLayout(_) {
    for (int i = 0; i < widget.steps.length; i++) {
      scrollController.animateTo(
        (i * 98).toDouble(),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );

      if (selectedIndex == i) {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);

    return Container(
      decoration: widget.decoration,
      child: widget.direction == Axis.horizontal
          ? Row(
              children: <Widget>[
                widget.enableNextPreviousButtons
                    ? _previousButton()
                    : Container(),
                Expanded(
                  child: _stepperBuilder(),
                ),
                widget.enableNextPreviousButtons ? _nextButton() : Container(),
              ],
            )
          : Column(
              children: <Widget>[
                widget.enableNextPreviousButtons
                    ? _previousButton()
                    : Container(),
                Expanded(
                  child: _stepperBuilder(),
                ),
                widget.enableNextPreviousButtons ? _nextButton() : Container(),
              ],
            ),
    );
  }

  Widget _stepperBuilder() {
    return SingleChildScrollView(
      scrollDirection: widget.direction,
      controller: scrollController,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(8.0),
        child: widget.direction == Axis.horizontal
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildSteps(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildSteps(),
              ),
      ),
    );
  }

  List<Widget> buildSteps() {
    return List.generate(widget.steps.length, (index) {
      return widget.direction == Axis.horizontal
          ? Row(
              children: <Widget>[
                StepIndicator(
                  index: index + 1,
                  icon: widget.steps[index].icon,
                  isSelected: selectedIndex == index,
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                      widget.onSelection(selectedIndex);
                    });
                  },
                ),
                index < widget.steps.length - 1
                    ? DottedLine(
                        length: 50,
                        color: Colors.blue,
                        dotRadius: 1.0,
                        spacing: 5.0,
                      )
                    : Container(),
              ],
            )
          : Column(
              children: <Widget>[
                StepIndicator(
                  index: index + 1,
                  icon: widget.steps[index].icon,
                  isSelected: selectedIndex == index,
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                      widget.onSelection(selectedIndex);
                    });
                  },
                ),
                index < widget.steps.length - 1
                    ? DottedLine(
                        length: 50,
                        color: Colors.blue,
                        dotRadius: 1.0,
                        spacing: 5.0,
                        axis: LineAxis.vertical,
                      )
                    : Container(),
              ],
            );
    });
  }

  Widget _previousButton() {
    return IgnorePointer(
      ignoring: selectedIndex == 0,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: widget?.nextButtonIcon ??
            Icon(
              widget.direction == Axis.horizontal
                  ? Icons.arrow_left
                  : Icons.arrow_drop_up,
            ),
        onPressed: () {
          if (selectedIndex > 0) {
            setState(() {
              selectedIndex--;
              widget.onSelection(selectedIndex);
            });
          } else {
            print('No more Next steps.');
          }
        },
      ),
    );
  }

  Widget _nextButton() {
    return IgnorePointer(
      ignoring: selectedIndex == widget.steps.length - 1,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: widget?.nextButtonIcon ??
            Icon(
              widget.direction == Axis.horizontal
                  ? Icons.arrow_right
                  : Icons.arrow_drop_down,
            ),
        onPressed: () {
          if (selectedIndex < widget.steps.length - 1) {
            setState(() {
              selectedIndex++;
              widget.onSelection(selectedIndex);
            });
          } else {
            print('No more Next steps.');
          }
        },
      ),
    );
  }
}

class CircleStep {
  final Icon icon;
  final Color activeColor;
  final Color activeBorderColor;

  CircleStep({
    this.icon,
    this.activeColor,
    this.activeBorderColor,
  });
}
