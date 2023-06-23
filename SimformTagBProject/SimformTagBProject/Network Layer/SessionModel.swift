//
//  SessionModel.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

class SessionModel: Codable {
    
    var accessToken: String?
    var tokenType: String?
    var refreshToken: String?
    var expiresIn: String?
    var chatAccessToken: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case tokenType = "tokenType"
        case refreshToken = "refreshToken"
        case expiresIn = "expiresIn"
        case chatAccessToken = "chatAccessToken"
    }

}
