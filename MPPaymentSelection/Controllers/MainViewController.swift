//
//  RootViewController.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var toolbar: UIToolbar!
    
    var amount: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingState = .ready
        setupView()
    }
}

// MARK: Actions
extension MainViewController {
    
    @IBAction func showPaymentMethods() {
        if let amountString = amountText.text {
            amount = amountString.numberFormatt()
            PaymentPresenter.showPaymentMethodsViewController(amount: amount, from: self)
        }
    }

    @IBAction func didChangeValue(_ sender: UITextField) {
        if let amountString = amountText.text?.currencyValue() {
            amountText.text = amountString
        }
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func closeKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
}

// MARK: Default
extension MainViewController {
    
    func setupView() {
        amountText.inputAccessoryView = toolbar
    }
}



