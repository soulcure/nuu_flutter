import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectCardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConnectStatusState();
  }
}

class _ConnectStatusState extends State<ConnectCardWidget> {
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
              child: Text("连接设备:",
                  style: TextStyle(color: Colors.black, fontSize: 22.0),
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
