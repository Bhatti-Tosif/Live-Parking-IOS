//
//  BaseButton.swift
//  TagBDemo
//
//  Created by Ami Solani on 13/10/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd. All rights reserved.
//

import Foundation
import SSSpinnerButton
import UIKit

class BaseButton: SSSpinnerButton {
    
    // MARK: - IBInspectables
    @IBInspectable var type: Int = BaseButtonOptions.baseBtn.typeIntValue {
        didSet {
            setupAppearance()
        }
    }

    @IBInspectable var fontFamily: Int = 2 {
        didSet {
            setFont()
        }
    }

    @IBInspectable var fontSize: CGFloat = 14 {
        didSet {
            setFont()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearance()
        setFont()
    }

    // MARK: - Functions
    private func setupAppearance() {
        fontSize = 14
        fontFamily = 2
        layer.cornerRadius = 4
        switch type {
        case BaseButtonOptions.baseBtn.typeIntValue:
            fontSize = 14
            fontFamily = 2
            layer.cornerRadius = 4
        case BaseButtonOptions.appBtnWithMediumFont.typeIntValue:
            setTitleColor(UIColor.white, for: .normal)
            fontFamily = 1
        case BaseButtonOptions.appBtnWithSemiBoldFont.typeIntValue:
            setTitleColor(UIColor.white, for: .normal)
            fontFamily = 3
        case BaseButtonOptions.appBtnWithRegularFont.typeIntValue:
            setTitleColor(UIColor.white, for: .normal)
            fontFamily = 0
        case BaseButtonOptions.appBtnWithWhiteFontColor.typeIntValue:
            setTitleColor(UIColor.white, for: .normal)
        case BaseButtonOptions.whiteBtnWithWhiteBorder.typeIntValue:
            backgroundColor = .clear
            setTitleColor(.white, for: .normal)
            layer.borderWidth = 1
            layer.borderColor = UIColor.white.cgColor
        case BaseButtonOptions.whiteBtnWithAppColorFont.typeIntValue:
            backgroundColor = UIColor.white
        case BaseButtonOptions.whiteBtnWithAppColorFontWithMediumFont.typeIntValue:
            fontFamily = 1
            backgroundColor = UIColor.white
        case BaseButtonOptions.whiteBtnWithBlackColorFont.typeIntValue:
            backgroundColor = UIColor.white
            setTitleColor(R.color.blackColor(), for: .normal)
        case BaseButtonOptions.whiteBtnWithBlackColorFontWithBorder.typeIntValue:
            backgroundColor = UIColor.white
            setTitleColor(R.color.blackColor(), for: .normal)
            layer.borderWidth = 1
            layer.borderColor = UIColor.black.cgColor
        case BaseButtonOptions.blackBtnWithWhiteFont.typeIntValue:
            backgroundColor = R.color.blackColor()
            setTitleColor(.white, for: .normal)
        case BaseButtonOptions.blackBtnWithWhiteFontWithMediumFont.typeIntValue:
            backgroundColor = R.color.blackColor()
            setTitleColor(.white, for: .normal)
            fontFamily = 1
        case BaseButtonOptions.redBtnWithWhiteFont.typeIntValue:
            backgroundColor = R.color.reddidh()
            setTitleColor(UIColor.white, for: .normal)
        case BaseButtonOptions.clearBtnWithAppColorFontWithMediumFont.typeIntValue:
            fontFamily = 1
            backgroundColor = UIColor.clear
        case BaseButtonOptions.clearBtnWithWhiteColorFontWithMediumFontWithWhiteBorder.typeIntValue:
            fontFamily = 1
            backgroundColor = UIColor.clear
            layer.borderWidth = 1
            layer.borderColor = UIColor.white.cgColor
            setTitleColor(.white, for: .normal)
        case BaseButtonOptions.clearBtnWithBlackColorFontWithMediumFontWithBlackBorder.typeIntValue:
            fontFamily = 1
            backgroundColor = UIColor.clear
            layer.borderWidth = 1
            layer.borderColor = UIColor.black.cgColor
            setTitleColor(.black, for: .normal)
        case BaseButtonOptions.clearBtnWithBlackColorFontWithMediumFont.typeIntValue:
            fontFamily = 1
            backgroundColor = UIColor.clear
            setTitleColor(R.color.blackColor(), for: .normal)
        case BaseButtonOptions.clearBtnWithAppColorFontWithMediumFontWithDashedBorder.typeIntValue:
            fontFamily = 1
            backgroundColor = .clear
        case BaseButtonOptions.navigationBarButtonWithWhiteFont.typeIntValue:
            backgroundColor = .clear
            setTitleColor(UIColor.white, for: .normal)
            fontFamily = 1
            fontSize = 16
        case BaseButtonOptions.appBtnWithSemiBoldFont.typeIntValue:
            setTitleColor(UIColor.white, for: .normal)
            fontFamily = 3
        default: break
        }
    }

    private func setFont() {
        if let selectedFont = AppFonts(rawValue: fontFamily) {
            titleLabel?.font = selectedFont.getFont(withSize: fontSize)
        }
    }
    
}

// MARK: - Event Handling Functions
extension SSSpinnerButton {
    
    internal func startAnimation(color: UIColor = .white, blockUI: Bool = true, completion: (() -> Void)?) {
        self.startAnimate(spinnercolor: color) {
            appDelegate?.window?.isUserInteractionEnabled = !blockUI
            completion?()
        }
    }
    
    internal func stopAnimation(completion: (() -> Void)?) {
        self.stopAnimate {
            appDelegate?.window?.isUserInteractionEnabled = true
            completion?()
        }
    }
    
    internal func stopAnimationSuccess(backToDefaults: Bool = true, completion: (() -> Void)?) {
        self.stopAnimationWithCompletionTypeAndBackToDefaults(completionType: .success, backToDefaults: backToDefaults) {
            appDelegate?.window?.isUserInteractionEnabled = true
            completion?()
        }
    }
    
    internal func stopAnimationFailure(backToDefaults: Bool = true, completion: (() -> Void)?) {
        self.stopAnimationWithCompletionTypeAndBackToDefaults(completionType: .fail, backToDefaults: backToDefaults) {
            appDelegate?.window?.isUserInteractionEnabled = true
            completion?()
        }
    }
    
}
