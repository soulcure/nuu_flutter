import 'package:konnect/utils/SpUtil.dart';

import '../model/Profile.dart';

class Global {
  static Profile profile = Profile();

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    Map map = SpUtil.getObject("profile");
    if (map != null) {
      profile = Profile.fromJson(map);
      //var test = profile.username;
      print('init res profile.username: $profile.username');
    } else {
      print('not login');
    }
  }

  // 持久化Profile信息
  static saveProfile() => SpUtil.putObject("profile", profile);
}
