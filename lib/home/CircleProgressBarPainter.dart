import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleProgressBarPainter extends CustomPainter {
  Paint _paintBackground;
  Paint _paintFore;
  final double pi = 3.1415926;
  var progress;

  CircleProgressBarPainter(this.progress) {
    _paintBackground = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
    _paintFore = Paint()
      ..color = Color(0xFF5A8432)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        _paintBackground);
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    //canvas.drawArc(rect, 0.0, progress * 3.14 / 180, false, _paintFore);
    canvas.drawArc(rect, 0.0, 2 * pi * progress / 100, false, _paintFore);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
