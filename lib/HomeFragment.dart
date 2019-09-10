import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData;
import 'dart:ui' as ui;

class HomeFragment extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeFragment> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _formKey,
        body: Center(
          child: GridView.count(
            //横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
            crossAxisCount: 2,
            //子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度
            childAspectRatio: 0.8,
            //主轴方向的间距。
            mainAxisSpacing: 10,
            //横轴方向子元素的间距。
            crossAxisSpacing: 10,
            children: <Widget>[
              BatteryStatusCardWidget(),
              TodayUsedCardWidget(),
              NetworkStatusCardWidget(),
              ConnectCardWidget(),
            ],
          ),
        ));
  }
}

class BatteryStatusCardWidget extends StatelessWidget {
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
      margin: EdgeInsets.all(10.0),
      child: CustomPaint(painter: BatteryViewPainter(30)),
    );
  }
}

class TodayUsedCardWidget extends StatelessWidget {
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
      margin: EdgeInsets.all(10.0),
      child: CustomPaint(
          child: Center(child: Text((30).round().toString())),
          painter: CircleProgressBarPainter(30)),
    );
  }
}

class NetworkStatusCardWidget extends StatelessWidget {
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
      width: 200,
      height: 150,
      alignment: Alignment.center,
      child: ListView(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
        children: <Widget>[
          Image(
            width: 100,
            height: 76,
            fit: BoxFit.contain,
            image: AssetImage("assets/images/signal_0.png"),
          ),
          Text("网络状态:",
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

class ConnectCardWidget extends StatelessWidget {
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
      width: 200,
      height: 150,
      alignment: Alignment.center,
      child: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Image(
            width: 100,
            height: 100,
            image: AssetImage("assets/images/connection_icon.png"),
          ),
          Text("连接设备:",
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

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
      ..color = Colors.red
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

class BatteryViewPainter extends CustomPainter {
  Paint _paintBackground;
  Paint _paintFore;

  int power = 100;
  int mColor;
  bool charge;

  BatteryViewPainter(this.power) {
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
  void paint(Canvas canvas, Size size) {
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
    var sunImage = AssetImage("assets/images/charger.png");

    sunImage.obtainKey(ImageConfiguration()).then((AssetBundleImageKey key) {
      _loadImage(key).then((ui.Codec codec) {
        print("frameCount: ${codec.frameCount.toString()}");
        codec.getNextFrame().then((info) {
          print("image: ${info.image.toString()}");
          print("duration: ${info.duration.toString()}");
          canvas.drawImage(info.image, Offset(20, 20), Paint());
        });
      });
    });
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

