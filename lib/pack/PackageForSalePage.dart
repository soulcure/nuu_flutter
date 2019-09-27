import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:konnect/config/AppConfig.dart';
import 'package:konnect/http/HttpUtil.dart';
import 'package:konnect/res/strings.dart';

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
    return Column(children: <Widget>[
      Text(skills[index]['package_name']),
      Text(skills[index]['currency']),
      Text(skills[index]['cost']),
      //Text(skills[index]['country']),
    ]);
  }
}
