//
//  MPPaymentCostsTableViewCell.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 15/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit
import Reusable

class MPPaymentCostsTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var paymentCostsMessage: UILabel!
    @IBOutlet weak var taxValueText: UILabel!
    @IBOutlet weak var totalValueText: UILabel!
    
    var item: MPPayerCosts? {
        didSet {
            setupCell()
        }
    }
    var selectedItem = false
    
    func setupCell() {
        paymentCostsMessage.text = item?.recommendedMessage
        taxValueText.text = String(item?.installmentRate ?? 0).formatCurrencyString()
        totalValueText.text = String(item?.totalAmount ?? 0).formatCurrencyString()
        accessoryType = .none
        if selectedItem {
            accessoryType = .checkmark
        }
    }
}
