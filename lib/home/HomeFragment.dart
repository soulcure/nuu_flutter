import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_statusbar/flutter_statusbar.dart';
import 'package:konnect/config/AppConfig.dart';
import 'package:konnect/home/ReportData.dart';
import 'package:konnect/utils/HttpUtil.dart';
import 'package:toast/toast.dart';

import 'BatteryStatusCardWidget.dart';
import 'ConnectCardWidget.dart';
import 'NetworkStatusCardWidget.dart';
import 'TodayUsedCardWidget.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeFragment> {
  GlobalKey<NetworkStatusState> _netKey = GlobalKey();
  GlobalKey<ConnectStatusState> _connectKey = GlobalKey();
  GlobalKey<BatteryStatusState> _batteryKey = GlobalKey();
  GlobalKey<TodayUsedState> _usedKey = GlobalKey();

  double _statusBarHeight = 84;

  _getStatusBarHeight() async {
    double height = await FlutterStatusbar.height;
    setState(() => _statusBarHeight = height);
  }

  _getData() async {
    var response = await HttpUtil().get(AppConfig.DEVICE_INFO);
    ReportData data = ReportData.fromJson(response);

    int point = data.hotAmount; //连接设备

    int power = data.pow; //电量

    bool isCharge;
    if (data.charge == 1) {
      //是否充电
      isCharge = true;
    } else {
      isCharge = false;
    }

    int signal;
    if (data.sim2 != null) {
      int netMode = data.sim2.netMode;
      int dbm = data.sim2.signal;
      signal = onSignalStrength(netMode, dbm);
    }

    setState(() {
      _netKey.currentState.onSuccess(signal);
      _connectKey.currentState.onSuccess(point);
      _batteryKey.currentState.onSuccess(power, isCharge);
      _usedKey.currentState.onSuccess(20);
    });
  }

  int onSignalStrength(int netMode, int dbm) {
    int res = 0;
    if (netMode == 13) {
      //LTE
      if (dbm >= -95) {
        res = 4;
      } else if (dbm >= -105) {
        res = 3;
      } else if (dbm >= -115) {
        res = 2;
      } else if (dbm >= -140) {
        res = 1;
      } else {
        res = 0;
      }
    } else if (netMode == 3 || netMode == 8 || netMode == 10 || netMode == 9) {
      if (dbm > -75) {
        res = 4;
      } else if (dbm > -85) {
        res = 3;
      } else if (dbm > -95) {
        res = 2;
      } else if (dbm > -100) {
        res = 1;
      } else {
        res = 0;
      }
    }

    return res;
  }

  @override
  void initState() {
    _getStatusBarHeight();
    _getData();

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
                  BatteryStatusCardWidget(_batteryKey),
                  TodayUsedCardWidget(_usedKey),
                  NetworkStatusCardWidget(_netKey),
                  ConnectCardWidget(_connectKey),
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
