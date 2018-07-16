//
//  MPCardIssuersViewController.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit

class MPFinishPaymentViewController: BaseViewController {

    @IBOutlet weak var amoutInformed: UILabel!
    @IBOutlet weak var paymentSelectedImage: UIImageView!
    @IBOutlet weak var paymentName: UILabel!
    @IBOutlet weak var cardIssuerSelectedImage: UIImageView!
    @IBOutlet weak var cardIssuerName: UILabel!
    
    var paymentIssue: MPPayment?
    var cardIssuer: MPCardIssuer?
    var payerCosts: MPPayerCosts?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: Actions
extension MPFinishPaymentViewController {
    
    @IBAction func finishConclusion(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: Default
extension MPFinishPaymentViewController {
    
    func setupView() {
        loadingState = .ready
        amoutInformed.text = payerCosts?.recommendedMessage
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
