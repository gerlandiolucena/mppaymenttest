//
//  MPSettings.swift
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MPSettings: Codable {

    var cardNumber: MPCardNumber?
    var securityCode: MPSecurityCode?
    var bin: MPBin?
    
    enum CodingKeys: String, CodingKey {
        case cardNumber = "card_number"
        case securityCode = "security_code"
        case bin
  }
}

extension MPSettings {
    init(from decoder: Decoder) throws {
        let mpSettings = try decoder.container(keyedBy: CodingKeys.self)
        cardNumber = try mpSettings.decode(MPCardNumber.self, forKey: .cardNumber)
        securityCode = try mpSettings.decode(MPSecurityCode.self, forKey: .securityCode)
    }
}

extension MPSettings {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cardNumber, forKey: .cardNumber)
        try container.encode(securityCode, forKey: .securityCode)
    }
}
