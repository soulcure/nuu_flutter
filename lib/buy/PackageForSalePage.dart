import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:konnect/config/AppConfig.dart';
import 'package:konnect/http/HttpUtil.dart';
import 'package:konnect/res/strings.dart';
import 'package:toast/toast.dart';

class PackageForSalePage extends StatefulWidget {
  final String deviceSN;

  PackageForSalePage(this.deviceSN);

  @override
  State<StatefulWidget> createState() => _PackageForSaleState();
}

class _PackageForSaleState extends State<PackageForSalePage> {
  AsyncMemoizer _asyncMemo = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(IntlUtil.getString(context, Ids.packageTitle)),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder(
          builder: _buildFuture,
          future: _getData(), // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _refreshData() async {
    setState(() {
      _asyncMemo = AsyncMemoizer();
    });
  }

  _getData() {
    return _asyncMemo.runOnce(() async {
      FormData formData = new FormData.from({
        'deviceSn': widget.deviceSN,
      });
      return await HttpUtil().post(AppConfig.PACKAGE_FOR_SALE, data: formData);
    });
  }

  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('Network request has not yet started');
        return Text('Network request has not yet started');
      case ConnectionState.active:
        print('active');
        return Text('Connection state active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('Connection state done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return Text('Network request has not yet started');
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    var data = json.decode(snapshot.data.toString());
    List movies = data['package'];

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

    int cycleTime = skills[index]['cycle_time'];
    int cycleTimeType = skills[index]['cycle_time_type'];

    var list = skills[index]['country'];
    String country = "";
    if (list != null && list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        country = country + list[i];
        if (i < list.length - 1) {
          country = country + " , ";
        }
      }
    }

    String type;
    switch (cycleTimeType) {
      case 1:
        type = IntlUtil.getString(context, Ids.day);
        break;
      case 3:
        type = IntlUtil.getString(context, Ids.month);
        break;
      case 4:
        type = IntlUtil.getString(context, Ids.year);
        break;
      case 5:
        type = IntlUtil.getString(context, Ids.hour);
        break;
      default:
        type = IntlUtil.getString(context, Ids.day);
        break;
    }
    String time = IntlUtil.getString(context, Ids.cycleTimeValue,
        params: [cycleTime, type]);

    return GestureDetector(
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(IntlUtil.getString(context, Ids.packageName),
                    style: TextStyle(color: Color(0xFF122634))),
                SizedBox(
                  width: 10.0,
                ),
                Text(skills[index]['package_name'],
                    style: TextStyle(color: Color(0xFFACACAC))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(IntlUtil.getString(context, Ids.packageType),
                    style: TextStyle(color: Color(0xFF122634))),
                SizedBox(
                  width: 10.0,
                ),
                Text(skills[index]['currency'],
                    style: TextStyle(color: Color(0xFFACACAC))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(IntlUtil.getString(context, Ids.data),
                    style: TextStyle(color: Color(0xFF122634))),
                SizedBox(
                  width: 10.0,
                ),
                Text(skills[index]['cost'],
                    style: TextStyle(color: Color(0xFFACACAC))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(IntlUtil.getString(context, Ids.cycleTime),
                    style: TextStyle(color: Color(0xFF122634))),
                SizedBox(
                  width: 10.0,
                ),
                Text(time, style: TextStyle(color: Color(0xFFACACAC))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
//          spacing: 8.0, // 主轴(水平)方向间距
//          runSpacing: 4.0, // 纵轴（垂直）方向间距
//          alignment: WrapAlignment.center, //沿主轴方向居中
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(IntlUtil.getString(context, Ids.useCountry),
                    style: TextStyle(color: Color(0xFF122634))),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    country,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xFFACACAC)),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ]),
        onTap: () {
          Toast.show("onclick", context);
        });
  }
}
