//
//  MPCardIssuersListViewController.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit

class MPPaymentMethodsListViewController: BaseViewController {

    @IBOutlet weak var paymentsTableView: UITableView!
    @IBOutlet weak var amoutInformed: UILabel!
    
    var paymentsDataSource: MPPaymentMethodsDataSource?
    let paymentsRequest = MPPaymentMethodsImpl()
    var amount: Double = 0
    var paymentsList: [MPPayment]? {
        didSet {
            setupView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPaymentMethods()
    }
}

// MARK: Actions
extension MPPaymentMethodsListViewController {
    
    @IBAction func backToSelectAmount(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: Default
extension MPPaymentMethodsListViewController {
    
    func fetchPaymentMethods() {
        self.loadingState = .loading
        MPPaymentMethodsImpl().fetchPaymentMethods({[weak self] (result) in
            switch result {
                case .success(let payments):
                    self?.loadingState = .ready
                    self?.paymentsList = payments
                case .error(let errorMsg):
                    self?.loadingState = .error(errorMsg: errorMsg, actionTitle: "selectAgain".localized(), action: {() in
                        self?.navigationController?.popViewController(animated: true)
                    })
                    print(errorMsg)
            }
        })
    }
    
    func setupView() {
        guard let paymentsList = paymentsList else {
            return
        }
        
        amoutInformed.text = String(amount).formatCurrencyString()
        paymentsDataSource = MPPaymentMethodsDataSource(listItem: paymentsList, tableView: paymentsTableView)
        paymentsTableView.dataSource = paymentsDataSource
        paymentsTableView.backgroundView?.backgroundColor = UIColor.clear
        paymentsTableView.reloadData()
    }
}

// MARK: Delegate
extension MPPaymentMethodsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let paymentMethod = paymentsList?[indexPath.row] {
            PaymentPresenter.showCardIssuersViewController(amount: amount, paymentMethod: paymentMethod, from: self)
        }
    }
}
