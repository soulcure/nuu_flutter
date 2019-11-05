import 'package:fluintl/fluintl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/res/strings.dart';
import 'package:konnect/res/styles.dart';

class ConnectCardWidget extends StatefulWidget {
  final double width;
  final double height;

  ConnectCardWidget(Key key, this.width, this.height) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ConnectStatusState();
  }
}

class ConnectStatusState extends State<ConnectCardWidget> {
  int _connect = 0;

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
          padding: EdgeInsets.only(top: widget.height * 0.25),
          children: <Widget>[
            Image(
              width: widget.width * 0.5,
              height: widget.height * 0.3,
              image: AssetImage("assets/images/connection_icon.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.height * 0.03),
              child: Text(
                  IntlUtil.getString(context, Ids.connectCount,
                      params: [_connect]),
                  style: TextStyles.homeTitle,
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
