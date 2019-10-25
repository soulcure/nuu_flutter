import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var mResult: FlutterResult
    
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
            
            
            self.mResult=result
            // Note: this method is invoked on the UI thread.
            // Handle pay messages.
            // flutter cmds dispatched on iOS device :
            if call.method == CHANNEL {
                
                guard let args = call.arguments else {
                    result("iOS could not recognize flutter arguments in method: (sendParams)")
                }
                
                if let myArgs = args as? [String: Any],
                    let money = myArgs["money"] as? String,
                    let currency = myArgs["currency"] as? String,
                    let packageName = myArgs["packageName"] as? Double {
                    
                    result("Params received on iOS = \(money), \(currency), \(packageName)")
                    
                    startPay(viewController: self, payPalPaymentDelegate: self, payAmount: money , currencyCode: currency, shortDescription: packageName)
                    
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
    
    extension PlanCV: PayPalPaymentDelegate {
        func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
            //运行到这里说明支付被取消
            self.dismiss(animated: false)
            if(self.mResult!=nil){
                self.mResult(FlutterError(code: "UNAVAILABLE",
                                          message: "user cancel",
                                          details: nil))
            }
        }
        
        func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController
            , didComplete completedPayment: PayPalPayment) {
            do {
                let paymentId = try ((completedPayment.confirmation as NSDictionary).object(forKey: "response") as! [String: String])["id"]
                //可以将获取的paymentId直接上传至服务器处理，相关代码后面服务器部分已经说明
                if (self.mResult != nil) {
                    self.mResult.success(paymentId);
                }
            } catch {
                //获取失败说明支付可能失败，做失败处理即可。
                
                if (self.mResult != nil) {
                    self.mResult(FlutterMethodNotImplemented)
                }
            }
            self.dismiss(animated: false)
        }
        
    }
}



