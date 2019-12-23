import 'dart:convert';

import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konnect/common/Global.dart';
import 'package:konnect/model/JsAccount.dart';
import 'package:konnect/model/Payment.dart';
import 'package:konnect/res/strings.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

import 'package:intl/number_symbols_data.dart' show numberFormatSymbols;
import 'dart:ui' as ui;

class Browser extends StatefulWidget {
  const Browser({Key key, this.url, this.deviceSn}) : super(key: key);

  final String url;
  final String deviceSn;

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<Browser> {
  static const platform = const MethodChannel('konnect.flutter.dev/paypal');
  WebViewController _controller;

  int packageId;
  String packagePrice;
  String currency;
  String packageName;
  String invoice;

  bool isSendBox = true;
  String sandboxClientId;
  String liveClientId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(IntlUtil.getString(context, Ids.menuBuy)),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          setDeviceInfo();
//        },
//        child: Text('call JS'),
//      ),
      body: WebView(
        initialUrl: widget.url,
        //JS执行模式 是否允许JS执行
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        onPageFinished: (url) {
          //setDeviceInfo();
        },

        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith("myapp://")) {
            print("即将打开 ${request.url}");

            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        javascriptChannels: <JavascriptChannel>[
          //类似于往JS中注册方法，这些方法名要和web端约定好
          JavascriptChannel(
              name: "Toast",
              onMessageReceived: (JavascriptMessage message) {
                print("参数： ${message.message}");

                String callback = message.message; //实际应用中要通过map通过key获取
                String data = "收到消息调用了";
                String script = "$callback($data)";
                _controller.evaluateJavascript(script);
              }),
          JavascriptChannel(
              name: "getPayParam",
              onMessageReceived: (JavascriptMessage message) {
                print("getPayParam： ${message.message}");
                setDeviceInfo();
              }),
          JavascriptChannel(
              name: "appPayment",
              onMessageReceived: (JavascriptMessage message) {
                print("payment test ： ${message.message}");
                var params = json.decode(message.message);
                var payment = Payment.fromJson(params);
                print("payment： $payment");
                _paymentByPayPal(payment);
              }),
        ].toSet(),
      ),
    );
  }

  //获取当前系统语言
  String getCurrentLocale() {
    final locale = ui.window.locale;
    final joined = "${locale.languageCode}_${locale.countryCode}";
    if (numberFormatSymbols.keys.contains(joined)) {
      return joined;
    }
    return locale.languageCode;
  }

  setDeviceInfo() {
    var token = generateMd5(Global.profile.uuid);

    print("token: $token");
    JsAccount params = JsAccount(
        sn: widget.deviceSn, token: token, locale: getCurrentLocale());
    var p = params.toJson();
    String text = "setDeviceInfo('$p')";
    print(text);
    _controller.evaluateJavascript(text).then((result) {});
  }

  paid(String paymentId) {
    print("paymentId： $paymentId");
    String text = "paid('$paymentId')";
    _controller.evaluateJavascript(text).then((result) {
      Global.saveDeviceSN(widget.deviceSn);
    });
  }

  ///Generate MD5 hash
  generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  Future<void> _paymentByPayPal(Payment payment) async {
    try {
      var params = {
        'money': payment.money,
        'currency': payment.currency,
        'packageName': payment.packageName,
        'sandboxClientId': payment.sandboxClientId,
        'liveClientId': payment.liveClientId,
        'isSendBox': payment.isSendBox,
      };
      final String paymentId =
          await platform.invokeMethod('paymentByPayPal', params);

      await paid(paymentId);
    } on PlatformException catch (e) {
      print("Failed to get battery level: '${e.message}'.");
    }
  }
}
