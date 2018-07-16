//
//  MPBaseClassIssue.swift
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MPCardIssuer: Codable {

    var name: String?
    var processingMode: String?
    var id: String?
    var thumbnail: String?
    var secureThumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case processingMode = "processing_mode"
        case id
        case thumbnail
        case secureThumbnail = "secure_thumbnail"
    }

}
