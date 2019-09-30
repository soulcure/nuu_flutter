import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:konnect/home/HomeFragment.dart';
import 'package:konnect/LoginFragment.dart';
import 'package:konnect/pack/MyPackageFragment.dart';
import 'package:konnect/buy/BuyPackageFragment.dart';
import 'package:konnect/res/colors.dart';
import 'package:konnect/theme/app_theme.dart';
import 'package:konnect/utils/SpUtil.dart';
import 'package:toast/toast.dart';

import 'ForgetPassWordPage.dart';
import 'RegisterPage.dart';
import 'common/Global.dart';
import 'contact/ContactUsFragment.dart';
import 'device/DevicesFragment.dart';
import 'NewsFragment.dart';
import 'contact/ServiceLocator.dart';
import 'TutorialFragment.dart';
import 'res/strings.dart';

void main() async {
// 注册服务
  setupLocator();
  setLocalizedValues(localizedValues);
// 运行主界面
  runApp(MyApp());

  await FlutterStatusbarcolor.setStatusBarColor(
      Colours.colorPrimaryDark); //设置状态栏颜色
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true); //设置状态栏文字和图标颜色
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
  int actions = 0;

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
          getActions(),
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

  getActions() {
    String url = '';
    double op = 1;
    if (actions == 0) {
      url = 'assets/images/ic_buy.png';
      op = 1;
    } else if (actions == 1) {
      url = 'assets/images/ic_history.png';
      op = 1;
    } else {
      url = '';
      op = 0.0;
    }

    return Opacity(
        opacity: op,
        child: IconButton(
          // action button
          icon: Image.asset(
            url,
            width: 20,
            height: 20,
          ),
          onPressed: () {
            if (actions == 0) {
              Toast.show('buy', context);
            } else if (actions == 1) {
              Toast.show('history', context);
            }
          }, //右上角按键响应
        ));
  }

  _onSelectItem(int index) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(); // close the drawer
    }

    if (isLogin && index == 7) {
      loginOut();
    } else {
      setState(() {
        _selectedDrawerIndex = index;
        if (index <= 1) {
          actions = 0;
        } else if (index <= 3) {
          actions = 1;
        } else {
          actions = 2;
        }
      });
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
                Text(IntlUtil.getString(context, Ids.logoutMsg)),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(IntlUtil.getString(context, Ids.cancel)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(IntlUtil.getString(context, Ids.confirm)),
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
      isLogin = Global.isLogin;
      _onSelectItem(val);
    });
  }
}

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}
