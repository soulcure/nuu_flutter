import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let CHANNEL: String = "konnect.flutter.dev/paypal"
        //配置何种支付环境，一般沙盒，正式
        let CONFIG_ENVIRONMENT: Bool = true
        //你所注册的APP Id
        let CONFIG_CLIENT_ID: String = "ASskKGQjRAf-6jAdwn771epAcx7C_dDNBGH-SMtjbo9xAlbV-D7Ah695YLTdllnRCPklUZdjjH1mlTcW"
        
        //初始化PayPal
        PayPalMobile.initializeWithClientIds(forEnvironments: [
            PayPalEnvironmentProduction: CONFIG_CLIENT_ID
            , PayPalEnvironmentSandbox: CONFIG_ENVIRONMENT])
        
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let payChannel = FlutterMethodChannel(name: CHANNEL,binaryMessenger: controller.binaryMessenger)
        
        payChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            // Note: this method is invoked on the UI thread.
            // Handle pay messages.
            // flutter cmds dispatched on iOS device :
            if call.method == CHANNEL {
                
                if  let myArgs = result as? [String: Any],
                    let money = myArgs["money"] as? Double,
                    let currency = myArgs["currency"] as? String,
                    let packageName = myArgs["packageName"] as? String {
                    
                    result("Params received on iOS = \(money), \(currency), \(packageName)")
                    
                    self.startPay(viewController: controller, payPalPaymentDelegate: PayPalPaymentDele(), payAmount: money , currencyCode: currency, shortDescription: packageName)
                    
                } else {
                    result("iOS could not extract flutter arguments in method: (sendParams)")
                }
                
            } else {
                result("Flutter method not implemented on iOS")
            }
            
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    
    
    
    private func receiveBatteryLevel(result: FlutterResult) {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if device.batteryState == UIDevice.BatteryState.unknown {
            result(FlutterError(code: "UNAVAILABLE",
                                message: "Battery info unavailable",
                                details: nil))
        } else {
            result(Int(device.batteryLevel * 100))
        }
    }
    
    
    private func startPay(viewController: UIViewController, payPalPaymentDelegate: PayPalPaymentDelegate
        , payAmount: Double, currencyCode: String, shortDescription: String) {
        let payPalConfiguration = PayPalConfiguration()
        payPalConfiguration.acceptCreditCards = true
        payPalConfiguration.payPalShippingAddressOption = PayPalShippingAddressOption.payPal
        payPalConfiguration.merchantName = NSLocalizedString("appName", comment: "")
        payPalConfiguration.languageOrLocale = NSLocale.preferredLanguages.first
        let payment = PayPalPayment()
        payment.amount = NSDecimalNumber.init(string: String(format: "%.2f", arguments: [payAmount]))
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


