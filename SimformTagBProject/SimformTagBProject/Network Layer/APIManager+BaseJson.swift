//
//  APIManager+BaseJson.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

/// This is base json model of codable type
/// In throught app response base model will be same.
class BaseJsonModel<T: Codable>: Codable {
    let success: Bool
    let data: T
    let message: String
}
