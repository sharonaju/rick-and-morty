//
//  UIFont+Extension.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import UIKit

struct AppFont {
    enum FontName: String {
        case bold
        case regular
        case light
        var value: String {
            switch self {
            case .bold:
                return Font.bold.rawValue
            case .regular:
                return Font.regular.rawValue
            case .light:
                return Font.light.rawValue
            
            }
        }
    }
    
    enum FontStyle: String {
        case regular
        case bold
        case light
        case semiBold
        static func build(rawValue: String) -> FontStyle {
            return FontStyle(rawValue: rawValue) ?? .regular
        }
    }
    
    var style: FontStyle
    var size: CGFloat

    init(style: FontStyle, size: CGFloat) {
        self.style = style
        self.size = size
    }
    
    static func fontForStyleCode(code: FontStyle, fontSize: CGFloat?) -> UIFont {
        return AppFont(style: code, size: fontSize ?? 14.0).instance
    }
    
    var instance: UIFont {
        var instanceFont: UIFont!
        guard let font = UIFont(name: style.rawValue, size: size) else {
            fatalError("\(style.rawValue) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
        }
        instanceFont = font
        return instanceFont
    }
}
enum Font: String {
    case bold             = "Helvetica-Bold"
    case light            = "Helvetica-Light"
    case regular          = "Helvetica"
    
}
