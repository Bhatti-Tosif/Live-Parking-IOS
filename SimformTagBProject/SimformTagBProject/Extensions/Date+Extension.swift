//
//  Date+Extension.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 12/06/23.
//

import Foundation

extension Date {
    
    /// give precise current local time string
    var preciseLocalTime: String {
        return Formatter.preciseLocalTime.string(from: self)
    }
    
    /// give precise current UTC time string
    var preciseUTCTime: String {
        return Formatter.preciseUTCTime.string(from: self)
    }
    
    /// give time from string
    static func namedDateTime(dateString: String) -> String {
        return Formatter.namedDateWithTime.string(from: Formatter.preciseUTCTime.date(from: dateString) ?? Date())
    }
    
    /// give time from string
    static func numberedDateTime(dateString: String) -> String {
        return Formatter.numberedDateWithTime.string(from: Formatter.preciseUTCTime.date(from: dateString) ?? Date())
    }
}
