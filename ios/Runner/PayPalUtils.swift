import UIKit
import Flutter

class PayPalUtils {
			    static func initUtils(_ paypalLive: String, _  paypalSendBox: String, _ isSendBox: Bool) {
			        PayPalMobile.initializeWithClientIds(forEnvironments: [
			            PayPalEnvironmentProduction: paypalLive
			            , PayPalEnvironmentSandbox: paypalSendBox])
			        PayPalMobile.preconnect(withEnvironment: (isSendBox ? PayPalEnvironmentSandbox : PayPalEnvironmentProduction))
			    }

			    static func startPay(viewController: UIViewController, payPalPaymentDelegate: PayPalPaymentDelegate
			            , payAmount: Double, currencyCode: String, shortDescription: String) {
			        let payPalConfiguration = PayPalConfiguration()
			        payPalConfiguration.acceptCreditCards = true
			        payPalConfiguration.payPalShippingAddressOption = PayPalShippingAddressOption.payPal
			        payPalConfiguration.merchantName = NSLocalizedString("appName", comment: "")
			        payPalConfiguration.languageOrLocale = NSLocale.preferredLanguages.first
			        var payment = PayPalPayment()
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
