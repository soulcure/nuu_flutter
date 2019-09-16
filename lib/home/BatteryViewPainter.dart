import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class BatteryViewPainter extends CustomPainter {
  ui.Image image;

  Paint _paintBackground;
  Paint _paintFore;

  int power = 90;
  int mColor;
  bool charge;

  BatteryViewPainter(this.image) : super() {
    _paintBackground = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;
    _paintFore = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;
  }

  @override
  Future paint(Canvas canvas, Size size) async {
    double width = size.width;
    double height = size.height;

    var headHeight = size.height / 20.0;

    Rect headRect = new Rect.fromPoints(
        Offset(width / 3.0, 0), Offset(width * 0.75, headHeight));
    canvas.drawRect(headRect, _paintBackground);

    double topOffset = (height - headHeight) * (100 - power) / 100.0;
    Rect rect = new Rect.fromPoints(
        Offset(0, headHeight), Offset(width, headHeight + topOffset));

    canvas.drawRect(rect, _paintBackground);

    Rect rect2 = new Rect.fromPoints(
        Offset(0, headHeight + topOffset), Offset(width, height));
    canvas.drawRect(rect2, _paintFore);

    //if (charge) {
    if (image != null) {
      canvas.drawImage(image, Offset(0.0, 0.0), _paintFore);
    }
    //}
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  Future<ui.Codec> _loadImage(AssetBundleImageKey key) async {
    final ByteData data = await key.bundle.load(key.name);
    if (data == null) throw 'Unable to read data';
    return await ui.instantiateImageCodec(data.buffer.asUint8List());
  }
}
