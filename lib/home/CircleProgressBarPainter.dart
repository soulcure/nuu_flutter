import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/res/styles.dart';

class CircleProgressBarPainter extends CustomPainter {
  final double pi = 3.1415926;
  double progress;
  String used;

  Paint _paintBackground;
  Paint _paintFore;

  CircleProgressBarPainter(this.progress, this.used) : super() {
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
  Future paint(Canvas canvas, Size size) async {
    double width = size.width;
    double height = size.height;

    print('CircleProgressBarPainter width:$width , height:$height');

    canvas.drawCircle(
        Offset(width / 2, height / 2), width / 2, _paintBackground);
    Rect rect = Rect.fromCircle(
      center: Offset(width / 2, height / 2),
      radius: width / 2,
    );
    //canvas.drawArc(rect, 0.0, progress * 3.14 / 180, false, _paintFore);
    canvas.drawArc(rect, 0.0, 2 * pi * progress / 100, false, _paintFore);

    //String rateStr = sprintf('%2.2f%', [progress]);
    drawText(canvas, used, width / 2, height / 2);
  }

  void drawText(Canvas canvas, String name, double x, double y) {
    TextSpan span = TextSpan(style: TextStyles.homeRate, text: name);
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, Offset(x - tp.width / 2, y - tp.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
