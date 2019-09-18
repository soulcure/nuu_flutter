import 'package:fluintl/fluintl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/res/strings.dart';

class ConnectCardWidget extends StatefulWidget {

  ConnectCardWidget(Key key) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ConnectStatusState();
  }
}

class ConnectStatusState extends State<ConnectCardWidget> {
  int _connect = 5;

  void onSuccess(int count) {
    setState(() {
      _connect = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0x40ffffff),
      //设置shape，这里设置成了R角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: Container(
        width: 200,
        height: 150,
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.only(top: 60.0),
          children: <Widget>[
            Image(
              width: 100,
              height: 100,
              image: AssetImage("assets/images/connection_icon.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                  IntlUtil.getString(context, Ids.connectCount,
                      params: [_connect]),
                  style: TextStyle(color: Colors.black, fontSize: 22.0),
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
