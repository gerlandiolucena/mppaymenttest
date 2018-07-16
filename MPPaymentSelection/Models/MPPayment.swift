//
//  MPBaseClassPayment.swift
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MPPayment: Codable {

    var deferredCapture: String?
    var name: String?
    var thumbnail: String?
    var paymentTypeId: String?
    var accreditationTime: Int?
    var additionalInfoNeeded: [String]?
    var status: String?
    var id: String?
    var settings: [MPSettings]?
    var maxAllowedAmount: Float?
    var minAllowedAmount: Float?
    var processingModes: [String]?
    var secureThumbnail: String?

    enum CodingKeys: String, CodingKey {
        case deferredCapture = "deferred_capture"
        case name
        case thumbnail
        case paymentTypeId = "payment_type_id"
        case accreditationTime = "accreditation_time"
        case additionalInfoNeeded = "additional_info_needed"
        case status
        case id
        case settings
        case maxAllowedAmount = "max_allowed_amount"
        case minAllowedAmount = "min_allowed_amount"
        case processingModes = "processing_modes"
        case secureThumbnail = "secure_thumbnail"
    }
}
