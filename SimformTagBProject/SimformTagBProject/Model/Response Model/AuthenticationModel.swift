//
//  AuthenticationModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 07/06/23.
//

import Foundation

struct AuthenticationBaseModel: Codable {
    
    var error: String?
    var message: String?
    var status: Bool?
    var data: AuthenticationModelData?
    
    enum CodingKeys: String, CodingKey {
        case data
        case error = "error"
        case message = "message"
        case status = "success"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try AuthenticationModelData(from: decoder)
        error = try values.decodeIfPresent(String.self, forKey: .error)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
    }
    
}

struct AuthenticationModelData: Codable {
    let user: UserInfo?
    let refreshToken: String?
    let authToken: String?
    
    enum CodingKeys: String, CodingKey {
        case user = "User"
        case refreshToken = "refreshToken"
        case authToken = "authToken"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user = try values.decodeIfPresent(UserInfo.self, forKey: .user)
        refreshToken = try values.decodeIfPresent(String.self, forKey: .refreshToken)
        authToken = try values.decodeIfPresent(String.self, forKey: .authToken)
    }
    
}
