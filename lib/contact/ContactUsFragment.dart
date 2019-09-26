import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:konnect/res/strings.dart';

import 'ServiceLocator.dart';
import 'TelAndSmsService.dart';

class ContactUsFragment extends StatelessWidget {
  final String email = "konnect-cs@nuumobile.com";

  final TelAndSmsService _service = locator<TelAndSmsService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              IntlUtil.getString(context, Ids.contact),
              style: TextStyle(color: Color(0xFFA6CD39), fontSize: 20.0),
            ),
            FlatButton(
                padding: EdgeInsets.all(0),
                child: Text(
                  email,
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 20.0),
                ),
                onPressed: () => _service.sendEmail(email)),
            SizedBox(height: 30.0),
            Text(IntlUtil.getString(context, Ids.contactAddress),
                style: TextStyle(color: Color(0xFFA6CD39), fontSize: 20.0)),
            SizedBox(height: 5.0),
            Text(IntlUtil.getString(context, Ids.address),
                style: TextStyle(color: Color(0xFF000000), fontSize: 18.0)),
          ]),
    ));
  }
}
