//
//  APIManager+Error.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

class CustomError: Error {

    // MARK: Vars & Lets
    var title = ""
    var body = ""

    // MARK: Intialization
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }

}

class NetworkError: Codable {

    let message: String
    let code: Int?

}
