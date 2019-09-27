import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konnect/res/colors.dart';
import 'package:konnect/res/strings.dart';
import 'package:konnect/res/styles.dart';
import 'package:konnect/widget/verification_code.dart';

class BuyPackageFragment extends StatefulWidget {
  @override
  _BuyPackageFragmentState createState() => _BuyPackageFragmentState();
}

class _BuyPackageFragmentState extends State<BuyPackageFragment> {
  String barcode = "";

  final _snController = TextEditingController();

  String value;

  FocusNode secondTextFieldNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _snController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    barcode = _snController.text;
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
                icon: Image.asset('assets/images/ic_search_sn.png'),
                iconSize: 40.0,
                onPressed: () {}, //按键响应
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
            icon: Image.asset('assets/images/ic_scan_sn.png'),
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
    print({'device sn': _snController.text});
    if (_snController.text.length != 15) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(IntlUtil.getString(context, Ids.inputErrorSN)),
              ));
      return;
    }
    Navigator.of(context).pushNamed('PackageForSale');
  }

  void onTextClear() {
    setState(() {
      _snController.clear();
    });
  }

  ///验证码组件
  verificationCode() {
    var textSize = 50.0;
    var spaceWidth = 30.0;
    var letterSpacing = 30.0;
    var underLineBorder = DottedLineUnderlineInputBorder(
      spaceWidth: spaceWidth,
      textSize: textSize,
      textLength: 4,
      letterSpacing: letterSpacing,
      borderSide: BorderSide(color: Colors.black26, width: 2.0),
    );
    return TextField(
      maxLength: 4,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: textSize,
        color: Colors.black87,
        letterSpacing: letterSpacing,
      ),
      decoration: InputDecoration(
        hintText: '    请 输 入 验 证 码',
        hintStyle: TextStyle(fontSize: 14.0, letterSpacing: 0.0),
        enabledBorder: underLineBorder,
        focusedBorder: underLineBorder,
      ),
    );
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
}
