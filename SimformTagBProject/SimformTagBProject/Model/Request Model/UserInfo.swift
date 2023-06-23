//
//  UserModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 07/06/23.
//

import Foundation

struct UserInfo: Codable {
    
    let userId: Int?
    let lastName: String?
    let userType: String?
    let email: String?
    let registrationPlatform: String?
    let isActive: Bool?
    let firstName: String?
    let address: Address?
    let businessName: String?
    let photo: String?
    let phoneNumber: String?
    var fullName: String?
    var walletBalance: String?
    var phoneCountryCode: String?
    var phoneWithPrefix: String?
    let isInstituteMember: Bool?
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case lastName = "last_name"
        case userType = "user_type"
        case email = "email"
        case registrationPlatform = "registration_platform"
        case isActive = "isActive"
        case firstName = "first_name"
        case address = "address"
        case businessName = "business_name"
        case photo = "photo"
        case phoneNumber = "phone_number"
        case walletBalance = "wallet_balance"
        case phoneCountryCode = "phone_country_code"
        case isInstituteMember = "isInstituteMember"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        userType = try values.decodeIfPresent(String.self, forKey: .userType)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        registrationPlatform = try values.decodeIfPresent(String.self, forKey: .registrationPlatform)
        isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        address = try values.decodeIfPresent(Address.self, forKey: .address)
        businessName = try values.decodeIfPresent(String.self, forKey: .businessName)
        photo = try values.decodeIfPresent(String.self, forKey: .photo)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        walletBalance = try values.decodeIfPresent(String.self, forKey: .walletBalance)
        phoneCountryCode = try values.decodeIfPresent(String.self, forKey: .phoneCountryCode)
        userManager.userName = "\(firstName ?? "") \(lastName ?? "")"
        isInstituteMember = try values.decodeIfPresent(Bool.self, forKey: .isInstituteMember)
    }
}

struct Address: Codable {
    let id: Int?
    let addressLine1: String?
    let addressLine2: String?
    let city: String?
    let state: String?
    let zipcode: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case addressLine1 = "addressLine1"
        case addressLine2 = "addressLine2"
        case city = "city"
        case state = "state"
        case zipcode = "zipcode"
        case country = "country"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey:.id)
        addressLine1 = try values.decodeIfPresent(String.self, forKey: .addressLine1)
        addressLine2 = try values.decodeIfPresent(String.self, forKey: .addressLine2)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
        country = try values.decodeIfPresent(String.self, forKey: .country)
    }
}
