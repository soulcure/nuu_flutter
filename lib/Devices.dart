import 'package:flutter/material.dart';

class Devices extends StatefulWidget {
  final List<ListItem> listData;

  Devices({Key key, @required this.listData}) : super(key: key);

  @override
  _DevicesState createState() => _DevicesState(listData: this.listData);
}

class _DevicesState extends State<Devices> {
  List<ListItem> listData;

  _DevicesState({Key key, @required this.listData});

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
      itemCount: listData.length,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return Column(children: <Widget>[
          Text(listData[index].deviceSN),
          Container(
            height: 250,
            child: Text(listData[index].deviceId),
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

class ListItem {
  String deviceSN;
  String deviceId;
  int connected;

  ListItem(this.deviceSN, this.deviceId, this.connected);
}
