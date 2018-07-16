//
//  MPBin.swift
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MPBin {

    var pattern: String?
    var installmentsPattern: String?
    var exclusionPattern: String?

    enum CodingKeys: String, CodingKey {
        case pattern
        case installmentsPattern = "installments_pattern"
        case exclusionPattern = "exclusion_pattern"
    }
}
