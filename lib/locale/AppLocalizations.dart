import 'dart:ui';

import 'package:flutter/cupertino.dart';

class DemoLocalizations {
  final Locale locale;

  DemoLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'menu_home': 'Home',
      'menu_news': 'News',
      'menu_tutorial': 'Tutorial',
      'menu_buy': 'Buy Package',
      'menu_package': 'My Package',
      'menu_device': 'My Device',
      'menu_login': 'Login',
      'menu_contact': 'Contact Us<',
      'menu_logout': 'Logout',
    },
    'zh': {
      'menu_home': '主页',
      'menu_news': '新闻',
      'menu_tutorial': '教程',
      'menu_buy': '购买套餐',
      'menu_package': '流量包',
      'menu_device': '我的设备',
      'menu_login': '登录',
      'menu_contact': '联系我们',
      'menu_logout': '注销',
    }
  };

  get home {
    return _localizedValues[locale.languageCode]['menu_home'];
  }

  get news {
    return _localizedValues[locale.languageCode]['menu_news'];
  }

  get tutorial {
    return _localizedValues[locale.languageCode]['menu_tutorial'];
  }

  get buy {
    return _localizedValues[locale.languageCode]['menu_buy'];
  }

  get package {
    return _localizedValues[locale.languageCode]['menu_package'];
  }

  get device {
    return _localizedValues[locale.languageCode]['menu_device'];
  }

  get login {
    return _localizedValues[locale.languageCode]['menu_login'];
  }

  get contact {
    return _localizedValues[locale.languageCode]['menu_contact'];
  }

  get logout {
    return _localizedValues[locale.languageCode]['menu_logout'];
  }

  //此处
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of(context, DemoLocalizations);
  }
}
