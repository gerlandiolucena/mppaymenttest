//
//  NumberFormattExtensions.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 15/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit

extension NumberFormatter {
    
    func currencyFormatt(for value: Double) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = Locale.current.currencySymbol
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        let numberValue = value
        
        let number = NSNumber(value: numberValue)
        if let formattedValue = formatter.string(from: number) {
            return formattedValue
        }
        
        return ""
    }
}
