//
//  UIColor+Extension.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import UIKit


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
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
            return UIColor.init(hex: "#9E9E9E") ?? .clear
        case .primaryTextColor:
            return UIColor.init(hex: "#FFFFFF") ?? .clear
        case .secondaryTextColor:
            return UIColor.init(hex: "#3C3D42") ?? .clear
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




