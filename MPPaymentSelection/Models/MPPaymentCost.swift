//
//  MPBaseClassPayerCost.swift
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MPPaymentCost: Codable {

    var issuer: MPCardIssuer?
    var paymentMethodId: String?
    var paymentTypeId: String?
    var processingMode: String?
    var payerCosts: [MPPayerCosts]?
    
    enum CodingKeys: String, CodingKey {
        case issuer
        case paymentMethodId = "payment_method_id"
        case paymentTypeId = "payment_type_id"
        case processingMode = "processing_mode"
        case payerCosts = "payer_costs"
    }
}
