library dot_stepper;

import 'package:flutter/material.dart';

import '../core/decorations.dart';
import 'core/dot_offset.dart';
import 'core/enums.dart';
import 'painters/fixed_dot_painter.dart';
import 'painters/indicator_painter.dart';

// Must be exported so that they are available to the users.
export '../core/decorations.dart';
export 'core/enums.dart';

/// Callback fired when a dot is tapped.
typedef OnDotTapped = void Function(int tappedDotIndex);

/// A family of fully customizable, beautiful page indicator widgets with awesome built-in animations. Each dot in a DotStepper represents a step.
///
/// The DotStepper can be controller in 2 ways: Using external buttons or by tapping individual dots. The tapping behavior can also be disabled.
///
/// The DotStepper provides out-of-the-box indicators with modern beautiful transition effects. Further, the DotStepper supports different shapes such as, circle, rectangle, stadium, etc.
///
/// The DotStepper supports managing the radius of the dots, the spacing betweeen dots, enabling lineConnectors between dots, etc.
///
/// It can be customized using many ways, one such being the built-in decorations for fixedDots, indicators, line-connectors, etc.
///
/// For more information, [See Example](https://pub.dev/packages/im_stepper/example).
class DotStepper extends StatefulWidget {
  /// The total number of dots. Each dot represents a step.
  final int dotCount;

  /// The radius of a dot.
  final double dotRadius;

  /// The spacing between the dots.
  final double spacing;

  /// The direction in which to display the dots on the screen, i.e., horizontally or vertically.
  final Axis direction;

  /// The shape of the dots and the indicator.
  final Shape shape;

  /// The currently active dot, hence the step.
  final int activeStep;

  /// The indicator to use.
  final Indicator indicator;

  /// The decoration to use for the fixed dots.
  final FixedDotDecoration fixedDotDecoration;

  /// The decoration to use for the indicator.
  final IndicatorDecoration indicatorDecoration;

  /// The decoration to use for the line connectors.
  final LineConnectorDecoration lineConnectorDecoration;

  /// Enable or disable tapping on dots.
  final bool tappingEnabled;

  /// Enable or disable the line-connectors.
  final bool lineConnectorsEnabled;

  /// Callback fired when a dot is tapped. \
  /// __Note:__ You must update the `activeDot` in your `StatefulWidget` to `tappedDotIndex` provided by this callback inside a `setState()` method, for tapping to function flawlessly.
  final OnDotTapped? onDotTapped;

  DotStepper({
    required this.activeStep,
    this.dotCount = 2,
    this.dotRadius = 24,
    this.spacing = 0.0,
    this.direction = Axis.horizontal,
    this.shape = Shape.circle,
    this.indicator = Indicator.shift,
    this.fixedDotDecoration = const FixedDotDecoration(),
    this.indicatorDecoration = const IndicatorDecoration(),
    this.lineConnectorDecoration = const LineConnectorDecoration(),
    this.tappingEnabled = true,
    this.lineConnectorsEnabled = false,
    this.onDotTapped,
  }) {
    assert(dotCount >= 2, 'It does not make sense to have less than 2 dots.');

    assert(dotRadius >= 6.0, 'The minimum value allowed for dot radius is 6.0');

    assert(spacing >= 0.0, 'spacing must be greater than or equal to 0.0');

    assert(
      activeStep >= 0 && activeStep < dotCount,
      'activeStep must be greater than or equal to 0 and less than dotCount',
    );
  }

  @override
  _DotStepperState createState() => _DotStepperState();
}

class _DotStepperState extends State<DotStepper>
    with SingleTickerProviderStateMixin {
  /// The controller which handles the animations.
  AnimationController? _animationController;

  /// The dot that is currently active.
  int? _activeDotIndex;

  /// The dot that was active before the currently active dot.
  late int _oldDotIndex;

  /// Whether stepping is moving forward or backward.
  bool? _isSteppingForward;

  /// The `Paint` object used to draw the fixed dot border.
  Paint? _fixedDotStrokeBrush;

  /// The `Paint` object used to draw the fixed dot.
  Paint? _fixedDotFillBrush;

  /// The `Paint` object used for drawing the line connectors.
  Paint? _lineConnectorBrush;

  /// The `Paint` object used for drawing the `Indicator`.
  Paint? _indicatorBrush;

  Paint? _borderBrush;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _activeDotIndex = widget.activeStep;
    _oldDotIndex = 0;
    _isSteppingForward = false;

    _initBrushes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: FixedDotPainter(
            dotCount: widget.dotCount,
            dotRadius: widget.dotRadius,
            dotOffsets: _buildDotOffsets,
            direction: widget.direction,
            shape: widget.shape,
            fillBrush: _fixedDotFillBrush,
            strokeBrush: _fixedDotStrokeBrush,
            lineConnectorBrush: _lineConnectorBrush,
            lineConnectorsEnabled: widget.lineConnectorsEnabled,
            tappedAt: _onTappedAt,
          ),
          size: Size(
            widget.direction == Axis.horizontal ? _axisLength : _diameter,
            widget.direction == Axis.horizontal ? _diameter : _axisLength,
          ),
        ),
        CustomPaint(
          painter: _applyIndicator
            ..dotRadius = widget.dotRadius
            ..activeDotOffset = _buildDotOffsets[_activeDotIndex!]
            ..oldDotOffset = _buildDotOffsets[_oldDotIndex]
            ..direction = widget.direction
            ..shape = widget.shape
            ..brush = _indicatorBrush
            ..borderBrush = _borderBrush
            ..animationController = _animationController
            ..indicator = widget.indicator
            ..isSteppingForward = _isSteppingForward,
        ),
      ],
    );
  }

  /// Builds and returns the dot offsets.
  List<DotOffset> get _buildDotOffsets {
    List<DotOffset> dotOffsets = [];

    // Create and save the first offset.
    Offset center = Offset(widget.dotRadius, widget.dotRadius);
    dotOffsets.add(DotOffset(center, widget.dotRadius));

    // Create successive offsets by translating and save them to the list.
    for (int index = 0; index < widget.dotCount; index++) {
      center = center.translate(
        widget.direction == Axis.horizontal ? _diameter + widget.spacing : 0.0,
        widget.direction == Axis.horizontal ? 0.0 : _diameter + widget.spacing,
      );

      dotOffsets.add(DotOffset(center, widget.dotRadius));
    }

    return dotOffsets;
  }

  /// Returns the width or height depending on the direction i.e., horizontally or vertically, that is required to accomodate the total number of dots.
  double get _axisLength => (_diameter * widget.dotCount) + _totalSpacing;

  /// Returns the total amount of spacing between the dots. The spacing after the last dot is omitted.
  double get _totalSpacing => widget.spacing * (widget.dotCount - 1);

  /// Returns the diameter of a dot.
  double get _diameter => widget.dotRadius * 2;

  /// Updates the stepper configuration. The [activeDotIndex] is the index of the current activeDot and [eventIsTap] specifies whether it was updated by a tap or by any other event.
  void _updateConfiguration({
    required activeDotIndex,
    required bool eventIsTap,
  }) {
    // Reset and run animation controller.
    _animationController!.reset();
    _animationController!.forward();

    // Based on the event that updated the activeDot, set it to the corresponding value.
    eventIsTap
        ? _activeDotIndex = activeDotIndex
        : _activeDotIndex = widget.activeStep;

    // If activeDot is greater than the old dot that was active, the stepping is moving forward, else it's moving backward.
    _isSteppingForward = _activeDotIndex! > _oldDotIndex;
  }

  /// Fired when a fixed dot is tapped.
  void _onTappedAt(int tappedDotIndex) {
    // Ensure tapping is enabled.
    if (widget.tappingEnabled) {
      _activeDotIndex = tappedDotIndex;
      _oldDotIndex = tappedDotIndex;

      // activeDot was updated by a tap, hence eventIsTap is true.
      _updateConfiguration(
        activeDotIndex: tappedDotIndex,
        eventIsTap: true,
      );

      // Ensure onDotTapped is not null.
      if (widget.onDotTapped != null) widget.onDotTapped!(tappedDotIndex);
    }
  }

  /// Returns a built-in `Indicator` based on the value of the `indicator`.
  IndicatorPainter get _applyIndicator {
    switch (widget.indicator) {
      case Indicator.slide:
        return SlideIndicator();
      case Indicator.jump:
        return JumpIndicator();
      case Indicator.worm:
        return WormIndicator();
      case Indicator.magnify:
        return MagnifyIndicator();
      case Indicator.thump:
        return ThumpIndicator();
      case Indicator.shrink:
        return ShinkIndicator();
      case Indicator.blink:
        return BlinkIndicator();
      default:
        return ShiftIndicator();
    }
  }

  /// Initializes the brushes.
  _initBrushes() {
    _fixedDotFillBrush = Paint()
      ..color = widget.fixedDotDecoration.color
      ..style = PaintingStyle.fill;

    // Show stroke only when the strokeWidth is greater than 0.
    _fixedDotStrokeBrush = Paint()
      ..color = widget.fixedDotDecoration.strokeWidth > 0.0
          ? widget.fixedDotDecoration.strokeColor
          : _fixedDotFillBrush!.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = widget.fixedDotDecoration.strokeWidth;

    _lineConnectorBrush = Paint()
      ..color = widget.lineConnectorDecoration.color
      ..strokeWidth = widget.lineConnectorDecoration.strokeWidth;

    _indicatorBrush = Paint()
      ..color = widget.indicatorDecoration.color
      ..style = PaintingStyle.fill
      ..strokeWidth = widget.indicatorDecoration.strokeWidth;

    _borderBrush = Paint()
      ..color = widget.indicatorDecoration.strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = widget.indicatorDecoration.strokeWidth;
  }

  @override
  void didUpdateWidget(covariant DotStepper oldWidget) {
    // Update old and active dot indices.
    _oldDotIndex = oldWidget.activeStep;
    _initBrushes();

    // activeDot was updated by an event other than a tap, hence eventIsTap is false.
    _updateConfiguration(activeDotIndex: _activeDotIndex, eventIsTap: false);

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
