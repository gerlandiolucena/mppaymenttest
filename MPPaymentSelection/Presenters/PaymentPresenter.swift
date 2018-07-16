//
//  PaymentPresenter.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit

struct PaymentPresenter {
    
    static func showPaymentMethodsViewController(amount: Double, from: UIViewController) {
        if let paymentMethodsViewController = R.storyboard.main.paymentMethodsListViewController() {
            paymentMethodsViewController.amount = amount
            paymentMethodsViewController.navigationController?.isNavigationBarHidden = true
            from.navigationController?.show(paymentMethodsViewController, sender: nil)
        }
    }
    
    static func showCardIssuersViewController(amount: Double, paymentMethod: MPPayment,from: UIViewController) {
        if let cardIssuersViewController = R.storyboard.main.cardIssuersViewController() {
            cardIssuersViewController.amount = amount
            cardIssuersViewController.paymentIssue = paymentMethod
            cardIssuersViewController.navigationController?.isNavigationBarHidden = true
            from.navigationController?.show(cardIssuersViewController, sender: nil)
        }
    }
    
    static func showInstallmentsViewController(amount: Double, paymentMethod: MPPayment?, cardIssuer: MPCardIssuer?, from: UIViewController) {
        if let installmentsViewController = R.storyboard.main.installmentsViewController() {
            installmentsViewController.amount = amount
            installmentsViewController.paymentIssue = paymentMethod
            installmentsViewController.cardIssuer = cardIssuer
            installmentsViewController.navigationController?.isNavigationBarHidden = true
            from.navigationController?.show(installmentsViewController, sender: nil)
        }
    }
    
    static func showFinishController(paymentMethod: MPPayment?, cardIssuer: MPCardIssuer?, payerCost: MPPayerCosts?, from: UIViewController) {
        if let finishViewController = R.storyboard.main.finishPaymentViewController() {
            finishViewController.cardIssuer = cardIssuer
            finishViewController.payerCosts = payerCost
            finishViewController.paymentIssue = paymentMethod
            if let amountViewController = from.navigationController?.viewControllers.first {
                from.navigationController?.popToRootViewController(animated: true)
                finishViewController.modalPresentationStyle = .overCurrentContext
                amountViewController.present(finishViewController, animated: false, completion: nil)
            }
        }
    }
}
