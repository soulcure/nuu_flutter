import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/res/styles.dart';
import 'package:sprintf/sprintf.dart';

import 'CircleProgressBarPainter.dart';

class TodayUsedCardWidget extends StatefulWidget {
  TodayUsedCardWidget(Key key) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TodayUsedState();
  }
}

class TodayUsedState extends State<TodayUsedCardWidget> {
  String _rateStr = '0%';
  double _rate = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onSuccess(double rate) {
    setState(() {
      _rate = rate;
      _rateStr = sprintf(' %1d%', [rate]);
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
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text('今日用量', style: TextStyles.homeTitle),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: getChild(),
          ),
        ],
      ),
    );
  }


  getChild() {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: CustomPaint(
          child: Center(
            child: Text(_rateStr, style: TextStyles.homeRate),
          ),
          painter: CircleProgressBarPainter(_rate)),
    );
  }
}
