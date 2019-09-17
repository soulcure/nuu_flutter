import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter_statusbar/flutter_statusbar.dart';
import 'package:toast/toast.dart';
import 'dart:ui' as ui;

import 'BatteryViewPainter.dart';
import 'CircleProgressBarPainter.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeFragment> {
  final _formKey = GlobalKey<FormState>();
  double _statusBarHeight = 84;

  getData() async {
    double height = await FlutterStatusbar.height;
    setState(() => _statusBarHeight = height);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width; //屏幕宽
    final screenH = MediaQuery.of(context).size.height; //屏幕高

    var widgetW = screenW;
    var widgetH = screenH - _statusBarHeight;

    const double padding = 2;
    const int spacing = 10;

    var w = (widgetW - 2 * padding - spacing) / 2;
    var h = (widgetH - 2 * padding - spacing) / 2;

    var ratio = w / h;

    return Container(
        key: _formKey,
        padding: EdgeInsets.all(padding),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              GridView.count(
                //横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
                crossAxisCount: 2,
                //子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度
                childAspectRatio: ratio,
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
              Container(
                child: IconButton(
                  // action button
                  icon: Image.asset('assets/images/btn_refresh.png'),
                  onPressed: () {
                    Toast.show("btn_refresh on click", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  },
                  iconSize: 100.0,
                ),
              ),
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
      margin: EdgeInsets.all(25.0),
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