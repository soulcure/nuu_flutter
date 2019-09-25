import 'package:flutter/material.dart';

import 'model/device.dart';

class Devices extends StatefulWidget {
  Devices(Key key) : super(key: key);

  DevicesState createState() => DevicesState();
}

class DevicesState extends State<Devices> {
  List<Device> deviceList = [];

  void onSuccess(List<Device> list) {
    setState(() {
      deviceList = list;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
      itemCount: deviceList.length,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return Column(children: <Widget>[
          Text(deviceList[index].deviceSN),
          Container(
            height: 250,
            child: Text(deviceList[index].deviceId),
          ),
        ]);
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}
