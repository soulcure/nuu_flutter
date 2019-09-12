import 'package:flutter/material.dart';

class ContactUsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 22.0),
      children: <Widget>[
        SizedBox(
          height: kToolbarHeight,
        ),
        SizedBox(height: 20.0),
        Text("联系"),
        SizedBox(height: 30.0),
        Text("konnect-cs@nuumobile.com"),
        SizedBox(height: 30.0),
        Text("Correspondence address"),
        SizedBox(height: 30.0),
        Text("16F,CE0 Tower,77 Wing Hong St.Kwoloon,HongKong"),
      ],
    )));
  }
}
