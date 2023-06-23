//
//  APIManager+Request.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Alamofire

// MARK: Extensions
// MARK: EndPointType
enum RequestItemsType {
    case login
    case refreshToken
    case signUp
    case parkingLocation
    case editProfile
    case myProfile
    case getPromoCode
    case leaveOffset(institutId: Int, size: Int, page: Int)
    case deleteParkingLocation
}

// MARK: Extensions
// MARK: EndPointType
extension RequestItemsType: EndPointType {
    
    // MARK: Vars & Lets
    var baseURL: String {
        switch self {
        case .login, .refreshToken, .signUp:
            return AppConstant.authServerURL
        case .editProfile, .myProfile, .getPromoCode, .leaveOffset, .deleteParkingLocation:
            return AppConstant.serverURL
        default:
            return AppConstant.serverURL
        }
    }
    
    var version: String {
        return "v5/"
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/user/login"
        case .signUp:
            return "auth/user/signup"
        case .refreshToken:
            return "auth/user/access-token"
        case .parkingLocation:
            return "user/favourite-location/list-favourite-locations?currentDateTime=2023-06-08T10:37:41Z"
        case .editProfile:
            return "user/edit-profile"
        case .myProfile:
            return "user/my-profile"
        case .getPromoCode:
            return "user/promocode/fetch-promocodes"
        case .leaveOffset(let institutId, let size, let page):
            return "user/institute/\(institutId)/leave/list?size=\(size)&page=\(page)"
        case .deleteParkingLocation:
            return "user/favourite-location/remove-favourite-location"
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return userManager.httpTokenHeader
        }
    }
    
    var url: URL {
        switch self {
        default:
            return URL(string: self.baseURL + self.version + self.path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login, .refreshToken, .signUp, .editProfile:
            return .post
        case .parkingLocation, .myProfile, .getPromoCode, .leaveOffset:
            return .get
        case .deleteParkingLocation:
            return .delete
        }
    }
}
