import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
        ),
        drawer: new Drawer(
          child: new ListView(
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
          ),
        ),
        body: Center(
          child: Text("hello flutter"),
        ));
  }
}
