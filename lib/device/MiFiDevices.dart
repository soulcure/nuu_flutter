import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:konnect/common/Global.dart';
import 'package:konnect/res/strings.dart';
import 'package:toast/toast.dart';

import 'package:konnect/model/Device.dart';
import 'package:konnect/res/styles.dart';

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
    Widget divider = Divider(
      color: Colors.grey,
    );

    return ListView.separated(
      itemCount: deviceList.length,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Row(children: <Widget>[
            SizedBox(
              width: 20.0,
            ),
            Image.asset(
              deviceList[index].deviceSN.compareTo(Global.deviceSN) == 0
                  ? 'assets/images/ic_green_status.png'
                  : 'assets/images/ic_red_status.png',
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 10.0,
            ),
            Image.asset(
              'assets/images/nuu_front.png',
              width: 70.5,
              height: 120,
            ),
            SizedBox(
              width: 20.0,
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
            optionDialog(deviceList[index].deviceSN);
          },
        );
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return divider;
      },
    );
  }

  Future<void> optionDialog(String deviceSN) async {
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
              deviceSN.compareTo(Global.deviceSN) == 0
                  ? 'assets/images/ic_green_status.png'
                  : 'assets/images/ic_red_status.png',
              width: 30,
              height: 30,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                InkWell(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 8),
                    child: Text(
                      IntlUtil.getString(context, Ids.setting),
                      style: TextStyles.deviceContent,
                    ),
                  ),
                  onTap: () {
                    Toast.show(deviceSN, context);
                  },
                ),
                InkWell(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 8),
                    child: Text(
                      IntlUtil.getString(context, Ids.buyPackage),
                      style: TextStyles.deviceContent,
                    ),
                  ),
                  onTap: () {
                    Toast.show(deviceSN, context);
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
