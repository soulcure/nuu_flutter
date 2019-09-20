import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';

import 'common/Global.dart';
import 'config/AppConfig.dart';
import 'http/HttpUtil.dart';
import 'model/loginResp.dart';
import 'res/strings.dart';

class ForgetPassWordPage extends StatefulWidget {
  @override
  _ForgetPassWordState createState() => _ForgetPassWordState();
}

class _ForgetPassWordState extends State<ForgetPassWordPage> {
  final _formKey = GlobalKey<FormState>();
  String username, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(IntlUtil.getString(context, Ids.actionRegister)),
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                buildEmailTextField(),
                SizedBox(height: 60.0),
                buildLoginButton(context),
              ],
            )));
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            IntlUtil.getString(context, Ids.submit),
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.blue,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              //只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              print('email:$email , assword:$password');
            }
          },
          shape: StadiumBorder(side: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: IntlUtil.getString(context, Ids.eMail),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return IntlUtil.getString(context, Ids.invalidEmail);
        } else {
          return null;
        }
      },
      onSaved: (String value) => email = value,
    );
  }

  reqRegister(final String username, String email, String mobile, String iso,
      final String password) async {
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
      Global.profile = resp.data;
      Global.saveProfile();
    }
  }
}
