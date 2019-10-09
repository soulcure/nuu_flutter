class AppConfig {
  static const String HOST = "http://119.23.74.49:8899"; //开发服务器
  //static const String HOST = "https://192.168.137.1:8899";//开发服务器 https

  static const String DEVICE_INFO = "http://192.168.43.1:8088/info"; //获取设备状态信息
  //static const String DEVICE_INFO = "http://192.168.44.1:8088/info";//获取设备状态信息

//////////////////// not need login ///////////////////

  /*
   * 注册账号 ,not need login
   */
  static const String REGISTER = HOST + "/register";

  /*
   * 用户登录 ,not need login
   */
  static const String LOGIN = HOST + "/login";

  /*
   * 指定时间区间内的流量使用情况,  not need login
   */
  static const String DETAIL_PERIOD = HOST + "/api/period";

  /*
   * 当天流量的使用情况 , not need login
   */
  static const String DETAIL_TODAY = HOST + "/api/detail";

  /*
   * 支付历史 ,need login
   */
  static const String PAY_HISTORY = HOST + "/api/pay/history";

  /*
   * 获取新闻列表 ,not need login
   */
  static const String NEWS = HOST + "/api/news";

  /*
   * 查询可购买的流量包 ,not need login
   */
  static const String BUY_PACKAGE = HOST + "/api/package";

  /*
   * 查询可购买的流量包 ,not need login
   */
  static const String PACKAGE_FOR_SALE = HOST + "/api/sale";

  /*
   * 忘记密码 ,not need login
   */
  static const String FORGET_PASSWORD = HOST + "/api/forget/password";

  /*
   * 设置wifi的账号密码 ,not need login
   */
  static const String SETTING_WIFI = HOST + "/api/setting";

///////////////////// need login ///////////////////////

  /*
   * 请求流量包订单 ,need login
   */
  static const String REQ_ORDER = HOST + "/api/order";

  /*
   * 确认PayPal payment id  ,need login
   */
  static const String CHECK_PAY = HOST + "/api/pay";
}
