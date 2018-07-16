//
//  MPCardIssuersViewController.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit

class MPInstallmentsViewController: BaseViewController {

    @IBOutlet weak var installmentsTableView: UITableView!
    @IBOutlet weak var amoutInformed: UILabel!
    @IBOutlet weak var paymentSelectedImage: UIImageView!
    @IBOutlet weak var paymentName: UILabel!
    @IBOutlet weak var cardIssuerSelectedImage: UIImageView!
    @IBOutlet weak var cardIssuerName: UILabel!
    
    var installmentsDataSource: MPInstallmentsDataSource?
    let installmentRequest = MPCardInstallmentsImpl()
    var amount: Double = 0
    var paymentIssue: MPPayment?
    var cardIssuer: MPCardIssuer?
    var paymentCostsList: [MPPaymentCost]? {
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
extension MPInstallmentsViewController {
    
    @IBAction func backToSelectCardIssuer(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func finishPayment(_ sender: UIButton) {
        if let payerCosts = installmentsDataSource?.selectedItem() {
            PaymentPresenter.showFinishController(paymentMethod: paymentIssue, cardIssuer: cardIssuer, payerCost: payerCosts, from: self)
        }
    }
}

// MARK: Default
extension MPInstallmentsViewController {
    
    func fetchCardIssuers() {
        self.loadingState = .loading
        installmentRequest.fetchCardIssuers(amount: amount, paymentMethod: paymentIssue?.id ?? "", issuerId: cardIssuer?.id ?? "") {[weak self] (result) in
            switch result {
            case .success(let paymentCosts):
                self?.paymentCostsList = paymentCosts
                if (paymentCosts.count > 0) {
                    self?.loadingState = .ready
                } else {
                    self?.setErrorState()
                }
            case .error(let errorMsg):
                self?.setErrorState(msg: errorMsg)
            }
        }
    }
    
    func setErrorState(msg: String? = nil) {
        self.loadingState = .error(errorMsg: msg ?? "errorLoadingInformation".localized(), actionTitle: "selectAgain".localized(), action: {() in
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func setupView() {
        guard let paymentCostsList = paymentCostsList else {
            return
        }
        
        guard let payerCosts = paymentCostsList.first?.payerCosts else {
            return
        }
        
        setupPayment()
        
        installmentsDataSource = MPInstallmentsDataSource(listItem: payerCosts, tableView: installmentsTableView)
        installmentsTableView.dataSource = installmentsDataSource
        installmentsTableView.backgroundView?.backgroundColor = UIColor.clear
        installmentsTableView.reloadData()
    }
    
    func setupPayment() {
        amoutInformed.text = String(amount).formatCurrencyString()
        paymentName.text = paymentIssue?.name
        if let avatar = paymentIssue?.thumbnail, let urlAvatar = URL(string: avatar) {
            self.paymentSelectedImage.sd_setImage(with: urlAvatar, placeholderImage: R.image.avatar())
        }
        cardIssuerName.text = cardIssuer?.name
        if let avatar = cardIssuer?.thumbnail, let urlAvatar = URL(string: avatar) {
            self.cardIssuerSelectedImage.sd_setImage(with: urlAvatar, placeholderImage: R.image.avatar())
        }
    }
}

// MARK: Delegate
extension MPInstallmentsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        installmentsDataSource?.setSelectedIndex(selected: indexPath.row)
    }
}
