import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'config/AppConfig.dart';
import 'http/HttpUtil.dart';
import 'model/BaseResp.dart';
import 'res/strings.dart';

class ForgetPassWordPage extends StatefulWidget {
  @override
  _ForgetPassWordState createState() => _ForgetPassWordState();
}

class _ForgetPassWordState extends State<ForgetPassWordPage> {
  final _formKey = GlobalKey<FormState>();
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(IntlUtil.getString(context, Ids.forgetPW)),
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
              print('email:$email');
              reqForgetPassword(email);
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

  reqForgetPassword(String email) async {
    FormData formData = new FormData.from({
      "email": email,
    });

    var response =
        await HttpUtil().post(AppConfig.FORGET_PASSWORD, data: formData);
    BaseResp resp = BaseResp.fromJson(response);
    if (resp.code == 0) {
      Toast.show("success", context);
    }
  }
}
