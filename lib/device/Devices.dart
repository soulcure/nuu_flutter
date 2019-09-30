import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:konnect/res/strings.dart';
import 'package:toast/toast.dart';

import '../model/device.dart';
import '../res/styles.dart';

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
        return GestureDetector(
          child: Row(children: <Widget>[
            IconButton(
              // action button
              padding: EdgeInsets.only(left: 20.0),
              icon: Image.asset('assets/images/ic_green_status.png'),
              iconSize: 20.0,
            ),
            Container(
              width: 105,
              height: 180,
              padding: EdgeInsets.only(right: 15.0),
              child: IconButton(
                // action button
                alignment: Alignment.centerLeft,
                icon: Image.asset('assets/images/nuu_front.png'),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(deviceList[index].deviceSN,
                      style: TextStyles.deviceTitle),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(deviceList[index].deviceId,
                        style: TextStyles.deviceContent),
                  ),
                ]),
          ]),
          onTap: () {
            optionDialog();
          },
        );
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }

  Future<void> optionDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: ListTile(
            contentPadding:
                EdgeInsets.only(left: 0, top: 1, right: 0, bottom: 1),
            title: Text(IntlUtil.getString(context, Ids.choiceDevice)),
            leading: Image.asset(
              'assets/images/ic_green_status.png',
              width: 30,
              height: 30,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 8),
                    child: Text(
                      IntlUtil.getString(context, Ids.setting),
                      style: TextStyles.deviceContent,
                    ),
                  ),
                  onTap: () {
                    Toast.show("msg1", context);
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 8),
                    child: Text(
                      IntlUtil.getString(context, Ids.buyPackage),
                      style: TextStyles.deviceContent,
                    ),
                  ),
                  onTap: () {
                    Toast.show("msg2", context);
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(IntlUtil.getString(context, Ids.cancel)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
