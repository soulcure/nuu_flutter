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
        drawer: Drawer(child: NormalList()),
        body: Center(
          child: GridView.count(
            //横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
            crossAxisCount: 2,
            //子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度
            childAspectRatio: 0.8,
            //主轴方向的间距。
            mainAxisSpacing: 10,
            //横轴方向子元素的间距。
            crossAxisSpacing: 10,
            children: <Widget>[
              BatteryStatusCardWidget(),
              TodayUsedCardWidget(),
              NetworkStatusCardWidget(),
              ConnectCardWidget(),
            ],
          ),
        ));
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

class BatteryStatusCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      //z轴的高度，设置card的阴影
      elevation: 20.0,
      //设置shape，这里设置成了R角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: getChild(),
    );
  }

  getChild() {
    return Container(
      color: Colors.grey,
      width: 200,
      height: 150,
      alignment: Alignment.center,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          ListTile(title: new Text("电量")),
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.green, Colors.lightGreen])),
              child: Text("hello drawer!",
                  style: TextStyle(color: Colors.white, fontSize: 18.0))),
        ],
      ),
    );
  }
}

class TodayUsedCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      //z轴的高度，设置card的阴影
      elevation: 20.0,
      //设置shape，这里设置成了R角
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: getChild(),
    );
  }

  getChild() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: CustomPaint(
          child: Center(child: Text((30).round().toString())),
          painter: CircleProgressBarPainter(30)),
    );
  }
}

class NetworkStatusCardWidget extends StatelessWidget {
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
      child: getChild(),
    );
  }

  getChild() {
    return Container(
      width: 200,
      height: 150,
      alignment: Alignment.center,
      child: ListView(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
        children: <Widget>[
          Image(
            width: 100,
            height: 76,
            fit: BoxFit.contain,
            image: AssetImage("assets/images/signal_0.png"),
          ),
          Text("网络状态:",
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

class ConnectCardWidget extends StatelessWidget {
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
      child: getChild(),
    );
  }

  getChild() {
    return Container(
      width: 200,
      height: 150,
      alignment: Alignment.center,
      child: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Image(
            width: 100,
            height: 100,
            image: AssetImage("assets/images/connection_icon.png"),
          ),
          Text("连接设备:",
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

class CircleProgressBarPainter extends CustomPainter {
  Paint _paintBackground;
  Paint _paintFore;
  final double pi = 3.1415926;
  var progress;

  CircleProgressBarPainter(this.progress) {
    _paintBackground = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
    _paintFore = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        _paintBackground);
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    //canvas.drawArc(rect, 0.0, progress * 3.14 / 180, false, _paintFore);
    canvas.drawArc(rect, 0.0, 2 * pi * progress / 100, false, _paintFore);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
