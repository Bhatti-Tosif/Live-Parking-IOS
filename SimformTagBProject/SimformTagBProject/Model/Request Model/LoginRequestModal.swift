//
//  LoginRequestModal.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 06/06/23.
//

import Foundation
import UIKit

struct LoginRequestModal {
    var email: String
    var password: String
    var userType: String
    
    func loginParam() -> [String: Any] {
        var loginParam: [String: Any] = [:]
        loginParam[APIParams.Authentication.email] = email.trimmed()
        loginParam[APIParams.Authentication.password] = password.trimmed()
        loginParam[APIParams.Authentication.userType] = userType
        return loginParam
    }
}
