import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var mResult: FlutterResult
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let CHANNEL: String = "konnect.flutter.dev/paypal"
        //配置何种支付环境，一般沙盒，正式
        let CONFIG_ENVIRONMENT: String = PayPalConfiguration.ENVIRONMENT_SANDBOX
        //你所注册的APP Id
        let CONFIG_CLIENT_ID: String = "ASskKGQjRAf-6jAdwn771epAcx7C_dDNBGH-SMtjbo9xAlbV-D7Ah695YLTdllnRCPklUZdjjH1mlTcW"
        //初始化PayPal
        PayPalUtils.initUtils(NSLocalizedString("paypalLive", comment: CONFIG_CLIENT_ID), NSLocalizedString("paypalSendBox", comment: CONFIG_ENVIRONMENT), false)
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let payChannel = FlutterMethodChannel(name: CHANNEL,
                                              binaryMessenger: controller.binaryMessenger)
        payChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            // Note: this method is invoked on the UI thread.
            guard call.method == "getBatteryLevel" else {
                result(FlutterMethodNotImplemented)
                return
            }
            mResult = result
            
            var money = call.argument("money")
            var currency = call.argument("currency")
            var packageName = call.argument("packageName")
            PayPalUtils.startPay(viewController: self, payPalPaymentDelegate: self, payAmount: money , currencyCode: currency, shortDescription: packageName);
            
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}


extension PlanCV: PayPalPaymentDelegate {
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        //运行到这里说明支付被取消
        dismiss(animated: false)
        if(mResult!=nil){
            mResult(FlutterError(code: "UNAVAILABLE",
                                 message: "user cancel",
                                 details: nil))
        }
    }
}

func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController
    , didComplete completedPayment: PayPalPayment) {
    do {
        let paymentId = try ((completedPayment.confirmation as NSDictionary).object(forKey: "response") as! [String: String])["id"]
        //可以将获取的paymentId直接上传至服务器处理，相关代码后面服务器部分已经说明
        if (mResult != null) {
            mResult.success(paymentId);
        }
    } catch {
        //获取失败说明支付可能失败，做失败处理即可。
        result(FlutterMethodNotImplemented)
    }
    dismiss(animated: false)
}
