class Ids {
  //common
  static const String confirm = 'confirm';
  static const String cancel = 'cancel';
  static const String submit = 'submit';

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
      Ids.buyPackageSuccess: 'DeviceSn:%\$0\$s buy %\$0\$s package success',

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
      Ids.priceValue: '%\$0\$s %\$0\$s',
      Ids.data: 'Data:',
      Ids.cycleTime: 'Cycle Time:',
      Ids.cycleTimeValue: '%\$0\$s %\$1\$s',
      Ids.useCountry: 'Available country:',
      Ids.chooseCountry: 'Choose a country to use :',
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
      Ids.buyPackageSuccess: '设备:%\$0\$s 购买 %\$0\$s 流量套餐成功',

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
      Ids.priceValue: '%\$0\$s %\$0\$s',
      Ids.data: '流量:',
      Ids.cycleTime: '结算周期:',
      Ids.cycleTimeValue: '%\$0\$s %\$1\$s',
      Ids.useCountry: '可用的国家:',
      Ids.chooseCountry: '选择使用国家:',
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
      Ids.buyPackageSuccess: '設備:%\$0\$s 購買 %\$0\$s 流量套餐成功',

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
      Ids.priceValue: '%\$0\$s %\$0\$s',
      Ids.data: '流量:',
      Ids.cycleTime: '結算週期:',
      Ids.cycleTimeValue: '%\$0\$s %\$1\$s',
      Ids.useCountry: '可用的國家:',
      Ids.chooseCountry: '選擇使用國家:',
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
      Ids.buyPackageSuccess: '設備:%\$0\$s 購買 %\$0\$s 流量套餐成功',

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
      Ids.priceValue: '%\$0\$s %\$0\$s',
      Ids.data: '流量:',
      Ids.cycleTime: '結算週期:',
      Ids.cycleTimeValue: '%\$0\$s %\$1\$s',
      Ids.useCountry: '可用的國家:',
      Ids.chooseCountry: '選擇使用國家:',
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
  }
};
