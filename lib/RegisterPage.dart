import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:toast/toast.dart';

import 'common/Global.dart';
import 'config/AppConfig.dart';
import 'http/HttpUtil.dart';
import 'model/LoginResp.dart';
import 'res/strings.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscure = true;
  Color _eyeColor;

  String username;
  String phoneNumber;
  String phoneIsoCode;
  String passwordCheck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(IntlUtil.getString(context, Ids.actionRegister)),
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                buildUserNameTextField(),
                buildEmailTextField(),
                buildPhoneInput(),
                SizedBox(height: 30.0),
                buildPasswordTextField(context),
                buildPasswordCheckTextField(context),
                SizedBox(height: 60.0),
                buildRegisterButton(context),
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
                IntlUtil.getString(context, Ids.actionRegister),
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                print('去注册');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Align buildRegisterButton(BuildContext context) {
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

              if (Comparable.compare(_password, passwordCheck) != 0) {
                Toast.show("密码不一致", context);
                return;
              }

              print(
                  'username:$username,email:$_email , phoneNumber:$phoneNumber,phoneIsoCode:$phoneIsoCode,password:$_password');
              reqRegister(
                  username, _email, phoneNumber, phoneIsoCode, _password);
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
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  TextFormField buildUserNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: IntlUtil.getString(context, Ids.userName),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return IntlUtil.getString(context, Ids.invalidUsername);
        } else {
          return null;
        }
      },
      onSaved: (String value) => username = value,
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
          labelText: IntlUtil.getString(context, Ids.password),
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

  TextFormField buildPasswordCheckTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => passwordCheck = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return IntlUtil.getString(context, Ids.invalidPassword);
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          labelText: IntlUtil.getString(context, Ids.passwordCheck),
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
        labelText: IntlUtil.getString(context, Ids.eMail),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return IntlUtil.getString(context, Ids.invalidEmail);
        } else {
          return null;
        }
      },
      onSaved: (String value) => _email = value,
    );
  }

  InternationalPhoneInput buildPhoneInput() {
    var phoneInput = InternationalPhoneInput(
        onPhoneNumberChange: onPhoneNumberChange,
        initialPhoneNumber: phoneNumber,
        initialSelection: phoneIsoCode);
    return phoneInput;
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  void reqRegister(final String username, String email, String mobile,
      String iso, final String password) async {
    FormData formData = new FormData.from({
      "username": username,
      "email": email,
      "mobile": mobile,
      "iso": iso,
      "password": password,
    });

    var response = await HttpUtil.post(AppConfig.REGISTER, data: formData);
    LoginResp resp = LoginResp.fromJson(response);
    if (resp.code == 0) {
      Global.profile = resp.profile;
      Global.saveProfile();

      Navigator.of(context).pop();
    }
  }
}
