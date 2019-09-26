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
    }
  }
};
