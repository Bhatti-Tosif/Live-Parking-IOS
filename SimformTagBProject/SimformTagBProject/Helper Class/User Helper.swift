//
//  User Helper.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 06/06/23.
//

import Foundation
import Alamofire

private struct AppConstants {
    // NSUserDefaults persistence keys
    static let isUserLogin          = "isUserLogin"
    static let accessToken          = "accessToken"
    static let refreshToken         = "refreshToken"
    static let deviceToken = "deviceToken"
    static let deviceTokenAsData = "deviceTokenAsData"
    static let isInstituteMember = "isInstituteMember"
}

private struct UserConstants {
    // NSUserDefaults persistence keys
    static let userEmail            = "email"
    static let userPassword         = "password"
    static let isRememberMe         = "isRememberMe"
    static let userId               = "userId"
    static let loginType            = "loginType"
    static let userMobileNumber     = "userMobileNumber"
    static let userPrefixMobileNumber = "userPrefixMobileNumber"
    static let userAccountType      = "userAccountType"
    static let userName = "userName"
}

let userManager = UserManager.shared


internal class UserManager {
    
    // static properties get lazy evaluation and dispatch_once_t for free
    private struct Static {
        static let instance = UserManager()
    }
    
    // this is the Swift way to do singletons
    class var shared: UserManager {
        return Static.instance
    }
    
    // user authentication always begins with a UUID
    private let userDefaults = UserDefaults.standard
    
    let dateFormatter = DateFormatter()
    
    // username etc. are backed by NSUserDefaults, no need for further local storage
    
    var httpTokenHeader: [String: String]? {
        get {
            return [APIHeaderKeys.accept: APIHeaderKeys.applicationJson,
                    APIHeaderKeys.authorization: !(userManager.accessToken.isEmpty) ? "Bearer \(userManager.accessToken)" : "",
                    APIHeaderKeys.contentType: APIHeaderKeys.applicationJson,
                    APIHeaderKeys.appversion: Constants.releaseVersion,
                    APIHeaderKeys.plateform: Constants.deviceType]
        }
    }
    
    var httpPreTokenHeader: [String: String]? {
        get {
            return [APIHeaderKeys.accept: APIHeaderKeys.applicationJson,
                    APIHeaderKeys.appversion: Constants.releaseVersion,
                    APIHeaderKeys.plateform: Constants.deviceType]
        }
    }
    
    var isUserLogin: Bool {
        get {
            return userDefaults.object(forKey: AppConstants.isUserLogin) as? Bool ?? false
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: AppConstants.isUserLogin)
            userDefaults.synchronize()
        }
    }
    
    // user token data
    var accessToken: String {
        get {
            return userDefaults.object(forKey: AppConstants.accessToken) as? String ?? ""
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: AppConstants.accessToken)
            userDefaults.synchronize()
        }
    }
    
    // User ChatId for chatting
    var userName: String {
        get {
            return userDefaults.object(forKey: UserConstants.userName) as? String ?? ""
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: UserConstants.userName)
            userDefaults.synchronize()
        }
    }
    
    // Device token data
    var deviceToken: String {
        get {
            return userDefaults.object(forKey: AppConstants.deviceToken) as? String ?? "Improve this"
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: AppConstants.deviceToken)
            userDefaults.synchronize()
        }
    }
    
    // Device token data
    var deviceTokenAsData: Data {
        get {
            return userDefaults.object(forKey: AppConstants.deviceTokenAsData) as? Data ?? Data()
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: AppConstants.deviceTokenAsData)
            userDefaults.synchronize()
        }
    }
    
    var isRememberMe: Bool {
        get {
            return userDefaults.object(forKey: UserConstants.isRememberMe) as? Bool ?? false
        } set (newValue) {
            userDefaults.set(newValue, forKey: UserConstants.isRememberMe)
            userDefaults.synchronize()
        }
    }
    
    var userEmail: String {
        get {
            return userDefaults.object(forKey: UserConstants.userEmail) as? String ?? ""
        } set (newValue) {
            userDefaults.set(newValue, forKey: UserConstants.userEmail)
            userDefaults.synchronize()
        }
    }

    var userPrefixMobileNumber: String {
        get {
            return userDefaults.object(forKey: UserConstants.userPrefixMobileNumber) as? String ?? ""
        } set (newValue) {
            userDefaults.set(newValue, forKey: UserConstants.userPrefixMobileNumber)
            userDefaults.synchronize()
        }
    }
    
    var userMobileNumber: String {
        get {
            return userDefaults.object(forKey: UserConstants.userMobileNumber) as? String ?? ""
        } set (newValue) {
            userDefaults.set(newValue, forKey: UserConstants.userMobileNumber)
            userDefaults.synchronize()
        }
    }
    
    // user password
    var userPassword: String {
        get {
            return userDefaults.object(forKey: UserConstants.userPassword) as? String ?? ""
        } set (newValue) {
            userDefaults.set(newValue, forKey: UserConstants.userPassword)
            userDefaults.synchronize()
        }
    }
    
    // user refresh token data
    var refreshToken: String {
        get {
            return userDefaults.object(forKey: AppConstants.refreshToken) as? String ?? ""
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: AppConstants.refreshToken)
            userDefaults.synchronize()
        }
    }
    
    
    // User Wallet Balance
    var userAccountType: String {
        get {
            return userDefaults.object(forKey: UserConstants.userAccountType) as? String ?? ""
        } set (newValue) {
            userDefaults.set(newValue, forKey: UserConstants.userAccountType)
            userDefaults.synchronize()
        }
    }
    
    var isInstituteMember: Bool {
        get {
            return userDefaults.object(forKey: AppConstants.isInstituteMember) as? Bool ?? false
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: AppConstants.isInstituteMember)
            userDefaults.synchronize()
        }
    }
    
}

extension UserDefaults {
    
    static func exists(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
}
