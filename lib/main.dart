import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:konnect/HomeFragment.dart';
import 'package:konnect/LoginFragment.dart';
import 'package:konnect/theme/app_theme.dart';

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
      title: 'Konnect',
      theme: AppTheme().lightTheme,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Events", Icons.event),
    new DrawerItem("Exit", Icons.exit_to_app)
  ];

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    var drawerOptions = new List<Widget>();
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("User"),
                accountEmail: Text('user@gmail.com')),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeFragment();
      case 1:
        return LoginFragment();
      default:
        return Center(
          child: Text("Error"),
        );
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }
}

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}
