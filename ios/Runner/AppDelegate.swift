import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate ,PayPalPaymentDelegate{
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let CHANNEL: String = "konnect.flutter.dev/paypal"
        
        //配置何种支付环境，沙盒 true，正式 false
        let isSendBox: Bool = true
        
        //正式环境 APP id
        let LIVE_CLIENT_ID: String = "AVrGU_rdK5a_W8Fo9rAf-5WOqrQuM5RKJDZR8BAfNp-QR2bFJs6n9hDE579BonXhiRHoOX77L6Dzm4LX"
        
        //沙盒环境 APP Id
        let SANDBOX_CLIENT_ID: String = "ASskKGQjRAf-6jAdwn771epAcx7C_dDNBGH-SMtjbo9xAlbV-D7Ah695YLTdllnRCPklUZdjjH1mlTcW"
        
        //初始化PayPal
        PayPalMobile.initializeWithClientIds(forEnvironments: [
            PayPalEnvironmentProduction: LIVE_CLIENT_ID
            , PayPalEnvironmentSandbox: SANDBOX_CLIENT_ID])
        PayPalMobile.preconnect(withEnvironment: (isSendBox ? PayPalEnvironmentSandbox : PayPalEnvironmentProduction))
        
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let payChannel = FlutterMethodChannel(name: CHANNEL,binaryMessenger: controller.binaryMessenger)
        
        payChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // Note: this method is invoked on the UI thread.
            // Handle pay messages.
            // flutter cmds dispatched on iOS device :
            if call.method == "paymentByPayPal" {
                if let arguments : Dictionary = call.arguments as! Dictionary<String,Any>,
                    let money = arguments["money"] as? String,
                    let currency = arguments["currency"] as? String,
                    let packageName = arguments["packageName"] as? String {
                    
                    print("Params received on iOS = \(money), \(currency), \(packageName)")
                    self.mResult = result
                    self.startPay(viewController: controller, payPalPaymentDelegate: self, payAmount: money , currencyCode: currency, shortDescription: packageName)
                    
                } else {
                    result("iOS could not extract flutter arguments in method: (paymentByPayPal)")
                }
                
                
            } else {
                result("Flutter method not implemented on iOS")
            }
            
        })
        
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    var mResult : FlutterResult? = nil //回调dart
    
    
    //支付用户取消 结果回调
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment cancel !")
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    
    //支付成功 结果回调
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
        paymentViewController.dismiss(animated: true, completion: nil)
        do {
            let paymentId = try ((completedPayment.confirmation as NSDictionary).object(forKey: "response") as! [String: String])["id"]
            //可以将获取的paymentId直接上传至服务器处理，相关代码后面服务器部分已经说明
            if (self.mResult != nil) {
                self.mResult!(paymentId)
            }
        } catch {
            //获取失败说明支付可能失败，做失败处理即可。
            if (self.mResult != nil) {
                self.mResult!("Flutter method not implemented on iOS")
            }
        }
        
    }
    
    
    
    //开始 paypal 支付
    private func startPay(viewController: UIViewController, payPalPaymentDelegate: PayPalPaymentDelegate
        , payAmount: String, currencyCode: String, shortDescription: String) {
        let payPalConfiguration = PayPalConfiguration()
        payPalConfiguration.acceptCreditCards = true
        payPalConfiguration.payPalShippingAddressOption = PayPalShippingAddressOption.payPal
        payPalConfiguration.merchantName = NSLocalizedString("appName", comment: "")
        payPalConfiguration.languageOrLocale = NSLocale.preferredLanguages.first
        let payment = PayPalPayment()
        payment.amount = NSDecimalNumber.init(string: payAmount)
        payment.currencyCode = currencyCode
        payment.shortDescription = shortDescription
        payment.intent = PayPalPaymentIntent.sale
        if !payment.processable {
            print("订单信息错误")
            return
        }
        let paymentViewController = PayPalPaymentViewController(payment: payment
            , configuration: payPalConfiguration, delegate: payPalPaymentDelegate)
        if paymentViewController != nil {
            viewController.present(paymentViewController!
                , animated: true)
        } else {
            print("paymentViewController init error.")
        }
    }
    
}


