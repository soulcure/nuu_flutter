//
//  PayPalDelegate.swift
//  Runner
//
//  Created by soulcure on 2019/10/25.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import Foundation


class PayPalPaymentDele: UIViewController, PayPalPaymentDelegate {

    
    // PayPalPaymentDelegate
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {

        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
    }
    
    
    
    
}
