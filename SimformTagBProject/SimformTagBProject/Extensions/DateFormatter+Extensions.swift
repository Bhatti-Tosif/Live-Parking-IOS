//
//  DateFormatter+Extensions.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 12/06/23.
//

import Foundation

extension Formatter {
    
    // precise current local time format
    static let preciseLocalTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter
    }()
    
    //precise current UTC time format
    static let preciseUTCTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter
    }()
    
    //get named date from string
    static let namedDateWithTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter
    }()
    
    //get numbered date from string
    static let numberedDateWithTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter
    }()
}
