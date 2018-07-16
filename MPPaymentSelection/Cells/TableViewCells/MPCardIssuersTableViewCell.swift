//
//  MPCardIssuersTableViewCell.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit
import Reusable
import SDWebImage

class MPCardIssuersTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var cardIssueName: UILabel!
    @IBOutlet weak var cardIssueThumbnail: UIImageView!
    
    var item: MPCardIssuer? {
        didSet {
            setupCell()
        }
    }
    
    func setupCell() {
        cardIssueName.text = item?.name
        if let avatar = item?.thumbnail, let urlAvatar = URL(string: avatar) {
            self.cardIssueThumbnail.sd_setImage(with: urlAvatar, placeholderImage: R.image.avatar())
        }
    }
}
