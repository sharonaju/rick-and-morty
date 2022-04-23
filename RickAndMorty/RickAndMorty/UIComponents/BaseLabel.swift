//
//  BaseLabel.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 23/04/2022.
//

import UIKit

class BaseLabel: UILabel {

    @IBInspectable var textColorCode: String = AppColor.ColorCode.primaryTextColor.rawValue {
        didSet {
            setTextColorFromCode()
        }
    }

    @IBInspectable var textFontStyle: String = AppFont.FontStyle.regular.rawValue {
        didSet {
            setFontStyle()
        }
    }

    @IBInspectable var fontSize: CGFloat = 14.0 {
        didSet {
            setFontStyle()
        }
    }

    func setTextColorFromCode() {
        let code = AppColor.ColorCode.build(rawValue: textColorCode)
        textColor = AppColor.colorForCode(code, customColor: textColor)
    }

    func setFontStyle() {
        let code = AppFont.FontStyle.build(rawValue: textFontStyle)
        font = AppFont.fontForStyleCode(code: code, fontSize: fontSize)
    }
}
