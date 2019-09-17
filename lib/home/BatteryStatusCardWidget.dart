import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BatteryViewPainter.dart';

class BatteryStatusCardWidget extends StatefulWidget {
  @override
  _BatteryStatus createState() => _BatteryStatus();
}

class _BatteryStatus extends State<BatteryStatusCardWidget> {
  ui.Image _image;
  int _power = 80;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  _loadImage() async {
    ByteData bd = await rootBundle.load("assets/images/charger.png");

    final Uint8List bytes = Uint8List.view(bd.buffer);

    final ui.Codec codec = await ui.instantiateImageCodec(bytes);

    final ui.Image image = (await codec.getNextFrame()).image;

    setState(() => _image = image);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0x40ffffff),
      //设置shape，这里设置成了R角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: getChild(),
    );
  }

  getChild() {
    return Container(
      margin: EdgeInsets.all(40.0),
      child: CustomPaint(painter: BatteryViewPainter(_image, _power)),
    );
  }
}
