import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:konnect/common/Global.dart';
import 'package:konnect/http/HttpUtil.dart';
import 'package:konnect/res/strings.dart';
import 'package:konnect/utils/AppUtils.dart';

import '../config/AppConfig.dart';

class MyPackageFragment extends StatefulWidget {
  @override
  _MyPackageState createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackageFragment>
    with SingleTickerProviderStateMixin {
  List list = ["scheduled", "history"];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: list.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Color(0xFFFAFAFA),
            bottom: TabBar(
                controller: _tabController,
                tabs: list
                    .map(
                      (item) => Tab(
                        key: PageStorageKey('$item'),
                        child: Text(
                          '$item',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                    .toList()),
          ),
          preferredSize: Size.fromHeight(50)),
      body: TabBarView(
          controller: _tabController,
          children: list
              .map(
                (item) => Container(
                  key: PageStorageKey('$item'),
                  child: TabItemView(item: item),
                ),
              )
              .toList()),
    );
  }
}

class TarItemState extends State<TabItemView> {
  static const int INVALID = 0;
  static const int VALID = 1;
  static const int EXPIRED = 2;

  AsyncMemoizer _asyncMemo = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder(
          builder: _buildFuture,
          future: _gerData(), // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
        ),
      ),
    );
  }

  _gerData() {
    return _asyncMemo.runOnce(() async {
      FormData formData = new FormData.from({
        'deviceSn': Global.deviceSN,
      });

      return await HttpUtil.post(AppConfig.BUY_PACKAGE, data: formData);
    });
  }

  Future _refreshData() async {
    setState(() {
      _asyncMemo = AsyncMemoizer();
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
    var data = json.decode(snapshot.data.toString());
    List movies = new List();
    for (var item in data['package']) {
      if (widget.item.toString().compareTo("scheduled") == 0 &&
          item['status'] == VALID) {
        movies.add(item);
      } else if (widget.item.toString().compareTo("history") == 0 &&
          item['status'] != VALID) {
        movies.add(item);
      }
    }

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
    String used = AppUtils.formatBytes(skills[index]['data_used'], 2);
    String total = AppUtils.formatBytes(skills[index]['data'], 2);

    return Column(children: <Widget>[
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
            Text(IntlUtil.getString(context, Ids.validityPeriod),
                style: TextStyle(color: Color(0xFF122634))),
            SizedBox(
              width: 10.0,
            ),
            Text(skills[index]['begin_date'],
                style: TextStyle(color: Color(0xFFACACAC))),
            Text(' - ', style: TextStyle(color: Color(0xFFACACAC))),
            Text(skills[index]['end_date'],
                style: TextStyle(color: Color(0xFFACACAC))),
            SizedBox(
              width: 100.0,
            ),
            Container(
              width: 24,
              height: 24,
              padding: EdgeInsets.all(0),
              // action button
              child: Image.asset(skills[index]['status'] == 1
                  ? 'assets/images/ic_status_enable.png'
                  : 'assets/images/ic_status_disable.png'),
            ),
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
            Text(used, style: TextStyle(color: Color(0xFFACACAC))),
            Text('/', style: TextStyle(color: Color(0xFFACACAC))),
            Text(total, style: TextStyle(color: Color(0xFFACACAC))),
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
            Text(IntlUtil.getString(context, Ids.purchaseDate),
                style: TextStyle(color: Color(0xFF122634))),
            SizedBox(
              width: 10.0,
            ),
            Text(skills[index]['order_time'],
                style: TextStyle(color: Color(0xFFACACAC))),
          ],
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    print('${widget.item} dispose');
  }
}

class TabItemView extends StatefulWidget {
  final item;

  TabItemView({Key key, this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TarItemState();
}
