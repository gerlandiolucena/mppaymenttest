//
//  MPCardIssuersViewController.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit

class MPCardIssuersViewController: BaseViewController {

    @IBOutlet weak var cardIssuerTableView: UITableView!
    @IBOutlet weak var amoutInformed: UILabel!
    @IBOutlet weak var paymentSelectedImage: UIImageView!
    @IBOutlet weak var paymentName: UILabel!
    
    var cardIssuerDataSource: MPCardIssuerDataSource?
    let cardIssuerRequest = MPCardIssuersImpl()
    var amount: Double = 0
    var paymentIssue: MPPayment?
    var cardIssuerList: [MPCardIssuer]? {
        didSet {
            setupView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCardIssuers()
    }
}

// MARK: Actions
extension MPCardIssuersViewController {
    
    @IBAction func backToSelectPaymentMethod(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: Default
extension MPCardIssuersViewController {
    
    func fetchCardIssuers() {
        self.loadingState = .loading
        cardIssuerRequest.fetchCardIssuers(paymentMethod: paymentIssue?.id ?? "") {[weak self] (result) in
            switch result {
            case .success(let cardIssuers):
                self?.cardIssuerList = cardIssuers
                if (cardIssuers.count > 0) {
                    self?.loadingState = .ready
                } else {
                    self?.setErrorState()
                }
            case .error(let errorMsg):
                self?.setErrorState(msg: errorMsg)
                print(errorMsg)
            }
        }
    }
    
    func setErrorState(msg: String? = nil) {
        self.loadingState = .error(errorMsg: msg ?? "errorLoadingInformation".localized(), actionTitle: "selectAgain".localized(), action: {() in
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func setupView() {
        guard let cardIssuerList = cardIssuerList else {
            return
        }
        
        setupPayment()
        
        cardIssuerDataSource = MPCardIssuerDataSource(listItem: cardIssuerList, tableView: cardIssuerTableView)
        cardIssuerTableView.dataSource = cardIssuerDataSource
        cardIssuerTableView.backgroundView?.backgroundColor = UIColor.clear
        cardIssuerTableView.reloadData()
    }
    
    func setupPayment() {
        amoutInformed.text = String(amount).formatCurrencyString()
        paymentName.text = paymentIssue?.name
        if let avatar = paymentIssue?.thumbnail, let urlAvatar = URL(string: avatar) {
            self.paymentSelectedImage.sd_setImage(with: urlAvatar, placeholderImage: R.image.avatar())
        }

    }
}

// MARK: Delegate
extension MPCardIssuersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cardIssuer = cardIssuerList?[indexPath.row] {
            PaymentPresenter.showInstallmentsViewController(amount: amount, paymentMethod: paymentIssue, cardIssuer: cardIssuer, from: self)
        }
    }
}
