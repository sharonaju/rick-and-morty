//
//  UIColor+Extension.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import UIKit


extension UIColor {
    public convenience init?(hex: String) {
        let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                let scanner = Scanner(string: hexString)
                if (hexString.hasPrefix("#")) {
                    scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
                }
                var color: UInt64 = 0
                scanner.scanHexInt64(&color)
                let mask = 0x000000FF
                let r = Int(color >> 16) & mask
                let g = Int(color >> 8) & mask
                let b = Int(color) & mask
                let red   = CGFloat(r) / 255.0
                let green = CGFloat(g) / 255.0
                let blue  = CGFloat(b) / 255.0
                self.init(red:red, green:green, blue:blue, alpha:1)
    }
}


enum AppColor {
    case primaryBackgroundColor
    case secondaryBackgroundColor
    case primaryTextColor
    case secondaryTextColor
    var value: UIColor{
        switch self {
        case .primaryBackgroundColor:
            return UIColor.init(hex: "#25282E") ?? .clear
        case .secondaryBackgroundColor:
            return UIColor.init(hex: "#3C3D42") ?? .clear
        case .primaryTextColor:
            return UIColor.init(hex: "#FFFFFF") ?? .clear
        case .secondaryTextColor:
            return UIColor.init(hex: "#9E9E9E") ?? .clear
        }
    }
    
    enum ColorCode: String {
        case primaryBackgroundColor
        case secondaryBackgroundColor
        case primaryTextColor
        case secondaryTextColor
        static func build(rawValue: String) -> ColorCode {
            return ColorCode(rawValue: rawValue) ?? .primaryBackgroundColor
        }
    }
    
    static func colorForCode(_ code: ColorCode, customColor: UIColor?) -> UIColor {
        switch code {
        case .primaryBackgroundColor:
            return AppColor.primaryBackgroundColor.value
        case .secondaryBackgroundColor:
            return AppColor.secondaryBackgroundColor.value
        case .primaryTextColor:
            return AppColor.primaryTextColor.value
        case .secondaryTextColor:
            return AppColor.secondaryTextColor.value
        }
    }
}




