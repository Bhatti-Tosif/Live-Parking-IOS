//
//  APIManager+NetworkManger.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Alamofire
import UIKit
import Reachability

/// Network Manger call the register data provide calls data provider methods
protocol NetworkManger {
    
    func call<T>(type: RequestItemsType, params: Parameters?, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable
}
