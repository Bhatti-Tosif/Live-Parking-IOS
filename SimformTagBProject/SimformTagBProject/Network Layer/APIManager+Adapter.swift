//
//  APIManager+Adapter.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import UIKit
import Alamofire

class APIManagerAdapter: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        if (urlRequest.url?.absoluteString.contains(Constants.ignoreUrl) ?? false) || (urlRequest.url?.absoluteString.contains("profile") ?? false) || (urlRequest.url?.absoluteString.contains("parking/details") ?? false) || (urlRequest.url?.absoluteString.contains("parking/external") ?? false) || (urlRequest.url?.absoluteString.contains("parking/citation") ?? false) || (urlRequest.url?.absoluteString.contains("enforcement/issue") ?? false) || (urlRequest.url?.absoluteString.contains("chat/profile") ?? false) ||
            (urlRequest.url?.absoluteString.contains("/Query") ?? false) ||
            (urlRequest.url?.absoluteString.contains("citation/dispute") ?? false) ||
            (urlRequest.url?.absoluteString.contains("worker/checkoutDocument") ?? false) {
            return urlRequest
        }
        var newRequest = urlRequest
        newRequest.setValue("Bearer \(userManager.accessToken)", forHTTPHeaderField: APIParams.Authentication.authorization)
        
//        if (urlRequest.url?.absoluteString.contains(RequestItemsType.makePaymentWithCardOnStripe.path) ?? false) {
//            newRequest.setValue("Basic \(StripPaymentGatewayKeys.getBase64())", forHTTPHeaderField: APIParams.Authentication.authorization)
//        }
        
        return newRequest
        
    }
    
}
