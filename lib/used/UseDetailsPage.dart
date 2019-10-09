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
  AsyncMemoizer _asyncMem = AsyncMemoizer();

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
                  //_getData('20191002', '20191009');
                  _refreshData();
                },
              ),
            ],
          ),
          /*RefreshIndicator(
            onRefresh: _refreshData,
            child: FutureBuilder(
              builder: _buildFuture,
              future: _getData('20191002', '20191009'),
            ),
          ),*/
        ],
      ),
    );
  }

  Future _refreshData() async {
    setState(() {
      _asyncMem = AsyncMemoizer();
    });
  }

  DateTime startData = DateTime.now();
  DateTime endData = DateTime.now();

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
      startData = picker;
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
      endData = picker;
    });
  }

  _getData() {
    return _asyncMem.runOnce(() async {
      FormData formData = new FormData.from({
        'deviceSn': Global.deviceSN,
        'beginDate': DateFormat('yyyyMMdd').format(startData),
        'endDate': DateFormat('yyyyMMdd').format(endData),
      });

      String response =
          await HttpUtil().post(AppConfig.DETAIL_PERIOD, data: formData);
      Map<String, dynamic> detail = json.decode(response);
      UsedDetail resp = UsedDetail.fromJson(detail);

      return resp;
    });
  }

  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return Text('还没有开始网络请求');
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    UsedDetail resp = snapshot.data;
    List movies = resp.used;
    return ListView.builder(
      itemBuilder: (context, index) => _itemBuilder(context, index, movies),
      itemCount: movies.length * 2,
    );
  }

  Widget _itemBuilder(BuildContext context, int index, skills) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    String used = AppUtils.formatBytes(skills[index]['used_data'], 2);

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 1.0),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 5),
                  Text(IntlUtil.getString(context, Ids.packageName),
                      style: TextStyle(color: Color(0xFF122634))),
                  SizedBox(width: 5),
                  Text(skills[index]['package_name'],
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
                  Text(skills[index]['country'],
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
                  Text(used.toString(),
                      style: TextStyle(color: Color(0xFFACACAC))),
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
                  Text(skills[index]['end_date'],
                      style: TextStyle(color: Color(0xFFACACAC))),
                ],
              ),
            ),
          ]),
    );
  }
}
