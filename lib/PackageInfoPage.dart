import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'common/Global.dart';
import 'config/AppConfig.dart';
import 'http/HttpUtil.dart';
import 'model/LoginResp.dart';
import 'res/strings.dart';

import 'dart:async';

import 'package:flutter/services.dart';

class PackageInfoPage extends StatefulWidget {
  final int packageId;

  PackageInfoPage(this.packageId);

  @override
  _PackageInfoState createState() => _PackageInfoState();
}

class _PackageInfoState extends State<PackageInfoPage> {
  static const platform = const MethodChannel('konnect.flutter.dev/paypal');

  final TextEditingController _controller = TextEditingController();

  DateTime newData = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  String username;
  String phoneNumber;
  String phoneIsoCode;
  String passwordCheck;

  var dropdownSelectedItem;
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(IntlUtil.getString(context, Ids.packageInfo)),
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(IntlUtil.getString(context, Ids.purchaseQuantity)),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 110.0,
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            //内容改变的回调
                            int count = int.parse(text);
                            if (count > 1) {
                              setState(() {
                                opacity = 1;
                              });
                            } else {
                              setState(() {
                                opacity = 0.0;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(IntlUtil.getString(context, Ids.effectiveDate)),
                      SizedBox(
                        width: 10.0,
                      ),
                      RaisedButton(
                        child: Text(DateFormat('yyyy-MM-dd').format(newData)),
                        onPressed: () {
                          dataPicker();
                        },
                      )
                    ],
                  ),
                ),
                Opacity(
                    opacity: opacity,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(IntlUtil.getString(context, Ids.effectiveMode)),
                          Container(
                            padding: EdgeInsets.only(left: 15.0),
                            alignment: AlignmentDirectional.center,
                            child: DropdownButton(
                              hint: new Text(IntlUtil.getString(
                                  context, Ids.takeEffectTogether)),
                              items: <String>[
                                IntlUtil.getString(
                                    context, Ids.takeEffectTogether),
                                IntlUtil.getString(
                                    context, Ids.takeEffectOneByOne),
                              ].map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              value: dropdownSelectedItem,
                              onChanged: (val) {
                                dropdownSelectedItem = val;
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(height: 30.0),
                buildBuyButton(context),
              ],
            )));
  }

  Align buildBuyButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            IntlUtil.getString(context, Ids.buy),
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: () {
            /*if (_formKey.currentState.validate()) {
              //只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
            }*/
            _paymentByPayPal();
          },
          shape: StadiumBorder(side: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }

  dataPicker() async {
    var picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2020),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    setState(() {
      if (picker != null) {
        newData = picker;
      }
    });
  }

  void reqRegister(final String username, String email, String mobile,
      String iso, final String password) async {
    print('selectedDate : $newData');

    FormData formData = new FormData.from({
      "username": username,
      "email": email,
      "mobile": mobile,
      "iso": iso,
      "password": password,
    });

    var response = await HttpUtil().post(AppConfig.REGISTER, data: formData);
    LoginResp resp = LoginResp.fromJson(response);
    if (resp.code == 0) {
      Global.profile = resp.profile;
      Global.saveProfile();

      Navigator.of(context).pop();
    }
  }

  Future<void> _paymentByPayPal() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('paymentByPayPal');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
  }
}
