class AppConfig {
  static const String HOST = "http://119.23.74.49:8899"; //开发服务器
// final String HOST = "https://192.168.137.1:8899";//开发服务器 https

  static const String DEVICE_INFO = "http://192.168.43.1:8088/info"; //获取设备状态信息
// final String DEVICE_INFO = "http://192.168.44.1:8088/info";//获取设备状态信息

  static String getHost() {
    return HOST;
  }

//////////////////// not need login ///////////////////

  /*
   * 注册账号 ,not need login
   */

  static String REGISTER = getHost() + "/register";

  /*
   * 用户登录 ,not need login
   */

  static String LOGIN = getHost() + "/login";

  /*
   * 指定时间区间内的流量使用情况,  not need login
   */

  static String DETAIL_PERIOD = getHost() + "/api/period";

  /*
   * 当天流量的使用情况 , not need login
   */

  static String DETAIL_TODAY = getHost() + "/api/detail";

  /*
   * 支付历史 ,need login
   */

  static String PAY_HISTORY = getHost() + "/api/pay/history";

  /*
   * 获取新闻列表 ,not need login
   */

  static String NEWS = getHost() + "/api/news";

  /*
   * 查询可购买的流量包 ,not need login
   */

  static String BUY_PACKAGE = getHost() + "/api/package";

  /*
   * 查询可购买的流量包 ,not need login
   */

  static String PACKAGE_FOR_SALE = getHost() + "/api/sale";

  /*
   * 忘记密码 ,not need login
   */

  static String FORGET_PASSWORD = getHost() + "/api/forget/password";

  /*
   * 设置wifi的账号密码 ,not need login
   */

  static String SETTING_WIFI = getHost() + "/api/setting";

  ///////////////////// need login ///////////////////////

  /*
   * 请求流量包订单 ,need login
   */

  static String REQ_ORDER = getHost() + "/api/order";

  /*
   * 确认PayPal payment id  ,need login
   */

  static String CHECK_PAY = getHost() + "/api/pay";
}
