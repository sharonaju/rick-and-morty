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
    case black
    case lightGrey
    case darkGrey
    var value: UIColor{
        switch self {
        case .black:
            return UIColor.init(hex: "#25282E") ?? .clear
        case .lightGrey:
            return UIColor.init(hex: "#9E9E9E") ?? .clear
        case .darkGrey:
            return UIColor.init(hex: "#3C3D42") ?? .clear
        }
    }
    
    enum ColorCode: String {
        case black
        case lightGrey
        case darkGrey
        static func build(rawValue: String) -> ColorCode {
            return ColorCode(rawValue: rawValue) ?? .black
        }
    }
    
    static func colorForCode(_ code: ColorCode, customColor: UIColor?) -> UIColor {
        switch code {
        case .black:
            return AppColor.black.value
        case .lightGrey:
            return AppColor.lightGrey.value
        case .darkGrey:
            return AppColor.darkGrey.value
        }
    }
}




