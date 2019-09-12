/*
 * author: Created by 李卓原 on 2018/10/18.
 * email: zhuoyuan93@gmail.com
 *
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:konnect/utils/HttpUtil.dart';

import 'config/AppConfig.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
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

  AsyncMemoizer _memoizer = AsyncMemoizer();

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
    return _memoizer.runOnce(() async {
      FormData formData = new FormData.from({
        "deviceSn": "354243070634959",
      });

      return await HttpUtil().post(AppConfig.BUY_PACKAGE, data: formData);
    });
  }

  Future _refreshData() async {
    setState(() {
      _memoizer = AsyncMemoizer();
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
    return Column(children: <Widget>[
      Text(skills[index]['package_name']),
      Text(skills[index]['begin_date']),
      Text(skills[index]['end_date']),
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
