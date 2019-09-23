import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:konnect/home/HomeFragment.dart';
import 'package:konnect/LoginFragment.dart';
import 'package:konnect/TabPage.dart';
import 'package:konnect/TextField.dart';
import 'package:konnect/theme/app_theme.dart';
import 'package:konnect/utils/SpUtil.dart';

import 'ForgetPassWordPage.dart';
import 'RegisterPage.dart';
import 'common/Global.dart';
import 'contact/ContactUsFragment.dart';
import 'DevicesFragment.dart';
import 'NewsFragment.dart';
import 'contact/ServiceLocator.dart';
import 'TutorialFragment.dart';
import 'pack/PackageForSale.dart';
import 'res/strings.dart';

void main() {
// 注册服务
  setupLocator();
  setLocalizedValues(localizedValues);

  _initAsync();

// 运行主界面
  runApp(MyApp());
}

void _initAsync() async {
  await SpUtil.getInstance();
  Global.init();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konnect',
      theme: AppTheme().lightTheme,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        CustomLocalizations.delegate
      ],
      supportedLocales: CustomLocalizations.supportedLocales,
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        //静态路由,无法传参
        'Register': (_) => RegisterPage(),
        'ForgetPW': (_) => ForgetPassWordPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final drawerItems = [
      DrawerItem(IntlUtil.getString(context, Ids.menuHome), Icons.home),
      DrawerItem(IntlUtil.getString(context, Ids.menuLogin), Icons.input),
      DrawerItem(IntlUtil.getString(context, Ids.menuTutorial),
          Icons.play_circle_outline),
      DrawerItem(IntlUtil.getString(context, Ids.menuBuy), Icons.payment),
      DrawerItem(
          IntlUtil.getString(context, Ids.menuPackage), Icons.present_to_all),
      DrawerItem(IntlUtil.getString(context, Ids.menuDevice), Icons.devices),
      //5
      DrawerItem(IntlUtil.getString(context, Ids.menuNews),
          Icons.notifications_paused),
      DrawerItem(
          IntlUtil.getString(context, Ids.menuContact), Icons.contact_phone),
      DrawerItem(
          IntlUtil.getString(context, Ids.menuLogout), Icons.exit_to_app),
    ];

    var drawerOptions = List<Widget>();
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
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
        title: Text(drawerItems[_selectedDrawerIndex].title),
        actions: <Widget>[
          IconButton(
            // action button
            icon: Icon(Icons.directions_car),
            onPressed: () {}, //右上角按键响应
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                margin: EdgeInsets.all(0),
                currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        new AssetImage("assets/images/ic_nuu.png")),
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
