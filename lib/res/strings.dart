class Ids {
  //common
  static const String confirm = 'confirm';
  static const String cancel = 'cancel';
  static const String submit = 'submit';
  static const String exitTips = 'exit_tips';

  //home drawer
  static const String menuHome = 'menu_home';
  static const String menuNews = 'menu_news';
  static const String menuTutorial = 'menu_tutorial';
  static const String menuBuy = 'menu_buy';
  static const String menuPackage = 'menuPackage';
  static const String menuDevice = 'menu_device';
  static const String menuLogin = 'menu_login';
  static const String menuContact = 'menu_contact';
  static const String menuLogout = 'menu_logout';
  static const String menuDeviceTitle = 'menu_device_title';

  //home fragment
  static const String electricity = 'electricity';
  static const String todayUsed = 'today_used';
  static const String networkStatus = 'network_status';
  static const String connectCount = 'connect_count';

  //login fragment
  static const String promptEmail = 'prompt_email';
  static const String promptPassword = 'prompt_password';
  static const String actionSignIn = 'action_sign_in';
  static const String actionSignInShort = 'action_sign_in_short';
  static const String actionRegister = 'action_register';
  static const String forgetPW = 'forget_password';
  static const String noAccount = 'no_account';
  static const String signUpNow = 'sign up now';
  static const String lostPassword = 'lost_password';
  static const String lostEmail = 'lost_email';
  static const String logoutMsg = 'logout_msg';
  static const String welcome = 'welcome';
  static const String invalidUsername = 'invalid_username';
  static const String invalidEmail = 'invalid_email';
  static const String invalidPassword = 'invalid_password';
  static const String checkPasswordError = 'check_password_error';
  static const String loginFailed = 'login_failed';

  //register fragment
  static const String userName = 'user_name';
  static const String eMail = 'email';
  static const String password = 'password';
  static const String passwordCheck = 'password_check';

  //my pack fragment
  static const String packageType = 'package_type';
  static const String validityPeriod = 'validity_period';
  static const String data = 'data';
  static const String purchaseDate = 'purchase_date';
  static const String buyPackageSuccess = 'buy_package_success';

  //package info
  static const String packageInfo = 'package_info';
  static const String buy = 'buy';

  //contact us
  static const String contact = 'contact';
  static const String contactAddress = 'contact_address';
  static const String address = 'address';

  //devices fragment
  static const String choiceDevice = 'choice_device';
  static const String setting = 'setting';
  static const String buyPackage = 'buy_package';
  static const String connectDevices = 'connect_devices';

  //buy package fragment
  static const String buyPackageTitle = 'buy_package_title';
  static const String inputDevice = 'input_device';
  static const String deviceSelect = 'device_select';
  static const String or = 'or';
  static const String scanQR = 'scan_qr';
  static const String needCameraPermissions = 'need_camera_permissions';
  static const String buyPackageInfo = 'buy_package_info';
  static const String purchaseHistory = 'purchase_history';
  static const String inputSN = 'input_sn';
  static const String scanError = 'scan_error';
  static const String canNotScanned = 'can_not_scanned';
  static const String inputErrorSN = 'input_error_sn';

  //package for sale
  static const String packageTitle = 'package_title';
  static const String packageName = 'package_name';
  static const String price = 'price';
  static const String priceValue = 'price_value';
  static const String cycleTime = 'cycle_time';
  static const String cycleTimeValue = 'cycle_time_value';
  static const String useCountry = 'use_country';
  static const String chooseCountry = 'choose_country';
  static const String all = 'all';
  static const String needLogin = 'need_login';
  static const String expired = 'expired';
  static const String CNY = 'CNY';
  static const String USD = 'USD';
  static const String HKD = 'HKD';
  static const String JPY = 'JPY';
  static const String EUR = 'EUR';
  static const String day = 'day';
  static const String month = 'month';
  static const String year = 'year';
  static const String hour = 'hour';

  //pay history
  static const String payHistory = 'pay_history';
  static const String count = 'count';
  static const String currency = 'currency';
  static const String buyTime = 'buy_time';

  //used details
  static const String useDetails = 'use_details';
  static const String startDate = 'start_date';
  static const String endDate = 'end_date';
  static const String query = 'query';

  //package info
  static const String effectiveMode = 'effective_mode';
  static const String effectiveDate = 'effective_date';
  static const String purchaseQuantity = 'purchase_quantity';
  static const String pay = 'pay';
  static const String takeEffectTogether = 'Take_effect_together';
  static const String takeEffectOneByOne = 'Take_effect_one_by_one';
}

Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      //common
      Ids.confirm: 'Confirm',
      Ids.cancel: 'Cancel',
      Ids.submit: 'submit',
      Ids.exitTips: 'Press again to exit',

      //home drawer
      Ids.menuHome: 'Home',
      Ids.menuNews: 'News',
      Ids.menuTutorial: 'Tutorial',
      Ids.menuBuy: 'Buy Package',
      Ids.menuPackage: 'My Package',
      Ids.menuDevice: 'Devices',
      Ids.menuLogin: 'Login',
      Ids.menuContact: 'Contact',
      Ids.menuLogout: 'Logout',
      Ids.menuDeviceTitle: 'Device information',

      //home fragment
      Ids.electricity: 'Electricity',
      Ids.todayUsed: 'Today Used',
      Ids.networkStatus: 'Network Status',
      Ids.connectCount: 'Connecting device:%\$0\$s',

      //login fragment
      Ids.promptEmail: 'Email address or Username',
      Ids.promptPassword: 'Password',
      Ids.actionSignIn: 'Login',
      Ids.actionSignInShort: 'Sign in',
      Ids.actionRegister: 'Register',
      Ids.forgetPW: 'Forget Password',
      Ids.noAccount: 'no account?',
      Ids.signUpNow: 'Sign up now',
      Ids.lostPassword: 'Lost you password?',
      Ids.lostEmail: 'Lost you email?',
      Ids.logoutMsg: 'logout you account?',
      Ids.welcome: 'Welcome !',
      Ids.invalidUsername: 'Not a valid username',
      Ids.invalidEmail: 'Not a valid email',
      Ids.invalidPassword: 'Password must be >5 characters',
      Ids.checkPasswordError: 'Inconsistent password entered twice',
      Ids.loginFailed: 'Login failed',

      //register fragment
      Ids.userName: 'Display Name*',
      Ids.eMail: 'Email*',
      Ids.password: 'password*',
      Ids.passwordCheck: 'password check*',

      //my pack fragment
      Ids.packageType: 'Package Type:',
      Ids.validityPeriod: 'Validity Period:',
      Ids.data: 'Date:',
      Ids.purchaseDate: 'Purchase Date:',
      Ids.buyPackageSuccess: 'DeviceSn:%\$0\$s buy %\$1\$s package success',

      //package info
      Ids.packageInfo: 'package information',
      Ids.buy: 'buy',

      //contact us
      Ids.contact: 'contact',
      Ids.contactAddress: 'contactAddress',
      Ids.address: '16F,CE0 Tower,77 Wing Hong St.Kwoloon,HongKong',

      //devices fragment
      Ids.choiceDevice: 'Please select a device',
      Ids.setting: 'Setting',
      Ids.buyPackage: 'Buy Package',
      Ids.connectDevices: 'Connected device',

      //buy package fragment
      Ids.buyPackageTitle:
          'To top up your device,please input your device SN or scan the QR code printed on the back of the device to explore available packages.',
      Ids.inputDevice: 'Input Your Device SN',
      Ids.deviceSelect: 'Select Your Device SN For Package',
      Ids.or: 'Or',
      Ids.scanQR: 'Scan Your QR code',
      Ids.needCameraPermissions: 'Need to use camera permissions',
      Ids.buyPackageInfo: 'buy',
      Ids.purchaseHistory: 'Purchase History',
      Ids.inputSN: 'must input device SN',
      Ids.scanError: 'Scan Error',
      Ids.canNotScanned: 'QR Code could not be scanned',
      Ids.inputErrorSN: 'Device SN input error',

      //package for sale
      Ids.packageTitle: 'package info',
      Ids.packageTitle: 'package title',
      Ids.packageName: 'Package Name:',
      Ids.price: 'Price:',
      Ids.priceValue: '%\$0\$s %\$1\$s',
      Ids.data: 'Data:',
      Ids.cycleTime: 'Cycle Time:',
      Ids.cycleTimeValue: '%\$0\$s %\$1\$s',
      Ids.useCountry: 'Available country:',
      Ids.chooseCountry: 'Choose a country to use :',
      Ids.all: 'all',
      Ids.needLogin:
          'You need to log in to purchase a traffic package, log in now?',
      Ids.expired:
      'Your login information has expired and you need to log in again',
      Ids.CNY: 'CN¥',
      Ids.USD: 'US\$',
      Ids.HKD: 'HKD\$',
      Ids.JPY: 'JPY¥',
      Ids.EUR: '€',
      Ids.day: 'Day',
      Ids.month: 'Month',
      Ids.year: 'Year',
      Ids.hour: 'Hour',

      //pay history
      Ids.payHistory: 'Pay History',
      Ids.count: 'count:',
      Ids.currency: 'currency:',
      Ids.buyTime: 'buy time:',

      //used details
      Ids.useDetails: 'Used data details',
      Ids.startDate: 'Start Date:',
      Ids.endDate: '--End Date:',
      Ids.query: 'query',

      //package info
      Ids.effectiveMode: 'Effective Mode:',
      Ids.effectiveDate: 'Effective Date:',
      Ids.purchaseQuantity: 'Purchase Quantity:',
      Ids.pay: 'pay',
      Ids.takeEffectTogether: 'Take effect together',
      Ids.takeEffectOneByOne: 'Take effect one by one',
    }
  },
  'zh': {
    'CN': {
      //common
      Ids.confirm: '确认',
      Ids.cancel: '取消',
      Ids.submit: '提交',
      Ids.exitTips: '再按一次退出',

      //home drawer
      Ids.menuHome: '主页',
      Ids.menuNews: '新闻',
      Ids.menuTutorial: '教程',
      Ids.menuBuy: '购买套餐',
      Ids.menuPackage: '流量包',
      Ids.menuDevice: '我的设备',
      Ids.menuLogin: '登录',
      Ids.menuContact: '联系我们',
      Ids.menuLogout: '注销',
      Ids.menuDeviceTitle: '设备信息',

      //home fragment
      Ids.electricity: '电量',
      Ids.todayUsed: '今日用量',
      Ids.networkStatus: '网络状况',
      Ids.connectCount: '连接设备：%\$0\$s',

      //login fragment
      Ids.promptEmail: '电子邮件地址或用户名',
      Ids.promptPassword: '密码',
      Ids.actionSignIn: '登录',
      Ids.actionSignInShort: '登录',
      Ids.actionRegister: '注册',
      Ids.forgetPW: '忘记密码',
      Ids.noAccount: '没有账号?',
      Ids.signUpNow: '立即注册',
      Ids.lostPassword: '忘了你的密码?',
      Ids.lostEmail: '忘了你的电子邮箱?',
      Ids.logoutMsg: '退出您的帐户?',
      Ids.welcome: '欢迎 !',
      Ids.invalidUsername: '不是有效的用户名',
      Ids.invalidEmail: '不是有效的电子邮箱',
      Ids.invalidPassword: '密码必须多于5个字符',
      Ids.checkPasswordError: '两次输入的密码不一致',
      Ids.loginFailed: '登录失败',

      //register fragment
      Ids.userName: '用户名*',
      Ids.eMail: '电子邮箱*',
      Ids.password: '密码*',
      Ids.passwordCheck: '再次确认*',

      //my pack fragment
      Ids.packageType: '流量包类型:',
      Ids.validityPeriod: '有效期:',
      Ids.data: '流量:',
      Ids.purchaseDate: '购买日期:',
      Ids.buyPackageSuccess: '设备:%\$0\$s 购买 %\$1\$s 流量套餐成功',

      //package info
      Ids.packageInfo: '流量包详情',
      Ids.buy: '购买',

      //contact us
      Ids.contact: '联系',
      Ids.contactAddress: '通信地址',
      Ids.address: '香港永康街道77号CE0大厦16楼',

      //devices fragment
      Ids.choiceDevice: '请选择设备',
      Ids.setting: '设置',
      Ids.buyPackage: '购买套餐',
      Ids.connectDevices: '连接的设备',

      //buy package fragment
      Ids.buyPackageTitle: '要为设备充值，请输入您的设备SN或扫描设备背面印刷的二维码,来购买流量包',
      Ids.inputDevice: '输入您的设备SN',
      Ids.deviceSelect: '选择为那个设备购买流量包',
      Ids.or: '或者',
      Ids.scanQR: '扫描设备二维码输入',
      Ids.needCameraPermissions: '需要使用相机权限',
      Ids.buyPackageInfo: '购买',
      Ids.purchaseHistory: '购买历史',
      Ids.inputSN: '必须输入设备SN',
      Ids.scanError: '扫描错误',
      Ids.canNotScanned: '无法扫描二维码',
      Ids.inputErrorSN: '设备SN格式输入错误',

      //package for sale
      Ids.packageTitle: '流量包详情',
      Ids.packageName: '套餐名称:',
      Ids.price: '价格:',
      Ids.priceValue: '%\$0\$s %\$1\$s',
      Ids.data: '流量:',
      Ids.cycleTime: '结算周期:',
      Ids.cycleTimeValue: '%\$0\$s %\$1\$s',
      Ids.useCountry: '可用的国家:',
      Ids.chooseCountry: '选择使用国家:',
      Ids.all: '全部',
      Ids.needLogin: '你需要登录才能购买流量包，现在登录？',
      Ids.expired: '你的登录信息已经过期，需要重新登录',
      Ids.CNY: 'CN¥',
      Ids.USD: 'US\$',
      Ids.HKD: 'HKD\$',
      Ids.JPY: 'JPY¥',
      Ids.EUR: '€',
      Ids.day: '日',
      Ids.month: '月',
      Ids.year: '年',
      Ids.hour: '小时',

      //pay history
      Ids.payHistory: '支付历史',
      Ids.count: '计数:',
      Ids.currency: '货币:',
      Ids.buyTime: '购买日期:',

      //used details
      Ids.useDetails: '使用过的数据明细',
      Ids.startDate: '开始日期:',
      Ids.endDate: '--结束日期:',
      Ids.query: '查询',

      //package info
      Ids.effectiveMode: '有效模式:',
      Ids.effectiveDate: '生效日期:',
      Ids.purchaseQuantity: '购买数量:',
      Ids.pay: '支付',
      Ids.takeEffectTogether: '一起生效',
      Ids.takeEffectOneByOne: '逐个生效',
    },
    'HK': {
      //common
      Ids.confirm: '确认',
      Ids.cancel: '取消',
      Ids.submit: '提交',
      Ids.exitTips: '再按一次退出',

      //home drawer
      Ids.menuHome: '主頁',
      Ids.menuNews: '新聞',
      Ids.menuTutorial: '教程',
      Ids.menuBuy: '購買套餐',
      Ids.menuPackage: '流量包',
      Ids.menuDevice: '我的設備',
      Ids.menuLogin: '登錄',
      Ids.menuContact: '聯系我們',
      Ids.menuLogout: '註銷',
      Ids.menuDeviceTitle: '設備信息',

      //home fragment
      Ids.electricity: '電量',
      Ids.todayUsed: '今日用量',
      Ids.networkStatus: '網絡狀況',
      Ids.connectCount: '連接設備:%\$0\$s',

      //login fragment
      Ids.promptEmail: '電子郵件地址或用戶名',
      Ids.promptPassword: '密碼',
      Ids.actionSignIn: '登錄',
      Ids.actionSignInShort: '登錄',
      Ids.actionRegister: '註冊',
      Ids.forgetPW: '忘记密碼',
      Ids.noAccount: '没有帳戶?',
      Ids.signUpNow: '立即註冊',
      Ids.lostPassword: '忘了你的密碼?',
      Ids.lostEmail: '忘了你的電子郵箱?',
      Ids.logoutMsg: '退出您的帳戶?',
      Ids.welcome: '歡迎 !',
      Ids.invalidUsername: '不是有效的用戶名',
      Ids.invalidEmail: '不是有效的電子郵箱',
      Ids.invalidPassword: '密碼必須多於5個字符',
      Ids.checkPasswordError: '兩次輸入的密碼不一致',
      Ids.loginFailed: '登錄失敗',

      //register fragment
      Ids.userName: '用户名*',
      Ids.eMail: '電子郵箱*',
      Ids.password: '密碼*',
      Ids.passwordCheck: '再次確認*',

      //my pack fragment
      Ids.packageType: '流量包類型:',
      Ids.validityPeriod: '有效期:',
      Ids.data: '流量:',
      Ids.purchaseDate: '購買日期:',
      Ids.buyPackageSuccess: '設備:%\$0\$s 購買 %\$1\$s 流量套餐成功',

      //package info
      Ids.packageInfo: '流量包詳情',
      Ids.buy: '購買',

      //contact us
      Ids.contact: '聯繫',
      Ids.contactAddress: '通信地址',
      Ids.address: '香港永康街道77號CE0大廈16樓',

      //devices fragment
      Ids.choiceDevice: '請選擇設備',
      Ids.setting: '設置',
      Ids.buyPackage: '購買套餐',
      Ids.connectDevices: '连接的设备',

      //buy package fragment
      Ids.buyPackageTitle: '要為設備充值，請輸入您的設備SN或掃描設備背面印刷的二維碼,來購買流量包',
      Ids.inputDevice: '輸入您的設備SN',
      Ids.deviceSelect: '選擇為那個設備購買流量包',
      Ids.or: '或者',
      Ids.scanQR: '掃描您的二維碼',
      Ids.needCameraPermissions: '需要使用相機權限',
      Ids.buyPackageInfo: '購買',
      Ids.purchaseHistory: '購買歷史',
      Ids.inputSN: '必須輸入設備SN',
      Ids.scanError: '掃描錯誤',
      Ids.canNotScanned: '無法掃描二維碼',
      Ids.inputErrorSN: '設備SN格式輸入錯誤',

      //package for sale
      Ids.packageTitle: '流量包詳情',
      Ids.packageName: '套餐名稱:',
      Ids.price: '價格:',
      Ids.priceValue: '%\$0\$s %\$1\$s',
      Ids.data: '流量:',
      Ids.cycleTime: '結算週期:',
      Ids.cycleTimeValue: '%\$0\$s %\$1\$s',
      Ids.useCountry: '可用的國家:',
      Ids.chooseCountry: '選擇使用國家:',
      Ids.all: '全部',
      Ids.needLogin: '你需要登錄才能購買流量包，現在登錄',
      Ids.expired: '你的登錄信息已經過期，需要重新登錄',
      Ids.CNY: 'CN¥',
      Ids.USD: 'US\$',
      Ids.HKD: 'HKD\$',
      Ids.JPY: 'JPY¥',
      Ids.EUR: '€',
      Ids.day: '日',
      Ids.month: '月',
      Ids.year: '年',
      Ids.hour: '小時',

      //pay history
      Ids.payHistory: '支付歷史',
      Ids.count: '計數:',
      Ids.currency: '貨幣:',
      Ids.buyTime: '購買日期:',

      //used details
      Ids.useDetails: '使用過的數據明細',
      Ids.startDate: '開始日期:',
      Ids.endDate: '--結束日期:',
      Ids.query: '查詢',

      //package info
      Ids.effectiveMode: '有效模式:',
      Ids.effectiveDate: '生效日期:',
      Ids.purchaseQuantity: '購買數量:',
      Ids.pay: '支付',
      Ids.takeEffectTogether: '一起生效',
      Ids.takeEffectOneByOne: '逐個生效',
    },
    'TW': {
      //common
      Ids.confirm: '确认',
      Ids.cancel: '取消',
      Ids.submit: '提交',
      Ids.exitTips: '再按一次退出',

      //home drawer
      Ids.menuHome: '主頁',
      Ids.menuNews: '新聞',
      Ids.menuTutorial: '教程',
      Ids.menuBuy: '購買套餐',
      Ids.menuPackage: '流量包',
      Ids.menuDevice: '我的設備',
      Ids.menuLogin: '登錄',
      Ids.menuContact: '聯系我們',
      Ids.menuLogout: '註銷',
      Ids.menuDeviceTitle: '設備信息',

      //home fragment
      Ids.electricity: '電量',
      Ids.todayUsed: '今日用量',
      Ids.networkStatus: '網絡狀況',
      Ids.connectCount: '連接設備:%\$0\$s',

      //login fragment
      Ids.promptEmail: '電子郵件地址或用戶名',
      Ids.promptPassword: '密碼',
      Ids.actionSignIn: '登錄',
      Ids.actionSignInShort: '登錄',
      Ids.actionRegister: '註冊',
      Ids.forgetPW: '忘记密碼',
      Ids.noAccount: '没有帳戶?',
      Ids.signUpNow: '立即註冊',
      Ids.lostPassword: '忘了你的密碼?',
      Ids.lostEmail: '忘了你的電子郵箱?',
      Ids.logoutMsg: '退出您的帳戶?',
      Ids.welcome: '歡迎 !',
      Ids.invalidUsername: '不是有效的用戶名',
      Ids.invalidEmail: '不是有效的電子郵箱',
      Ids.invalidPassword: '密碼必須多於5個字符',
      Ids.checkPasswordError: '兩次輸入的密碼不一致',
      Ids.loginFailed: '登錄失敗',

      //register fragment
      Ids.userName: '用户名*',
      Ids.eMail: '電子郵箱*',
      Ids.password: '密碼*',
      Ids.passwordCheck: '再次確認*',

      //my pack fragment
      Ids.packageType: '流量包類型:',
      Ids.validityPeriod: '有效期:',
      Ids.data: '流量:',
      Ids.purchaseDate: '購買日期:',
      Ids.buyPackageSuccess: '設備:%\$0\$s 購買 %\$1\$s 流量套餐成功',

      //package info
      Ids.packageInfo: '流量包詳情',
      Ids.buy: '購買',

      //contact us
      Ids.contact: '聯繫',
      Ids.contactAddress: '通信地址',
      Ids.address: '香港永康街道77號CE0大廈16樓',

      //devices fragment
      Ids.choiceDevice: '請選擇設備',
      Ids.setting: '設置',
      Ids.buyPackage: '購買套餐',
      Ids.connectDevices: '连接的设备',

      //buy package fragment
      Ids.buyPackageTitle: '要為設備充值，請輸入您的設備SN或掃描設備背面印刷的二維碼,來購買流量包',
      Ids.inputDevice: '輸入您的設備SN',
      Ids.deviceSelect: '選擇為那個設備購買流量包',
      Ids.or: '或者',
      Ids.scanQR: '掃描您的二維碼',
      Ids.needCameraPermissions: '需要使用相機權限',
      Ids.buyPackageInfo: '購買',
      Ids.purchaseHistory: '購買歷史',
      Ids.inputSN: '必須輸入設備SN',
      Ids.scanError: '掃描錯誤',
      Ids.canNotScanned: '無法掃描二維碼',
      Ids.inputErrorSN: '設備SN格式輸入錯誤',

      //package for sale
      Ids.packageTitle: '流量包詳情',
      Ids.packageName: '套餐名稱:',
      Ids.price: '價格:',
      Ids.priceValue: '%\$0\$s %\$1\$s',
      Ids.data: '流量:',
      Ids.cycleTime: '結算週期:',
      Ids.cycleTimeValue: '%\$0\$s %\$1\$s',
      Ids.useCountry: '可用的國家:',
      Ids.chooseCountry: '選擇使用國家:',
      Ids.all: '全部',
      Ids.needLogin: '你需要登錄才能購買流量包，現在登錄',
      Ids.expired: '你的登錄信息已經過期，需要重新登錄',
      Ids.CNY: 'CN¥',
      Ids.USD: 'US\$',
      Ids.HKD: 'HKD\$',
      Ids.JPY: 'JPY¥',
      Ids.EUR: '€',
      Ids.day: '日',
      Ids.month: '月',
      Ids.year: '年',
      Ids.hour: '小時',

      //pay history
      Ids.payHistory: '支付歷史',
      Ids.count: '計數:',
      Ids.currency: '貨幣:',
      Ids.buyTime: '購買日期:',

      //used details
      Ids.useDetails: '使用過的數據明細',
      Ids.startDate: '開始日期:',
      Ids.endDate: '--結束日期:',
      Ids.query: '查詢',

      //package info
      Ids.effectiveMode: '有效模式:',
      Ids.effectiveDate: '生效日期:',
      Ids.purchaseQuantity: '購買數量:',
      Ids.pay: '支付',
      Ids.takeEffectTogether: '一起生效',
      Ids.takeEffectOneByOne: '逐個生效',
    }
  },
  'ja': {
    'JA': {
      //common
      Ids.confirm: '確認する',
      Ids.cancel: 'キャンセル',
      Ids.submit: '提出する',
      Ids.exitTips: 'もう一度押すと終了します',

      //home drawer
      Ids.menuHome: 'ホーム',
      Ids.menuNews: 'ニュース',
      Ids.menuTutorial: 'チュートリアル',
      Ids.menuBuy: 'パッケージを購入',
      Ids.menuPackage: '私のパッケージ',
      Ids.menuDevice: '装置',
      Ids.menuLogin: 'ログインする',
      Ids.menuContact: '接触',
      Ids.menuLogout: 'ログアウト',
      Ids.menuDeviceTitle: 'デバイス情報',

      //home fragment
      Ids.electricity: '電気',
      Ids.todayUsed: '今日使用される',
      Ids.networkStatus: 'ネットワーク状態',
      Ids.connectCount: '接続デバイス：%\$0\$s',

      //login fragment
      Ids.promptEmail: 'メールアドレスまたはユーザーネーム',
      Ids.promptPassword: 'パスワード',
      Ids.actionSignIn: 'ログインする',
      Ids.actionSignInShort: 'サインイン',
      Ids.actionRegister: '登録',
      Ids.forgetPW: 'パスワードを忘れた',
      Ids.noAccount: 'アカウントなし？',
      Ids.signUpNow: '今すぐサインアップ',
      Ids.lostPassword: 'パスワードを忘れましたか？',
      Ids.lostEmail: 'メールを忘れましたか？',
      Ids.logoutMsg: 'アカウントをログアウトしますか？',
      Ids.welcome: 'ようこそ ！',
      Ids.invalidUsername: '有効なユーザー名ではありません',
      Ids.invalidEmail: '有効なメールではありません',
      Ids.invalidPassword: 'パスワードは5文字以上でなければなりません',
      Ids.checkPasswordError: '一貫性のないパスワードが2回入力されました',
      Ids.loginFailed: 'ログインに失敗しました',

      //register fragment
      Ids.userName: '表示名*',
      Ids.eMail: 'Eメール*',
      Ids.password: 'パスワード*',
      Ids.passwordCheck: 'パスワードチェック*',

      //my pack fragment
      Ids.packageType: 'パッケージ型式:',
      Ids.validityPeriod: '有効期間:',
      Ids.data: '日付：',
      Ids.purchaseDate: '購入日：',
      Ids.buyPackageSuccess: 'DeviceSn:%\$0\$s 購入 %\$1\$s パッケージ成功',

      //package info
      Ids.packageInfo: 'パッケージ情報',
      Ids.buy: '購入',

      //contact us
      Ids.contact: '接触',
      Ids.contactAddress: '連絡先住所',
      Ids.address: '16F、CE0 Tower、77 Wing Hong St.Kowloon、香港',

      //devices fragment
      Ids.choiceDevice: 'デバイスを選択してください',
      Ids.setting: 'セッティング',
      Ids.buyPackage: 'パッケージを購入',
      Ids.connectDevices: '接続されたデバイス',

      //buy package fragment
      Ids.buyPackageTitle:
          'デバイスを補充するには、デバイスのSNを入力するか、デバイスの背面に印刷されているQRコードをスキャンして、利用可能なパッケージを調べてください。',
      Ids.inputDevice: '入力してください Device SN',
      Ids.deviceSelect: 'あなたを選択 Device SN パッケージ用',
      Ids.or: 'または',
      Ids.scanQR: 'QRコードをスキャンする',
      Ids.needCameraPermissions: 'カメラの権限を使用する必要があります',
      Ids.buyPackageInfo: '購入',
      Ids.purchaseHistory: '購入履歴',
      Ids.inputSN: '入力する必要があります device SN',
      Ids.scanError: 'スキャンエラー',
      Ids.canNotScanned: 'QRコードをスキャンできませんでした',
      Ids.inputErrorSN: 'Device SN 入力エラー',

      //package for sale
      Ids.packageTitle: 'パッケージ情報',
      Ids.packageTitle: 'パッケージタイトル',
      Ids.packageName: 'パッケージ名：',
      Ids.price: '価格：',
      Ids.priceValue: '%\$0\$s %\$1\$s',
      Ids.data: 'データ：',
      Ids.cycleTime: 'サイクルタイム：',
      Ids.cycleTimeValue: '%\$0\$s %\$1\$s',
      Ids.useCountry: '利用可能な国：',
      Ids.chooseCountry: '使用する国を選択してください：',
      Ids.all: '全部',
      Ids.needLogin: 'トラフィックパッケージを購入するにはログインする必要があります。今すぐログインしますか？',
      Ids.expired: 'ログイン情報の有効期限が切れているため、再度ログインする必要があります',
      Ids.CNY: 'CN¥',
      Ids.USD: 'US\$',
      Ids.HKD: 'HKD\$',
      Ids.JPY: 'JPY¥',
      Ids.EUR: '€',
      Ids.day: '日',
      Ids.month: '月',
      Ids.year: '年',
      Ids.hour: '時',

      //pay history
      Ids.payHistory: '支払い履歴',
      Ids.count: 'カウント：',
      Ids.currency: '通貨：',
      Ids.buyTime: '購入時間：',

      //used details
      Ids.useDetails: '使用データの詳細',
      Ids.startDate: '開始日：',
      Ids.endDate: '--終了日：',
      Ids.query: '問い合わせ',

      //package info
      Ids.effectiveMode: '有効モード：',
      Ids.effectiveDate: '発効日：',
      Ids.purchaseQuantity: '購入数量：',
      Ids.pay: 'pay',
      Ids.takeEffectTogether: '一緒に効果を発揮',
      Ids.takeEffectOneByOne: 'ひとつずつ効果を発揮する',
    }
  },
  'es': {
    'ES': {
      //common
      Ids.confirm: 'Confirmar',
      Ids.cancel: 'Cancelar',
      Ids.submit: 'enviar',
      Ids.exitTips: 'Presione nuevamente para salir',

      //home drawer
      Ids.menuHome: 'casa',
      Ids.menuNews: 'Noticias',
      Ids.menuTutorial: 'Tutorial',
      Ids.menuBuy: 'Comprar paquete',
      Ids.menuPackage: 'Mi paquete',
      Ids.menuDevice: 'Dispositivos',
      Ids.menuLogin: 'Iniciar sesión',
      Ids.menuContact: 'Contacto',
      Ids.menuLogout: 'Cerrar sesión',
      Ids.menuDeviceTitle: 'Información del dispositivo',

      //home fragment
      Ids.electricity: 'Electricidad',
      Ids.todayUsed: 'Hoy usado',
      Ids.networkStatus: 'Estado de la red',
      Ids.connectCount: 'Dispositivo de conexión:%\$0\$s',

      //login fragment
      Ids.promptEmail: 'Dirección de correo electrónico o nombre de usuario',
      Ids.promptPassword: 'Contraseña',
      Ids.actionSignIn: 'Iniciar sesión',
      Ids.actionSignInShort: 'Registrarse',
      Ids.actionRegister: 'Registro',
      Ids.forgetPW: 'Forget Contraseña',
      Ids.noAccount: 'sin cuenta?',
      Ids.signUpNow: 'Regístrate ahora',
      Ids.lostPassword: '¿Perdiste tu contraseña?',
      Ids.lostEmail: '¿Perdiste tu correo electrónico?',
      Ids.logoutMsg: 'cerrar sesión en su cuenta?',
      Ids.welcome: 'Bienvenidos !',
      Ids.invalidUsername: 'No es un nombre de usuario válido',
      Ids.invalidEmail: 'No es un correo valido',
      Ids.invalidPassword: 'La contraseña debe tener> 5 caracteres',
      Ids.checkPasswordError: 'Contraseña inconsistente ingresada dos veces',
      Ids.loginFailed: 'error de inicio de sesion',

      //register fragment
      Ids.userName: 'Nombre para mostrar*',
      Ids.eMail: 'Email*',
      Ids.password: 'contraseña*',
      Ids.passwordCheck: 'confirmacion de contraseña*',

      //my pack fragment
      Ids.packageType: 'Tipo de paquete:',
      Ids.validityPeriod: 'Periodo de validez:',
      Ids.data: 'Fecha:',
      Ids.purchaseDate: 'Fecha de compra:',
      Ids.buyPackageSuccess:
          'DeviceSn:%\$0\$s comprar %\$1\$s paquete de éxito',

      //package info
      Ids.packageInfo: 'Información del paquete',
      Ids.buy: 'comprar',

      //contact us
      Ids.contact: 'contacto',
      Ids.contactAddress: 'dirección de contacto',
      Ids.address: '16F, Torre CE0, 77 Wing Hong St.Kwoloon, Hong Kong',

      //devices fragment
      Ids.choiceDevice: 'Por favor seleccione un dispositivo',
      Ids.setting: 'Ajuste',
      Ids.buyPackage: 'Comprar paquete',
      Ids.connectDevices: 'Dispositivo conectado',

      //buy package fragment
      Ids.buyPackageTitle:
          'Para recargar su dispositivo, ingrese el SN de su dispositivo o escanee el código QR impreso en la parte posterior del dispositivo para explorar los paquetes disponibles.',
      Ids.inputDevice: 'Ingrese su dispositivo SN',
      Ids.deviceSelect: 'Seleccione su dispositivo SN para el paquete',
      Ids.or: 'O',
      Ids.scanQR: 'Escanea tu código QR',
      Ids.needCameraPermissions: 'Necesito usar permisos de cámara',
      Ids.buyPackageInfo: 'comprar',
      Ids.purchaseHistory: 'Historial de compras',
      Ids.inputSN: 'debe ingresar el dispositivo SN',
      Ids.scanError: 'Error de exploración',
      Ids.canNotScanned: 'El código QR no se pudo escanear',
      Ids.inputErrorSN: 'Error de entrada del dispositivo SN',

      //package for sale
      Ids.packageTitle: 'información del paquete',
      Ids.packageTitle: 'título del paquete',
      Ids.packageName: 'Nombre del paquete:',
      Ids.price: 'Precio:',
      Ids.priceValue: '%\$0\$s %\$1\$s',
      Ids.data: 'Datos:',
      Ids.cycleTime: 'Tiempo del ciclo:',
      Ids.cycleTimeValue: '%\$0\$s %\$1\$s',
      Ids.useCountry: 'País disponible:',
      Ids.chooseCountry: 'Elige un país para usar:',
      Ids.all: 'Todos',
      Ids.needLogin:
          'Necesita iniciar sesión para comprar un paquete de tráfico, inicie sesión ahora?',
      Ids.expired: 'Su información de inicio de sesión ha caducado y debe volver a iniciar sesión',
      Ids.CNY: 'CN¥',
      Ids.USD: 'US\$',
      Ids.HKD: 'HKD\$',
      Ids.JPY: 'JPY¥',
      Ids.EUR: '€',
      Ids.day: 'Día',
      Ids.month: 'Mes',
      Ids.year: 'Año',
      Ids.hour: 'Hora',

      //pay history
      Ids.payHistory: 'Historial de pagos',
      Ids.count: 'contar:',
      Ids.currency: 'moneda:',
      Ids.buyTime: 'Ganar tiempo:',

      //used details
      Ids.useDetails: 'Detalles de datos usados',
      Ids.startDate: 'Fecha de inicio:',
      Ids.endDate: '--Fecha final:',
      Ids.query: 'consulta',

      //package info
      Ids.effectiveMode: 'Modo efectivo:',
      Ids.effectiveDate: 'Fecha efectiva:',
      Ids.purchaseQuantity: 'Cantidad de compra:',
      Ids.pay: 'pagar',
      Ids.takeEffectTogether: 'Surtan efecto juntos',
      Ids.takeEffectOneByOne: 'Surtan efecto uno por uno',
    }
  },
};
