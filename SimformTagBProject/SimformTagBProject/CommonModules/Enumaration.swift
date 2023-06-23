//
//  Enumaration.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 07/06/23.
//

import Foundation
import UIKit

// Validation regex
public enum RegexType: String {
    case emailValid = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case phoneNumberValid = "+0123456789"
    case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,16}"
}

//MARK: - Account Type
enum AccountType: Int {
    case personal
    case business
}

//MARK: - Base Button Enum
/// Basebutton options
enum BaseButtonOptions: String {
    case appBtnWithMediumFont
    case appBtnWithRegularFont
    case appBtnWithWhiteFontColor
    case whiteBtnWithWhiteBorder
    case whiteBtnWithAppColorFont
    case whiteBtnWithAppColorFontWithMediumFont
    case whiteBtnWithBlackColorFont
    case whiteBtnWithBlackColorFontWithBorder
    case blackBtnWithWhiteFont
    case blackBtnWithWhiteFontWithMediumFont
    case redBtnWithWhiteFont
    case clearBtnWithAppColorFontWithMediumFont
    case clearBtnWithWhiteColorFontWithMediumFontWithWhiteBorder
    case clearBtnWithBlackColorFontWithMediumFont
    case clearBtnWithAppColorFontWithMediumFontWithDashedBorder
    case baseBtn
    case navigationBarButtonWithWhiteFont
    case appBtnWithSemiBoldFont
    case clearBtnWithBlackColorFontWithMediumFontWithBlackBorder
    
    var typeIntValue: Int {
        switch self {
        case .appBtnWithMediumFont:
            return 0
        case .appBtnWithRegularFont:
            return 1
        case .appBtnWithWhiteFontColor:
            return 2
        case .whiteBtnWithWhiteBorder:
            return 3
        case .whiteBtnWithAppColorFont:
            return 4
        case .whiteBtnWithAppColorFontWithMediumFont:
            return 5
        case .whiteBtnWithBlackColorFont:
            return 6
        case .whiteBtnWithBlackColorFontWithBorder:
            return 7
        case .blackBtnWithWhiteFont:
            return 8
        case .blackBtnWithWhiteFontWithMediumFont:
            return 9
        case .redBtnWithWhiteFont:
            return 10
        case .baseBtn:
            return 11
        case .clearBtnWithAppColorFontWithMediumFont:
            return 12
        case .clearBtnWithWhiteColorFontWithMediumFontWithWhiteBorder:
            return 13
        case .clearBtnWithBlackColorFontWithMediumFont:
            return 14
        case .clearBtnWithAppColorFontWithMediumFontWithDashedBorder:
            return 15
        case .navigationBarButtonWithWhiteFont:
            return 16
        case .appBtnWithSemiBoldFont:
            return 17
        case .clearBtnWithBlackColorFontWithMediumFontWithBlackBorder:
            return 18
        }
    }
    
}

/// App Font
enum AppFonts: Int {
    
    case poppinsRegular = 0
    case poppinsMedium = 1
    case poppinsSemiBold = 2
    case poppinsBold = 3
    
    func getFont(withSize size: CGFloat = 18) -> UIFont {
        switch self {
        case .poppinsRegular: return R.font.poppinsRegular(size: size) ?? setRegularSystemFont(size: size)
        case .poppinsMedium: return R.font.poppinsMedium(size: size) ?? setMediumSystemFont(size: size)
        case .poppinsSemiBold: return R.font.poppinsSemiBold(size: size) ?? setSemiBoldSystemFont(size: size)
        case .poppinsBold: return R.font.poppinsBold(size: size) ?? setBoldSystemFont(size: size)
        }
    }
}

/// loading state
enum LodingState {
    case loading
    case empty
    case failure
    case success
}

//MARK: - Base TableView Enum.
enum BaseTableViewDimensions {
    case spacerLabelHeight
    case descriptionPriority
    case stackPlaceholderWidth
    case stackPlaceholderHeight
    case betweenDashesSpace
    case numberOfLines
    case btnEmptyPriority
    case btnEmptyHeight
    
    var value: CGFloat {
        switch self {
        case .spacerLabelHeight:
            return 30
        case .stackPlaceholderWidth:
            return 32
        case .stackPlaceholderHeight:
            return 40
        case .btnEmptyHeight:
            return 40
        default:
            return 0
        }
    }
    
    var contentHuggingPriority: Float {
        switch self {
        case .descriptionPriority:
            return 248
        case .btnEmptyPriority:
            return 251
        default:
            return 250
        }
    }
    
    var lines: Int {
        switch self {
        case .numberOfLines:
            return 2
        default:
            return 0
        }
    }
    
}
