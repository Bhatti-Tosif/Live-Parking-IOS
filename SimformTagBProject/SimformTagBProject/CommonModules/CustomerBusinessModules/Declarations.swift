//
//  Declarations.swift
//  TagBDemo
//
//  Created by Ami Solani on 12/10/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

// App Level variable
var appDelegate = UIApplication.shared.delegate as? AppDelegate
let apiManager = APIManager.shared
let mainScreenBounds = UIScreen.main.bounds.size
let deviceID = UIDevice.current.identifierForVendor?.uuidString
let urlSchemeForOverTime = "com.tagb"
let urlSchemeForDeepLink = "action/scan"

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
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.appCoordinator = newValue
        }
    }
}

private func getAppCordinator() -> AuthenticationCoordinator? {
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
        return appDelegate.appCoordinator
    }
    return nil
}

func getAppDelegateWindow() -> UIWindow? {
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window {
        return window
    }
    return nil
}

// variable declaration
let dnsKey = "https://fa5911116d44498b8ea7c9c72d41a24b@o272032.ingest.sentry.io/5572414"
let dnsUATkey = "https://cac9bbcbd04d478b95bc1437cde0b6b0@o272032.ingest.sentry.io/6119446"
let txtBorderWidth: CGFloat = 0.4
let txtCornerRadius: CGFloat = 5
let borderWidth: CGFloat = 0.50
let tabBarCornerRadius: CGFloat = 30.0
let tabBarHeightAnchor: CGFloat = 0.120
let cellSpacing: CGFloat = 10
let cellPadding: CGFloat = 16
let locationCellHeight: CGFloat = 138
let defaultRightPadding: CGFloat = 4
let defaultLeftPadding: CGFloat = 7
let googleClientID = "250271936944-dkdo1pjv79prf2n4veq4il7eubmetgl6.apps.googleusercontent.com"
let googleClientIDForUAT = "694753159625-vhsivp6e25mtc2sdtkm96m7e84lf0rms.apps.googleusercontent.com"
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
let googleAPIKeyForDev = "AIzaSyBTNr3BVlgO1NWXXHdbGsnMKlrBS4EOpaA"
let googleAPIKeyForUAT = "AIzaSyC95R4OqfhM2WAWfH7AqXPL5wP2QuApQQ4"
let googleAPIKeyForMapForDev = "AIzaSyCthW7xRwlRDFHsXo3yJXB3tzG8D1sA57Y"
let googleAPIKeyForMapForUAT = "AIzaSyDwXLxt12Ncr1tJkWokBM2NqHeYY5e7oH8"
let googleAPIKeyForUATAndProduction = "AIzaSyCK1LdwR92-pMVPo7pz99YFKpavi2rOcbw"
let googleAPIBaseURL = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo"
let dateMinuteInterval = 15
let fifteenMinIntervalInSec = 900.0
let defualtAlertDismissInterval: Double = 5
let defualtZoomLevel: Float = 11.0
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
let countryUS = "US"
let currencyUS = "USD"
let stripeCardType = "card"
let countries = [AppString.usa()]

//punctuation and special character
let dash = "-"
let comma = ","

func getSideMenuTableViewCellHeight(viewHeight: CGFloat) -> CGFloat {

    switch UIDevice.current.screenType {
    case .iPhones_5_5s_5c_SE:
        return (viewHeight)/7 - 50
    case .iPhones_6_6s_7_8:
        return (viewHeight/7) - 60
    default:
        return (viewHeight/2)/6 - 20
    }
}
