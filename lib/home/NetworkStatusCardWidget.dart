import 'package:fluintl/fluintl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/res/strings.dart';
import 'package:konnect/res/styles.dart';

class NetworkStatusCardWidget extends StatefulWidget {
  final double width;
  final double height;

  NetworkStatusCardWidget(Key key, this.width, this.height) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NetworkStatusState();
  }
}

class NetworkStatusState extends State<NetworkStatusCardWidget> {
  int _netStatus = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onSuccess(int count) {
    setState(() {
      _netStatus = count;
    });
  }

  getImage() {
    AssetImage image;
    switch (_netStatus) {
      case 0:
        image = AssetImage("assets/images/signal_0.png");
        break;
      case 1:
        image = AssetImage("assets/images/signal_1.png");
        break;
      case 2:
        image = AssetImage("assets/images/signal_2.png");
        break;
      case 3:
        image = AssetImage("assets/images/signal_3.png");
        break;
      case 4:
        image = AssetImage("assets/images/signal_4.png");
        break;
      default:
        image = AssetImage("assets/images/signal_0.png");
        break;
    }
    return image;
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
          padding: EdgeInsets.only(top: widget.height * 0.3),
          children: <Widget>[
            Image(
              width: widget.width * 0.5,
              height: widget.height * 0.25,
              fit: BoxFit.contain,
              image: getImage(),
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.height * 0.03),
              child: Text(IntlUtil.getString(context, Ids.networkStatus),
                  style: TextStyles.homeTitle, textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
