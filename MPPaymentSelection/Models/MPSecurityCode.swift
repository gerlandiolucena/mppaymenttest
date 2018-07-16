//
//  MPSecurityCode.swift
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MPSecurityCode: Codable {

    var cardLocation: String?
    var mode: String?
    var length: Int?
    
    enum CodingKeys: String, CodingKey {
        case cardLocation = "card_location"
        case mode
        case length
  }
}
