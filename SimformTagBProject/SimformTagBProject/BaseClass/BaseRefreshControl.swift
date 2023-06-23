//
//  BaseRefreshControl.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 12/06/23.
//

import UIKit

class BaseRefreshControl: UIRefreshControl {

    // MARK: -
    // MARK: - Variables
    var pulledToRefresh: VoidCompletion!

    // MARK: -
    // MARK: - Functions
    func commonInit() {
        addTarget(self, action: #selector(refreshStart), for: .valueChanged)
        self.tintColor = R.color.deepAqua()
    }

    @objc private func refreshStart() {
        pulledToRefresh()
    }

    // MARK: - override Methods
    override init() {
        super.init()
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

}
