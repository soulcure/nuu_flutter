import 'package:flutter/material.dart';
import 'MiFiDevices.dart';
import '../db/dbHelper.dart';
import '../model/Device.dart';

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

    List listData = [];
    listData.addAll(res);

    List<Device> list = [];
    if (listData.length > 0) {
      for (var item in listData) {
        Device device = Device.fromMap(item);
        list.add(device);
      }
    }

    setState(() {
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
        backgroundColor: Color(0xFFFAFAFA),
        appBar: PreferredSize(
            child: AppBar(
              title: Text("连接的设备",
                  style: TextStyle(fontSize: 18.0, color: Colors.grey)),
              backgroundColor: Color(0xFFFAFAFA),
              elevation: 2.0, //设置阴影辐射范围
            ),
            preferredSize: Size.fromHeight(50)),
        body: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Devices(_devicesKey),
        ));
  }
}
