//
//  Struct.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 07/06/23.
//

import Foundation
import UIKit

struct Constants {
    static let deviceType = "ios"
    static let defaultMimeType = "application/octet-stream"
    static let newLine: Character = "\n"
    static let status = "status"
    static let id = "id"
    static let businessName: String = "Run Parking"
    static let releaseVersion: String = {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }()
    static let ignoreUrl = "ProfileImage/image"
}

struct APIHeaderKeys {
    static let accept = "Accept"
    static let applicationJson = "application/json"
    static let authorization = "Authorization"
    static let contentType = "Content-Type"
    static let timezone = "timezone"
    static let appversion = "appversion"
    static let plateform = "plateform"
    static let applicationUrlEncoded = "application/x-www-form-urlencoded"
}

struct AppBundleId {
    static let attendant: String = "com.simformsolutions.tagBAttendant"
    static let enforcement: String = "com.simformsolutions.tagBDemoEnforcement"
}

struct AppleUserData {
    public var accessToken: String = ""
    public var fullName: String = ""
    public var givenName: String = ""
    public var familyName: String = ""
    public var email: String = ""
}

struct APIParams {
    
    struct Authentication {
        static let refreshToken = "refreshToken"
        static let contentType = "Content-Type"
        static let authorization = "Authorization"
        static let email = "email"
        static let password = "password"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let confirmPassword = "confirmPassword"
        static let signUpType = "signup_type"
        static let socialId = "social_id"
        static let mobileNum = "phone"
        static let phoneNumber = "phoneNumber"
        static let userType = "userType"
        static let newsLetterAlert = "newsLetterAlert"
        static let registrationPlatform = "registrationPlatform"
        static let termsAgreement = "termsAgreement"
        static let fullName = "name"
        static let userToken = "token"
        static let platform = "platform"
        static let deviceId = "deviceId"
        static let loginPlatform = "loginPlatform"
        static let deviceToken = "deviceToken"
        static let phoneExtension = "phoneExtension"
        static let businessName = "businessName"
        static let businessAddress = "address"
    }
    
    struct Profile {
        static let address = "address"
        static let city = "city"
        static let state = "state"
        static let zipcode = "zipcode"
        static let country = "country"
        static let updatedEmail = "updatedEmail"
        static let newEmail = "newEmail"
        static let verificationCode = "code"
        static let otp = "otp"
        static let phoneExtension = "phoneExtension"
        static let photo = "photo"
        static let businessName = "businessName"
        static let isProfilePhotoDelete = "isProfilePhotoDelete"
    }
    
    struct ParkingDetails {
        static let reservationPassId = "reservationPassId"
        static let searchString = "searchString"
        static let entryAfter = "entryAfter"
        static let exitBefore = "exitBefore"
        static let startTime = "startTime"
        static let endTime = "endTime"
        static let start = "start"
        static let end = "end"
        static let singleSpace = "singleSpace"
        static let spaceCount = "spaceCount"
        static let searchMode = "searchMode"
        static let parkingId = "id"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let eventDate = "eventDate"
        static let parkingLotId = "parkingLotId"
        static let currentDate = "currentDate"
        static let currentTime = "currentTime"
        static let specificParkingLotId = "specificParkingLotId"
        static let boundaryLatitude = "boundaryLatitude"
        static let boundaryLongitude = "boundaryLongitude"
        static let currentDateTime = "currentDateTime"
        static let reservationId = "reservationId"
        static let amenities = "amenities"
        static let sortBy = "sortBy"
    }
    
    struct AddParkingRating {
        static let ratings = "ratings"
        static let comment = "comment"
        static let parkingLotId = "parkingLotId"
        static let reservationId = "reservationId"
        static let reservationPassId = "reservationPassId"
    }
    
    struct Logout {
        static let refreshToken = "refreshToken"
    }
    
    struct ReservationList {
        static let currentDateTime = "currentDateTime"
        static let reservationListType = "reservationListType"
        static let reservationType = "reservationType"
        static let startDate = "startDate"
        static let endDate = "endDate"
        static let status = "status"
        static let fromDate = "fromDate"
        static let toDate = "toDate"
        static let isBusiness = "isBusiness"
        static let reservationHistory = "reservationHistory"
        static let slotType = "slotType"
        static let useOnlyWallet = "useOnlyWallet"
        static let useWallet = "useWallet"
    }
    
    struct PromoCode {
        static let promocode = "promocode"
    }
}

