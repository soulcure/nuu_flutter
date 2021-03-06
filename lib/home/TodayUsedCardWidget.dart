import 'package:fluintl/fluintl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/res/strings.dart';
import 'package:konnect/res/styles.dart';

import 'CircleProgressBarPainter.dart';

class TodayUsedCardWidget extends StatefulWidget {
  final double width;
  final double height;

  TodayUsedCardWidget(Key key, this.width, this.height) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TodayUsedState();
  }
}

class TodayUsedState extends State<TodayUsedCardWidget> {
  double _rate = 0;
  String _used = '0B';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onSuccess(double rate, String used) {
    setState(() {
      _rate = rate;
      _used = used;
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
      child: InkWell(
        onTap: () {
          //Toast.show("used information", context);
          Navigator.of(context).pushNamed('UseDetails');
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: widget.height * 0.05),
              child: Text(IntlUtil.getString(context, Ids.todayUsed),
                  style: TextStyles.homeTitle),
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.height * 0.08),
              child: CustomPaint(
                  size: Size(widget.width / 1.5, widget.width / 1.5),
                  painter: CircleProgressBarPainter(_rate, _used)),
            ),
          ],
        ),
      ),
    );
  }
}
