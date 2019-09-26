import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:konnect/home/HomeFragment.dart';
import 'package:konnect/LoginFragment.dart';
import 'package:konnect/pack/MyPackageFragment.dart';
import 'package:konnect/BuyPackageFragment.dart';
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
import 'res/strings.dart';

void main() {
// 注册服务
  setupLocator();
  setLocalizedValues(localizedValues);
// 运行主界面
  runApp(MyApp());
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

  bool isLogin = false;

  void _initAsync() async {
    await SpUtil.getInstance();
    Global.init();
    setState(() => isLogin = Global.isLogin);
  }

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  @override
  Widget build(BuildContext context) {
    String user = Global.profile.username;

    if (user == null) {
      user = "User";
    }
    print('user: $user');

    String email = Global.profile.email;
    if (email == null) {
      email = "user@gmail.com";
    }
    List<DrawerItem> drawerItems = [];
    if (isLogin) {
      drawerItems = [
        DrawerItem(IntlUtil.getString(context, Ids.menuHome), Icons.home),
        DrawerItem(IntlUtil.getString(context, Ids.menuTutorial),
            Icons.play_circle_outline),
        DrawerItem(IntlUtil.getString(context, Ids.menuBuy), Icons.payment),
        DrawerItem(
            IntlUtil.getString(context, Ids.menuPackage), Icons.present_to_all),
        DrawerItem(IntlUtil.getString(context, Ids.menuDevice), Icons.devices),
        //5
        DrawerItem(IntlUtil.getString(context, Ids.menuNews), Icons.fiber_new),
        DrawerItem(
            IntlUtil.getString(context, Ids.menuContact), Icons.contact_phone),
        DrawerItem(IntlUtil.getString(context, Ids.menuLogout),
            Icons.add_to_home_screen),
      ];
    } else {
      drawerItems = [
        DrawerItem(IntlUtil.getString(context, Ids.menuHome), Icons.home),
        DrawerItem(IntlUtil.getString(context, Ids.menuLogin), Icons.input),
        DrawerItem(IntlUtil.getString(context, Ids.menuTutorial),
            Icons.play_circle_outline),
        DrawerItem(IntlUtil.getString(context, Ids.menuBuy), Icons.payment),
        DrawerItem(
            IntlUtil.getString(context, Ids.menuPackage), Icons.present_to_all),
        DrawerItem(IntlUtil.getString(context, Ids.menuDevice), Icons.devices),
        //5
        DrawerItem(IntlUtil.getString(context, Ids.menuNews), Icons.fiber_new),
        DrawerItem(
            IntlUtil.getString(context, Ids.menuContact), Icons.contact_phone),
      ];
    }

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
                Text(IntlUtil.getString(context, Ids.menuDeviceTitle)),
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
            onPressed: () {
              loginOut();
            }, //右上角按键响应
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
                accountName: Text(user, style: TextStyle(color: Colors.white)),
                accountEmail:
                    Text(email, style: TextStyle(color: Colors.white))),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }

  _getDrawerItemWidget(int pos) {
    if (isLogin) {
      switch (pos) {
        case 0:
          return HomeFragment();
        case 1:
          return TutorialFragment();
        case 2:
          return BuyPackageFragment();
        case 3:
          return MyPackageFragment();
        case 4:
          return DevicesFragment();
        case 5:
          return NewsFragment();
        case 6:
          return ContactUsFragment();
        default:
          return HomeFragment();
      }
    } else {
      switch (pos) {
        case 0:
          return HomeFragment();
        case 1:
          return LoginFragment(callBack: (value) => onChanged(value));
        case 2:
          return TutorialFragment();
        case 3:
          return BuyPackageFragment();
        case 4:
          return MyPackageFragment();
        case 5:
          return DevicesFragment();
        case 6:
          return NewsFragment();
        case 7:
          return ContactUsFragment();
        default:
          return HomeFragment();
      }
    }
  }

  _onSelectItem(int index) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(); // close the drawer
    }

    if (isLogin && index == 7) {
      loginOut();
    } else {
      setState(() => _selectedDrawerIndex = index);
    }
  }

  Future<void> loginOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('logout you account?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Confirm'),
              onPressed: () {
                Global.clearProfile();
                Navigator.of(context).pop();
                setState(() => isLogin = Global.isLogin);
              },
            ),
          ],
        );
      },
    );
  }

  void onChanged(val) {
    setState(() {
      setState(() => isLogin = Global.isLogin);
      _onSelectItem(val);
    });
  }
}

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}
