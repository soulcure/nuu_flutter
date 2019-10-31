import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbar/flutter_statusbar.dart';
import 'package:konnect/common/Global.dart';
import 'package:konnect/config/AppConfig.dart';
import 'package:konnect/db/dbHelper.dart';
import 'package:konnect/model/Device.dart';
import 'package:konnect/utils/AppUtils.dart';
import 'package:konnect/home/ReportData.dart';
import 'package:konnect/http/HttpUtil.dart';

import 'BatteryStatusCardWidget.dart';
import 'ConnectCardWidget.dart';
import 'DetailToday.dart';
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

  _reqData() async {
    _reqDevices();
    _reqDetailToday();
  }

  _timerHandler() {
    Timer.periodic(Duration(seconds: 60), (timer) {
      print("Yeah, this line is printed after 60 second");
      _reqData();
    });
  }

  _reqDevices() async {
    var response = await HttpUtil.get(AppConfig.DEVICE_INFO);
    if (response == null) {
      return;
    }

    ReportData data = ReportData.fromJson(response);

    String deviceSN = data.deviceSN;
    String deviceId = data.deviceId;

    if (deviceSN.isEmpty || deviceId.isEmpty) {
      return;
    } else {
      Global.saveDeviceSN(deviceSN);
    }

    insertData(deviceSN, deviceId);

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
    });
  }

  _reqDetailToday() async {
    if (Global.deviceSN.isEmpty) {
      return;
    }

    FormData formData = new FormData.from({
      'deviceSn': Global.deviceSN,
    });
    String response =
        await HttpUtil.post(AppConfig.DETAIL_TODAY, data: formData);
    if (response == null) {
      return;
    }

    Map<String, dynamic> detail = json.decode(response);

    DetailToday rsp = DetailToday.fromJson(detail);

    int used = rsp.usedData;
    int total = rsp.totalData;

    String usedStr = AppUtils.formatBytes(used, 2);

    double d;
    if (used == 0 || total == 0) {
      d = 0;
    } else {
      d = used * 100.0 / total;
    }

    setState(() {
      _usedKey.currentState.onSuccess(d, usedStr);
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

  void insertData(String deviceSN, String deviceId) async {
    var db = DatabaseHelper();
    var res = await db.getAllDevices();
    print('Devices:$res');

    List listData = [];
    listData.addAll(res);

    bool insert = true;

    for (var item in listData) {
      Device temp = Device.fromMap(item);
      if (temp.deviceSN.compareTo(deviceSN) == 0) {
        insert = false;
        break;
      }
    }

    if (insert) {
      await db.saveDevice(Device(deviceSN, deviceId));
    }

    //setState(() {});
  }

  @override
  void initState() {
    _getStatusBarHeight();
    _reqData();
    _timerHandler();

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
                    _reqData();
                  },
                  iconSize: 100.0,
                ),
              ),
            ],
          ),
        ));
  }
}
