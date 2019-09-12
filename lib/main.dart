import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:konnect/HomeFragment.dart';
import 'package:konnect/LoginFragment.dart';
import 'package:konnect/tab_page.dart';
import 'package:konnect/textField.dart';
import 'package:konnect/theme/app_theme.dart';

import 'BasicAppBarSample.dart';
import 'contact/ContactUsFragment.dart';
import 'DevicesFragment.dart';
import 'NewsFragment.dart';
import 'contact/ServiceLocator.dart';
import 'TutorialFragment.dart';
import 'pack/PackageForSale.dart';

void main() {
// 注册服务
  setupLocator();
// 运行主界面
  runApp(MyApp());
}

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
    DrawerItem("Home", Icons.home),
    DrawerItem("Login", Icons.input),
    DrawerItem("Tutorial", Icons.play_circle_outline),
    DrawerItem("Buy Package", Icons.payment),
    DrawerItem("My Package", Icons.present_to_all),
    DrawerItem("My Device", Icons.devices), //5
    DrawerItem("News", Icons.notifications_paused),
    DrawerItem("Contact Us", Icons.contact_phone),
    DrawerItem("Logout", Icons.exit_to_app),
  ];

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    var drawerOptions = List<Widget>();
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        //contentPadding: EdgeInsets.all(0),
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        dense: true,
        onTap: () => _onSelectItem(i),
      ));

      if (i == 5) {
        drawerOptions.add(Divider());

        drawerOptions.add(
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Text("设备信息"),
              ],
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drawerItems[_selectedDrawerIndex].title),
        actions: <Widget>[
          IconButton(
            // action button
            icon: Icon(choices[0].icon),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                margin: EdgeInsets.all(0),
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
      case 2:
        return TutorialFragment();
      case 3:
        return TextFieldAndCheckPage();
      case 4:
        return TabPage();
      case 5:
        return DevicesFragment();
      case 6:
        return NewsFragment();
      case 7:
        return ContactUsFragment();
      default:
        return PackageForSale();
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
