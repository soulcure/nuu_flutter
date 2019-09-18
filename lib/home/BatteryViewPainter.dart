import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class BatteryViewPainter extends CustomPainter {
  ui.Image image;
  int power;
  bool isCharge;

  Paint _paintBackground;
  Paint _paintFore;

  int mColor;

  BatteryViewPainter(this.image, this.power, this.isCharge) : super() {
    _paintBackground = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;
    _paintFore = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0
      ..isAntiAlias = true;

    if (power < 30) {
      _paintFore.color = Colors.red;
    }
    if (power >= 30 && power < 50) {
      _paintFore.color = Colors.blue;
    }
    if (power >= 50) {
      _paintFore.color = Colors.green;
    }
  }

  @override
  Future paint(Canvas canvas, Size size) async {
    double width = size.width;
    double height = size.height;

    print('BatteryViewPainter width:$width , height:$height');

    var headHeight = width / 20.0;

    Rect headRect = new Rect.fromPoints(
        Offset(width / 3.0, 0), Offset(width * 0.7, headHeight));
    canvas.drawRect(headRect, _paintBackground);

    double topOffset = (height - headHeight) * (100 - power) / 100.0;
    Rect rect = new Rect.fromPoints(
        Offset(0, headHeight), Offset(width, headHeight + topOffset));

    canvas.drawRect(rect, _paintBackground);

    Rect rect2 = new Rect.fromPoints(
        Offset(0, headHeight + topOffset), Offset(width, height));
    canvas.drawRect(rect2, _paintFore);

    if (isCharge && image != null) {
      var left = (width - image.width) / 2;
      var top = (height - headHeight - image.height) / 2;
      canvas.drawImage(image, Offset(left, top), _paintFore);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
