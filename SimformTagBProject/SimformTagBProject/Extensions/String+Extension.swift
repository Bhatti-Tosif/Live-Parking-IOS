//
//  String+Extension.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 07/06/23.
//

import Foundation

extension String {
    
    /// Validet Email
    ///
    /// - Parameter testStr: email string
    /// - Returns: is email is valid or not in boolen
    static func isValidEmail(emailString: String) -> Bool {
        let emailRegEx = RegexType.emailValid.rawValue
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return !emailTest.evaluate(with: emailString)
    }
    
    /// Returns trimmed value
    func trimmed() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // Check string is blank or not
    var isBlank: Bool {
        return self.trimmed().isEmpty
    }
}
