//
//  AttendantDelarations.swift
//  TagBDemo - Attendant
//
//  Created by Ami Solani on 22/01/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

// App Level variable
var appDelegate = UIApplication.shared.delegate as? AttendantAppDelegate
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
        if let appDelegate = UIApplication.shared.delegate as? AttendantAppDelegate {
            appDelegate.appCoordinator = newValue
        }
    }
}

private func getAppCordinator() -> AuthenticationCoordinator? {
    if let appDelegate = UIApplication.shared.delegate as? AttendantAppDelegate {
        return appDelegate.appCoordinator
    }
    return nil
}

func getAppDelegateWindow() -> UIWindow? {
    if let appDelegate = UIApplication.shared.delegate as? AttendantAppDelegate, let window = appDelegate.window {
        return window
    }
    return nil
}

// variable declaration
let dnsKey = "https://fa5911116d44498b8ea7c9c72d41a24b@o272032.ingest.sentry.io/5572414"
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

//punctuation and special character
let dash = "-"
let comma = ","

