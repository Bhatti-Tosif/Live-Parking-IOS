//
//  DynamicAsync.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

class DynamicAsync<T>: Dynamic<T> {

    // MARK: Ovverides

    override func fire() {
        self.listener?(self.value)
        // -->{ self.listener?(self.value) }
    }

    // MARK: Initialization

    override init(_ v: T) {
        super.init(v)
    }
}
