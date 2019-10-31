import 'dart:convert';
import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:konnect/common/Global.dart';
import 'package:konnect/config/AppConfig.dart';
import 'package:konnect/http/HttpUtil.dart';
import 'package:konnect/model/UsedDetail.dart';
import 'package:konnect/res/strings.dart';
import 'package:intl/intl.dart';
import 'package:konnect/res/styles.dart';
import 'package:konnect/utils/AppUtils.dart';

class UseDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UseDetailsState();
}

class _UseDetailsState extends State<UseDetailsPage> {
  DateTime startData = DateTime.now().subtract(new Duration(days: 7)); //前七天
  DateTime endData = DateTime.now();
  List<Used> used = List();

  @override
  void initState() {
    /*var test = Used(
        country: 'china',
        packageName: "30天",
        usedData: 100,
        endDate: '20191009');
    used.add(test);*/
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(IntlUtil.getString(context, Ids.useDetails)),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(IntlUtil.getString(context, Ids.startDate),
                  style: TextStyles.usedDetails),
              RaisedButton(
                padding: EdgeInsets.all(0),
                child: Text(DateFormat('yyyy-MM-dd').format(startData),
                    style: TextStyles.usedDetails),
                onPressed: () {
                  startDataPicker();
                },
              ),
              SizedBox(
                width: 2.0,
              ),
              Text(IntlUtil.getString(context, Ids.endDate),
                  style: TextStyles.usedDetails),
              RaisedButton(
                padding: EdgeInsets.all(0),
                child: Text(DateFormat('yyyy-MM-dd').format(endData),
                    style: TextStyles.usedDetails),
                onPressed: () {
                  endDataPicker();
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                padding: EdgeInsets.all(0),
                child: Text(IntlUtil.getString(context, Ids.query),
                    style: TextStyles.usedDetails),
                onPressed: () {
                  _getData();
                },
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  _itemBuilder(context, index, used),
              itemCount: used.length,
            ),
          ),
        ],
      ),
    );
  }

  startDataPicker() async {
    var picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    setState(() {
      if (picker != null) {
        startData = picker;
      }
    });
  }

  endDataPicker() async {
    var picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    setState(() {
      if (picker != null) {
        endData = picker;
      }
    });
  }

  _getData() async {
    FormData formData = new FormData.from({
      'deviceSn': Global.deviceSN,
      'beginDate': DateFormat('yyyyMMdd').format(startData),
      'endDate': DateFormat('yyyyMMdd').format(endData),
    });

    String response =
        await HttpUtil.post(AppConfig.DETAIL_PERIOD, data: formData);
    Map<String, dynamic> detail = json.decode(response);
    UsedDetail resp = UsedDetail.fromJson(detail);
    setState(() {
      used = resp.used;
    });
  }
}

Widget _itemBuilder(BuildContext context, int index, List<Used> skills) {
  if (index.isOdd) {
    return Divider();
  }
  index = index ~/ 2;
  String used = AppUtils.formatBytes(skills[index].usedData, 2);

  return Padding(
    padding: EdgeInsets.all(10),
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 1.0),
        child: Row(
          children: <Widget>[
            SizedBox(width: 5),
            Text(IntlUtil.getString(context, Ids.packageName),
                style: TextStyle(color: Color(0xFF122634))),
            SizedBox(width: 5),
            Text(skills[index].packageName,
                style: TextStyle(color: Color(0xFFACACAC))),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Row(
          children: <Widget>[
            SizedBox(width: 5),
            Text(IntlUtil.getString(context, Ids.count),
                style: TextStyle(color: Color(0xFF122634))),
            SizedBox(width: 5),
            Text(skills[index].country,
                style: TextStyle(color: Color(0xFFACACAC))),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Row(
          children: <Widget>[
            SizedBox(width: 5),
            Text(IntlUtil.getString(context, Ids.currency),
                style: TextStyle(color: Color(0xFF122634))),
            SizedBox(width: 5),
            Text(used.toString(), style: TextStyle(color: Color(0xFFACACAC))),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Row(
          children: <Widget>[
            SizedBox(width: 5),
            Text(IntlUtil.getString(context, Ids.buyTime),
                style: TextStyle(color: Color(0xFF122634))),
            SizedBox(width: 5),
            Text(skills[index].endDate,
                style: TextStyle(color: Color(0xFFACACAC))),
          ],
        ),
      ),
    ]),
  );
}
