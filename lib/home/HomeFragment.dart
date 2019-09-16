import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:ui' as ui;

import 'BatteryViewPainter.dart';
import 'CircleProgressBarPainter.dart';

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

class BatteryStatusCardWidget extends StatefulWidget {
  @override
  _BatteryStatus createState() => _BatteryStatus();
}

class _BatteryStatus extends State<BatteryStatusCardWidget> {
  ui.Image _image;

  @override
  void initState() {
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
      margin: EdgeInsets.all(10.0),
      child: CustomPaint(painter: BatteryViewPainter(_image)),
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
