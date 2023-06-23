//
//  EFDeclarations.swift
//  TagBDemo - Enforcement
//
//  Created by Yagnik Suthar on 14/04/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

// App Level variable
var appDelegate = UIApplication.shared.delegate as? EnforcementAppDelegate
let apiManager = APIManager.shared
let mainScreenBounds = UIScreen.main.bounds.size
let deviceID = UIDevice.current.identifierForVendor?.uuidString

// typealias R.swift
typealias AppString = R.string.localizable
typealias AppStoryboard = R.storyboard
typealias AppColor = R.color
typealias AppImage = R.image
typealias AppFont = R.font
typealias AppNib = R.nib
typealias ReuseIdentifiers = R.reuseIdentifier

typealias VoidCompletion = (() -> Void)
typealias BoolCompletion = ((_ success: Bool) -> Void)
typealias IntCompletion = ((_ value: Int) -> Void)
typealias FBUserData = SSFacebookLogin.UserData
typealias GoogleUserData = SSGoogleLogin.UserData

var appCoordinator: AuthenticationCoordinator? {
    get {
        return getAppCordinator()
    } set {
        if let appDelegate = UIApplication.shared.delegate as? EnforcementAppDelegate {
            appDelegate.appCoordinator = newValue
        }
    }
}

private func getAppCordinator() -> AuthenticationCoordinator? {
    if let appDelegate = UIApplication.shared.delegate as? EnforcementAppDelegate {
        return appDelegate.appCoordinator
    }
    return nil
}

func getAppDelegateWindow() -> UIWindow? {
    if let appDelegate = UIApplication.shared.delegate as? EnforcementAppDelegate, let window = appDelegate.window {
        return window
    }
    return nil
}

// variable declaration
let dnsKey = "https://9250d77706e54150a1e72bf1e1692b9c@o272032.ingest.sentry.io/6464785"
let txtBorderWidth: CGFloat = 0.4
let txtCornerRadius: CGFloat = 5
let borderWidth: CGFloat = 0.50
let tabBarCornerRadius: CGFloat = 30.0
let tabBarHeightAnchor: CGFloat = 0.120
let cellSpacing: CGFloat = 10
let cellPadding: CGFloat = 16
let cellHeight: CGFloat = 42
let defaultRightPadding: CGFloat = 4
let defaultLeftPadding: CGFloat = 7
let googleClientID = "512404695273-jjgp0uv83hdjgdvjndugmp10penrtbga.apps.googleusercontent.com"
let radius: CGFloat = 22.0
let headerMsgHeight: CGFloat = 30
let vehicleDetailsCellHeight: CGFloat = 70
let collectionHeight: CGFloat = 200
let mapRegionMeters: Float = 6000
let defaultMapRegionMeters: Float = 100
let btnAppleCornerRadius: CGFloat = 4
let cellCount: Int = 3
let initialCellCount: Int = 2
let viewHeightChangePassword: CGFloat = 74
let paymentCellHeight: CGFloat = 76
let setDynamicAmount: String = "5.0"
let totalSecondsInOneDay = 86400
let googleAPIKey = "AIzaSyBTNr3BVlgO1NWXXHdbGsnMKlrBS4EOpaA"
let googleAPIBaseURL = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo"
let dateMinuteInterval = 15
let fifteenMinIntervalInSec = 900.0
let defualtAlertDismissInterval: Double = 5
let countryUS = "US"
let currencyUS = "USD"
let stripeCardType = "card"
let cellSpacingForCategory: CGFloat = 5
let cellSpacingForNumberedSpace: CGFloat = 15
let heightForCategory: CGFloat = 50
let defaultSpacePartitions: CGFloat = 4
let twelveOClock: Int = 12

//Regex
let phoneNumberAllowedRegex = "[\\s-\\(\\)]"
let regexPhoneNumber3plus = "(\\d{3})(\\d+)"
let numberFormateInBacket3Digit =  "($1) $2"
let regexPhoneNumber334plus = "(\\d{3})(\\d{3})(\\d+)"
let regexPhoneNumberforAppFormate = "($1) $2-$3"
let regexExpDateYearForIntermediateString =  "(\\d{2})(\\d+)"
let regexSeparateStringBySlash = "$1/$2"
let regexForExpDateYearComplete = "(\\d{2})(\\d{4})"
let phoneCallBaseURL = "tel://"
let emailBaseURL = "message://"
let countries = [AppString.usa()]

//punctuation and special character
let dash = "-"
let comma = ","
func getSideMenuTableViewCellHeight(viewHeight: CGFloat) -> CGFloat {

    switch UIDevice.current.screenType {
    case .iPhones_5_5s_5c_SE:
        return (viewHeight)/8 - 40
    case .iPhones_6_6s_7_8:
        return (viewHeight/8) - 50
    default:
        return (viewHeight/2)/5 - 40
    }
}

let clientEnforcement = NXMClient.shared
let isSandBox = AppConstant.isSandBox == Constants.trueString ? true : false
