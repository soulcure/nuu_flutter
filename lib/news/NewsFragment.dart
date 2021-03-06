import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:konnect/config/AppConfig.dart';
import 'package:konnect/http/HttpUtil.dart';
import 'package:konnect/res/styles.dart';

class NewsFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewState();
}

class _NewState extends State<NewsFragment> {
  AsyncMemoizer _asyncMem = AsyncMemoizer();

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
    return _asyncMem.runOnce(() async {
      return await HttpUtil.get(AppConfig.NEWS);
    });
  }

  Future _refreshData() async {
    setState(() {
      _asyncMem = AsyncMemoizer();
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
    List movies = snapshot.data['data'];
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

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 1.0),
              child: Text(skills[index]['title'], style: TextStyles.newsTitle),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(skills[index]['Time'], style: TextStyles.newsTime),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child:
                  Text(skills[index]['Content'], style: TextStyles.newsContent),
            ),
          ]),
    );
  }
}
