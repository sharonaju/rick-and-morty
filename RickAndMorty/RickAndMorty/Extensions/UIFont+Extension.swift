//
//  UIFont+Extension.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import UIKit

struct AppFont {
    enum FontStyle: String {
        case bold             = "Helvetica-Bold"
        case light            = "Helvetica-Light"
        case regular          = "Helvetica"
    }
   
    var fontName: FontStyle
    var size: CGFloat

    init(fontName: FontStyle, size: CGFloat) {
        self.fontName = fontName
        self.size = size
    }
    
    static func fontForFontName(font: FontStyle, fontSize: CGFloat?) -> UIFont {
        return AppFont(fontName: font, size: fontSize ?? 14).instance
    }
    
    var instance: UIFont {
        var instanceFont: UIFont!
        guard let font = UIFont(name: fontName.rawValue, size: size) else {
            fatalError("\(fontName.rawValue) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
        }
        instanceFont = font
        return instanceFont
    }
}

