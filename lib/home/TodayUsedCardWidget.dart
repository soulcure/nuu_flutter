import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CircleProgressBarPainter.dart';

class TodayUsedCardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodayUsedState();
  }
}

class _TodayUsedState extends State<TodayUsedCardWidget> {
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
      child: getChild(),
    );
  }

  getChild() {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: CustomPaint(
          child: Center(child: Text((30).round().toString())),
          painter: CircleProgressBarPainter(30)),
    );
  }
}
