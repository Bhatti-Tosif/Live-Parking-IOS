//
//  SignupRequestModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 07/06/23.
//

import Foundation

struct SignupRequestModel {
    
    var firstName: String
    var lastName: String
    var email: String
    var mobileNumber: String
    var password: String
    var businessName: String = "Developer"
    var businessAddress: String = "simform"
    var country: String = "India"
    var state: String = "Gujarat"
    var city: String = "Ahmedabad"
    var zipCode: String = "333310"
    var userType: String = "business"
    var newsLetterAlert: Bool = true
    var registrationPlatform: String = "email"
    var termsAgreement: Bool = true
    var platform: String = "IOS"
    var deviceId: String = deviceID ?? ""
    var deviceToken: String = userManager.deviceToken
    var phoneExtension: String = "Yes"
    
    func signUpParam() -> [String: Any] {
        var signUpParam: [String: Any] = [:]
        signUpParam[APIParams.Authentication.firstName] = firstName.trimmed()
        signUpParam[APIParams.Authentication.lastName] = lastName.trimmed()
        signUpParam[APIParams.Authentication.email] = email.trimmed()
        signUpParam[APIParams.Authentication.mobileNum] = mobileNumber.trimmed()
        signUpParam[APIParams.Authentication.password] = password.trimmed()

        if userType == "business" {
            signUpParam[APIParams.Authentication.businessName] = businessName.trimmed()
            signUpParam[APIParams.Authentication.businessAddress] = businessAddress.trimmed()
            signUpParam[APIParams.Profile.country] = country.trimmed()
            signUpParam[APIParams.Profile.state] = state.trimmed()
            signUpParam[APIParams.Profile.city] = city.trimmed()
            signUpParam[APIParams.Profile.zipcode] = zipCode.trimmed()
        }

        signUpParam[APIParams.Authentication.userType] = userType.trimmed()
        signUpParam[APIParams.Authentication.newsLetterAlert] = newsLetterAlert
        signUpParam[APIParams.Authentication.registrationPlatform] = registrationPlatform.lowercased().trimmed()
        signUpParam[APIParams.Authentication.termsAgreement] = termsAgreement
        signUpParam[APIParams.Authentication.platform] = platform.trimmed()
        signUpParam[APIParams.Authentication.deviceId] = deviceId.trimmed()
        signUpParam[APIParams.Authentication.deviceToken] = deviceToken.trimmed()
        signUpParam[APIParams.Authentication.phoneExtension] = phoneExtension.trimmed()
        return signUpParam
    }
    
}
