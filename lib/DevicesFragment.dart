import 'package:flutter/material.dart';
import 'Devices.dart';
import 'db/dbHelper.dart';
import 'model/device.dart';

class DevicesFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FutureBuilderState();
}

class _FutureBuilderState extends State<DevicesFragment> {
  GlobalKey<DevicesState> _devicesKey = GlobalKey();

  void getAllDevices() async {
    var db = DatabaseHelper();
    var res = await db.getAllDevices();
    print('Devices:$res');
    setState(() {
      List listData = [];
      listData.addAll(res);
      List<Device> list = [];
      if (listData.length > 0) {
        for (var item in listData) {
          Device device = Device.fromMap(item);
          list.add(device);
        }
      }
      _devicesKey.currentState.onSuccess(list);
    });
  }

  @override
  void initState() {
    super.initState();
    getAllDevices();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Devices(_devicesKey),
        ));
  }
}
