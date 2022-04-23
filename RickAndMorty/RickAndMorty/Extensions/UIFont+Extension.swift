//
//  UIFont+Extension.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import UIKit

struct AppFont {
    enum FontStyle: String {
        case bold             = "bold"
        case light            = "light"
        case regular          = "regular"
        
        var font: String {
            switch self {
            case .bold:
                return "Helvetica-Bold"
            case .light:
                return "Helvetica-Light"
            case .regular:
                return "Helvetica"
            }
        }
    }
   
    var fontStyle: FontStyle
    var size: CGFloat

    init(fontStyle: FontStyle, size: CGFloat) {
        self.fontStyle = fontStyle
        self.size = size
    }
    
    static func fontForFontName(font: FontStyle, fontSize: CGFloat?) -> UIFont {
        return AppFont(fontStyle: font, size: fontSize ?? 14).instance
    }
    
    var instance: UIFont {
        var instanceFont: UIFont!
        guard let font = UIFont(name: fontStyle.font, size: size) else {
            fatalError("\(fontStyle.rawValue) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
        }
        instanceFont = font
        return instanceFont
    }
}

