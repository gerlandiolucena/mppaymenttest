//
//  Swift+Extensions.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 14/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import Foundation

extension String {
    
    func doubleValue() -> Double {
        var amountWithPrefix = self
        if let regex = try? NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive) {
            amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
            
            if let doubleValue = Double(amountWithPrefix) {
                let numberValue = doubleValue / 10
                
                return numberValue
            }
        }
        
        return 0
    }
    
    func currencyValue() -> String {
        let numberValue = doubleValue() / 10
        return NumberFormatter().currencyFormatt(for: numberValue)
    }
    
    func numberFormatt() -> Double {
        if let regex = try? NSRegularExpression(pattern: "(\\d+)?(\\.+)?(\\,+)?", options: .caseInsensitive) {
            let numberText = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count)).map {
                String(self[Range($0.range, in: self)!])
            }
            
            let numberValue = Double(numberText.joined(separator: "").replacingOccurrences(of: ",", with: ".")) ?? 0.0
            return numberValue
        }
        return 0.0
    }
    
    func formatCurrencyString() -> String {
        let numberValue = numberFormatt()
        return NumberFormatter().currencyFormatt(for: numberValue)
    }
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
