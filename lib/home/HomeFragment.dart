import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_statusbar/flutter_statusbar.dart';
import 'package:toast/toast.dart';

import 'BatteryStatusCardWidget.dart';
import 'CircleProgressBarPainter.dart';
import 'ConnectCardWidget.dart';
import 'NetworkStatusCardWidget.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeFragment> {
  //final _formKey = GlobalKey<FormState>();

  final _formKey = GlobalKey();

  double _statusBarHeight = 84;

  _getStatusBarHeight() async {
    double height = await FlutterStatusbar.height;
    setState(() => _statusBarHeight = height);
  }

  @override
  void initState() {
    _getStatusBarHeight();
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
                  NetworkStatusCardWidget(_formKey),
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
