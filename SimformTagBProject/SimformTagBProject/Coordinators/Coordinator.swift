//
//  Coordinator.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 10/06/23.
//

import Foundation
import UIKit

//MARK: - Start Coordinator from here.
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
