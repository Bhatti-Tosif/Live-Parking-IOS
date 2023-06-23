//
//  EditProfileRequestModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import Foundation

struct EditProfileRequestModel {
    
    var firstName: String
    var lastName: String
    var address: String  = "dhg"
    var city: String = "ahmedabad"
    var state: String = "gujarat"
    var zip: String = "38001"
    var country: String = "India"
    var mobileNumber: String
    var phoneExtension: String = "+91"
    var photo: String = "photo"
    var businessName: String = "abc"
    var userType: String = "business"
    
    func getEditProfileParam() -> [String: Any] {
        var param: [String: Any] = [:]
        param[APIParams.Authentication.firstName] = firstName.trimmed()
        param[APIParams.Authentication.lastName] = lastName.trimmed()
        param[APIParams.Authentication.businessName] = businessName.trimmed()
        param[APIParams.Profile.address] = address.trimmed()
        param[APIParams.Profile.city] = city.trimmed()
        param[APIParams.Profile.state] = state.trimmed()
        param[APIParams.Profile.zipcode] = zip.trimmed()
        param[APIParams.Profile.country] = country.trimmed()
        param[APIParams.Authentication.mobileNum] = mobileNumber.trimmed()
        param[APIParams.Authentication.phoneExtension] = phoneExtension.trimmed()
        if !businessName.isEmpty {
            param[APIParams.Profile.businessName] = businessName.trimmed()
        }
        return param
    }
}
