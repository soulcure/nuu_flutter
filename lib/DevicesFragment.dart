import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:konnect/http/HttpUtil.dart';

import 'Devices.dart';
import 'config/AppConfig.dart';

class DevicesFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FutureBuilderState();
}

class _FutureBuilderState extends State<DevicesFragment> {
  List<ListItem> listData;

  void initData(BuildContext context) {
    listData = [];
    listData.add(ListItem("Pavlova", "Pavlova", 1));
    listData.add(ListItem("randomWords", "randomWords", 2));
    listData.add(ListItem("Image", "Image", 2));
    listData.add(ListItem("GridView", "GridView", 1));
    listData.add(ListItem("StateWidget", "StateWidget", 2));
  }

  @override
  Widget build(BuildContext context) {
    initData(context);

    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              title: Text("连接的设备",
                  style: TextStyle(fontSize: 18.0, color: Colors.grey)),
              backgroundColor: Colors.white,
              elevation: 2.0, //设置阴影辐射范围
            ),
            preferredSize: Size.fromHeight(50)),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Devices(listData: this.listData),
        ));
  }

}
