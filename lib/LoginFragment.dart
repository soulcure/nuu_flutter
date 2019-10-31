import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:konnect/utils/AppUtils.dart';

import 'common/Global.dart';
import 'config/AppConfig.dart';
import 'http/HttpUtil.dart';
import 'model/LoginResp.dart';
import 'res/strings.dart';

class LoginFragment extends StatefulWidget {
  LoginFragment({Key key, this.callBack}) : super(key: key);

  final callBack;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginFragment> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscure = true;
  Color _eyeColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                SizedBox(height: 20.0),
                buildEmailTextField(),
                SizedBox(height: 30.0),
                buildPasswordTextField(context),
                buildForgetPasswordText(context),
                SizedBox(height: 60.0),
                buildLoginButton(context),
                SizedBox(height: 30.0),
                buildRegisterText(context),
              ],
            )));
  }

  Align buildRegisterText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(IntlUtil.getString(context, Ids.noAccount)),
            InkWell(
              child: Text(
                IntlUtil.getString(context, Ids.signUpNow),
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('Register');
              },
            ),
          ],
        ),
      ),
    );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            IntlUtil.getString(context, Ids.actionSignIn),
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              //只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              print('email:$_email , assword:$_password');
              reqLogin(_email, _password);
            }
          },
          shape: StadiumBorder(side: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }

  Padding buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            IntlUtil.getString(context, Ids.forgetPW),
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('ForgetPW');
          },
        ),
      ),
    );
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return IntlUtil.getString(context, Ids.invalidPassword);
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          labelText: IntlUtil.getString(context, Ids.promptPassword),
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: IntlUtil.getString(context, Ids.promptEmail),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return IntlUtil.getString(context, Ids.invalidUsername);
        } else {
          return null;
        }
      },
      onSaved: (String value) => _email = value,
    );
  }

  reqLogin(String username, String password) async {
    FormData formData;
    if (AppUtils.isEmail(username)) {
      formData = new FormData.from({
        "password": password,
        "email": username,
      });
    } else {
      formData = new FormData.from({
        "password": password,
        "username": username,
      });
    }

    var response = await HttpUtil.post(AppConfig.LOGIN, data: formData);
    LoginResp resp = LoginResp.fromJson(response);
    if (resp.code == 0) {
      Global.profile = resp.profile;
      Global.saveProfile();

      widget.callBack(0);
    }
  }
}
