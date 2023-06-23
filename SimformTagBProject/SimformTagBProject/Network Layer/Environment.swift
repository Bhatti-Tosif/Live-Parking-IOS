//
//  Environment.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

/// AppConstant
public struct AppConstant {
    static let environment = Environment()
    static let serverURL = environment.configuration(PlistKey.serverURL) as? String ?? ""
    static let authServerURL = environment.configuration(PlistKey.authServerURL) as? String ?? ""
}

/// PlistKey
public enum PlistKey {
    case serverURL
    case authServerURL
    
    func value() -> String {
        switch self {
        case .serverURL:
            return "ServerURL"
        case .authServerURL:
            return "AuthServerURL"
        }
    }
    
}

/// Environment
public struct Environment {
    
    /// fetch data from info.plist
    fileprivate var infoDict: [String: Any] {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            } else {
                fatalError("Plist file not found")
            }
        }
    }
    
    /// Provide value from info.plist file
    ///
    /// - Parameter key: Needed key
    /// - Returns: Get value in define datatype(Any you type cast later)
    func configuration(_ key: PlistKey) -> Any {
        switch key {
        case .serverURL:
            return infoDict[PlistKey.serverURL.value()] as? String ?? ""
        case .authServerURL:
            return infoDict[PlistKey.authServerURL.value()] as? String ?? ""
        }
    }
    
}
