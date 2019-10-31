import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konnect/buy/PackageForSalePage.dart';
import 'package:konnect/common/Global.dart';
import 'package:konnect/db/dbHelper.dart';
import 'package:konnect/model/Device.dart';
import 'package:konnect/res/colors.dart';
import 'package:konnect/res/strings.dart';
import 'package:konnect/res/styles.dart';

class BuyPackageFragment extends StatefulWidget {
  @override
  _BuyPackageFragmentState createState() => _BuyPackageFragmentState();
}

class _BuyPackageFragmentState extends State<BuyPackageFragment> {
  final _snController = TextEditingController(text: Global.deviceSN);
  final secondTextFieldNode = FocusNode();
  List<Device> deviceList = [];
  String barcode;

  @override
  void initState() {
    super.initState();
    getAllDevices();
    _snController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    barcode = _snController.text;
    print('print barcode:$barcode');
  }

  @override
  void dispose() {
    _snController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        children: <Widget>[
          SizedBox(
            height: kToolbarHeight,
          ),
          Center(
              child: Text(
            IntlUtil.getString(context, Ids.buyPackageTitle),
            textAlign: TextAlign.center,
            style: TextStyles.buyPackageTitle,
          )),
          SizedBox(
            height: 20.0,
          ),
          Center(
              child: Text(
            IntlUtil.getString(context, Ids.inputDevice),
            style: TextStyles.buyPackageTitle,
            textAlign: TextAlign.center,
          )),
          SizedBox(
            height: 20.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _snController,
                  textAlign: TextAlign.center,
                  focusNode: secondTextFieldNode,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              IconButton(
                padding: EdgeInsets.only(bottom: 15.0),
                // action button
                icon: Image.asset(
                  'assets/images/ic_search_sn.png',
                  width: 40,
                  height: 40,
                ),
                iconSize: 40.0,
                onPressed: () {
                  selectDialog();
                }, //按键响应
              ),
            ],
          ),
          Center(
              child: Text(
            IntlUtil.getString(context, Ids.or),
            textAlign: TextAlign.center,
            style: TextStyles.buyPackageBold,
          )),
          SizedBox(
            height: 20.0,
          ),
          Center(
              child: Text(
            IntlUtil.getString(context, Ids.scanQR),
            textAlign: TextAlign.center,
            style: TextStyles.buyPackageTitle,
          )),
          SizedBox(
            height: 20.0,
          ),
          IconButton(
            // action button
            icon: Image.asset(
              'assets/images/ic_scan_sn.png',
              width: 80,
              height: 80,
            ),
            iconSize: 80.0,
            onPressed: () {
              scan();
            }, //按键响应
          ),
          SizedBox(
            height: 30.0,
          ),
          MaterialButton(
            color: Colours.colorPrimaryDark,
            textColor: Colors.white,
            child: Text(IntlUtil.getString(context, Ids.buyPackageInfo)),
            padding: EdgeInsets.all(10),
            onPressed: _buy,
          ),
        ],
      ),
    );
  }

  void _buy() {
    print('device sn: $_snController.text');
    if (_snController.text.length != 15) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(IntlUtil.getString(context, Ids.inputErrorSN)),
              ));
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PackageForSalePage(_snController.text)));
  }

  void onTextClear() {
    setState(() {
      _snController.clear();
    });
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();

      setState(() {
        this.barcode = barcode;
        _snController.text = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  Future<void> selectDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: ListTile(
            contentPadding:
                EdgeInsets.only(left: 0, top: 1, right: 0, bottom: 1),
            title: Text(IntlUtil.getString(context, Ids.choiceDevice)),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: getDeviceSN(),
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

  void getAllDevices() async {
    var db = DatabaseHelper();
    var res = await db.getAllDevices();
    print('Devices:$res');

    List listData = [];
    listData.addAll(res);

    if (listData.length > 0) {
      for (var item in listData) {
        Device device = Device.fromMap(item);
        deviceList.add(device);
      }
    }
  }

  List<Widget> getDeviceSN() {
    List<Widget> list = List();

    for (var item in this.deviceList) {
      var w = InkWell(
        child: Padding(
          padding: EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 8),
          child: Text(
            item.deviceSN,
            style: TextStyles.deviceContent,
          ),
        ),
        onTap: () {
          setState(() {
            _snController.text = item.deviceSN;
            Navigator.of(context).pop();
          });
        },
      );

      list.add(w);
    }

    return list;
  }
}
