//
//  APIManager+FakeDataProvider.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Alamofire
import UIKit
import Reachability

/// Provide fake data to controller
class FakeDataProvider: NetworkManger {
    
    func call<T>(type: RequestItemsType, params: Parameters?, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable {
        handler(.failure(CustomError(title: R.string.localizable.appName(), body: APIError.noData)))
    }
    
}
