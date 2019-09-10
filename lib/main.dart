import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:konnect/theme/app_theme.dart';
import 'package:toast/toast.dart';

import 'home_page.dart';
import 'locale/translations_delegate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //列表中的元素是生成本地化值集合的工厂
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        //为Material Components库提供了本地化的字符串和其他值
        GlobalMaterialLocalizations.delegate,
        //定义widget默认的文本方向，从左到右或从右到左
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('zh', 'CN'), // chinese
        // ... other locales the app supports
      ],
      // ...

      title: 'Flutter Demo',
      theme: AppTheme().lightTheme,
      home: MainDrawerPage(),
    );
  }
}

class MainDrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      drawer: Drawer(child: NormalList()),
      body: Center(child: HomePage()),
    );
  }
}

class NormalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.green, Colors.lightGreen])),
            child: Text("hello drawer!",
                style: TextStyle(color: Colors.white, fontSize: 18.0))),
        ListTile(
            leading: new Icon(Icons.list),
            title: new Text("主页"),
            onTap: () {
              //按钮点击事件
              Toast.show("主页", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            }),
        ListTile(
            leading: new Icon(Icons.list),
            title: new Text("登录"),
            onTap: () {
              //按钮点击事件
              Toast.show("登录", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            }),
        ListTile(
            leading: new Icon(Icons.list),
            title: Text("教程"),
            onTap: () {
              //按钮点击事件
              Toast.show("教程", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            }),
        ListTile(
            leading: new Icon(Icons.list),
            title: Text("购买套餐"),
            onTap: () {
              //按钮点击事件
              Toast.show("购买套餐", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            }),
        ListTile(
            leading: new Icon(Icons.list),
            title: Text("我的设备"),
            onTap: () {
              //按钮点击事件
              Toast.show("我的设备", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            }),
        ListTile(
            leading: new Icon(Icons.list),
            title: new Text("新闻"),
            onTap: () {
              //按钮点击事件
              Toast.show("新闻", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            }),
        ListTile(
            leading: new Icon(Icons.list),
            title: Text("联系我们"),
            onTap: () {
              //按钮点击事件
              Toast.show("联系我们", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            }),
        ListTile(
            leading: new Icon(Icons.list),
            title: Text("注销"),
            onTap: () {
              //按钮点击事件
              Toast.show("注销", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            }),
      ],
    );
  }
}
