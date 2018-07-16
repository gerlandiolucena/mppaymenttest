//
//  MPPaymentMethodTableViewCell.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit
import Reusable
import SDWebImage

class MPPaymentMethodsTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var paymentMethodName: UILabel!
    @IBOutlet weak var paymentMethodThumbnail: FLAnimatedImageView!
    
    var item: MPPayment? {
        didSet {
            setupCell()
        }
    }
    
    func setupCell() {
        paymentMethodName.text = item?.name
        if let avatar = item?.thumbnail, let urlAvatar = URL(string: avatar) {
            self.paymentMethodThumbnail.sd_setImage(with: urlAvatar, placeholderImage: R.image.avatar())
        }
    }
}

