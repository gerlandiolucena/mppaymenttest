//
//  MPPayerCosts.swift
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MPPayerCosts: Codable {

    var discountRate: Int?
    var labels: [String]?
    var installmentRate: Float?
    var installmentAmount: Float?
    var minAllowedAmount: Int?
    var installmentRateCollector: [String]?
    var totalAmount: Float?
    var maxAllowedAmount: Int?
    var recommendedMessage: String?
    var installments: Int?
    var selected: Bool?
    
    enum CodingKeys: String, CodingKey {
        case discountRate = "discount_rate"
        case labels
        case installmentRate = "installment_rate"
        case installmentAmount = "installment_amount"
        case minAllowedAmount = "min_allowed_amount"
        case installmentRateCollector = "installment_rate_collector"
        case totalAmount = "total_amount"
        case maxAllowedAmount = "max_allowed_amount"
        case recommendedMessage = "recommended_message"
        case installments
        case selected
  }
}
