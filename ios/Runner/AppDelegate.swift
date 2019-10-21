import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "konnect.flutter.dev/paypal",
                                              binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      guard call.method == "paymentByPayPal" else {
        result(FlutterMethodNotImplemented)
        return
      }
     final String money = call.argument("money");
     final String currency = call.argument("currency");
     final String packageName = call.argument("packageName");
     Log.d("payment", "money:" + money + "#currency:" + currency + "#packageName:" + packageName);
     self?.paymentByPayPal(money, currency, packageName, result);
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


  bool initPayPal(){
     launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  				PayPalUtils.initUtils(NSLocalizedString("paypalLive", comment: ""), NSLocalizedString("paypalSendBox", comment: ""), false)
  			    return true
   }



extension PlanCV: PayPalPaymentDelegate {
		    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
		    	//运行到这里说明支付被取消
		        dismiss(animated: false)
		    }

		    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController
		            , didComplete completedPayment: PayPalPayment) {
		        do {
		            let paymentId = try ((completedPayment.confirmation as NSDictionary).object(forKey: "response") as! [String: String])["id"]
		            //可以将获取的paymentId直接上传至服务器处理，相关代码后面服务器部分已经说明
		        } catch {
		        	//获取失败说明支付可能失败，做失败处理即可。
		        }
		        dismiss(animated: false)
		    }

		}



func paymentByPayPal( money:String,  currency:String,  packageName:String, result:Result) {
              PayPalUtils.startPay(viewController: self, payPalPaymentDelegate: self, payAmount: money , currencyCode: currency, shortDescription: packageName);
       }
}