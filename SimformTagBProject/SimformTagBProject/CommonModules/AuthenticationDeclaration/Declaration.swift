//
//  Declaration.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 06/06/23.
//

import Foundation
import UIKit

// App Level variable
var appDelegate = UIApplication.shared.delegate as? AppDelegate
let apiManager = APIManager.shared
let mainScreenBounds = UIScreen.main.bounds.size
let deviceID = UIDevice.current.identifierForVendor?.uuidString

//typealias AppString = R.string.localizable
typealias VoidCompletion = (() -> Void)
