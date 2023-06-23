//
//  MAinCoordinator.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 10/06/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    //MARK: Properties
    var navigationController: UINavigationController
    
    //MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Function
    func start() {
        //Check User Login or Not
        //if yes than open tab Bar Coordinator other wise Authentication Coordinator.
        if userManager.isUserLogin {
            guard let window = getApplicationWindow else { return }
            guard let vc = R.storyboard.dashBoard.dashBoardTabBarController() else { return }
            window.rootViewController = vc
            window.makeKeyAndVisible()
        } else {
            let authCoordinator = AuthenticationCoordinator(navigationController: navigationController)
            authCoordinator.start()
        }
    }
    
}
