import 'package:flutter/material.dart';
import 'package:im_stepper/src/dot_stepper/dot_offset.dart';

class FixedDotPainter extends CustomPainter {
  FixedDotPainter({this.dotRadius, this.dotCount, this.dotOffsets});

  final int dotCount;
  final double dotRadius;
  final List<DotOffset> dotOffsets;

  @override
  void paint(Canvas canvas, Size size) {
    for (int index = 0; index < dotCount; index++) {
      
      // canvas.drawCircle(
      //   dotOffsets[index].center,
      //   dotRadius,
      //   Paint()..color = Colors.grey,
      // );

      print('left: ${dotOffsets[index].left.dx}');
      print('Right: ${dotOffsets[index].right.dx}');

      canvas.drawRect(
        Rect.fromLTRB(
          dotOffsets[index].left.dx,
          dotOffsets[index].top.dy + 10,
          dotOffsets[index].right.dx,
          dotOffsets[index].bottom.dy - 10,
        ),
        Paint()..color = Colors.grey,
      );
    }
  }

  @override
  bool shouldRepaint(FixedDotPainter oldDelegate) => true;
}
