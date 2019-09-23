import 'package:flutter/material.dart';

import 'ServiceLocator.dart';
import 'TelAndSmsService.dart';

class ContactUsFragment extends StatelessWidget {
  final String email = "konnect-cs@nuumobile.com";

  final TelAndSmsService _service = locator<TelAndSmsService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      children: <Widget>[
        SizedBox(height: 40.0),
        Text(
          "联系",
          style: TextStyle(color: Color(0xFFA6CD39), fontSize: 20.0),
        ),
        SizedBox(height: 30.0),
        RaisedButton(
            child: Text(email), onPressed: () => _service.sendEmail(email)),
        SizedBox(height: 30.0),
        Text("Correspondence address",
            style: TextStyle(color: Color(0xFFA6CD39), fontSize: 20.0)),
        SizedBox(height: 30.0),
        Text("16F,CE0 Tower,77 Wing Hong St.Kwoloon,HongKong"),
      ],
    )));
  }
}
