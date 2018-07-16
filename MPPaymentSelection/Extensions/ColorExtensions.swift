//
//  ColorExtensions.swift
//  MPPaymentSelection
//
//  Created by Gerlandio Da Silva Lucena on 15/07/2018.
//  Copyright © 2018 GerlandioLucena. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var defaultNavigationTintColor: UIColor {
        get {
            return UIColor.white
        }
    }
    
    static var defaultNavigationBarTintColor: UIColor {
        get {
            return UIColor.black
        }
    }
    
    static var defaultNavigationTitleAttribute: [NSAttributedStringKey : Any] {
        get {
            return [NSAttributedStringKey.foregroundColor:UIColor.white]
        }
    }
    
}

