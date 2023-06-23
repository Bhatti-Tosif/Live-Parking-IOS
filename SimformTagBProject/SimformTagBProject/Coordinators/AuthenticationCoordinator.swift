//
//  AuthenticationCoordinator.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 10/06/23.
//

import Foundation
import UIKit

class AuthenticationCoordinator: Coordinator {
    
    //MARK: Properties
    var navigationController: UINavigationController
    
    //MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Function
    func start() {
        guard let window = getApplicationWindow else { return }
        guard let vc = R.storyboard.authenticationModule.onBoardingVC() else { return }
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func gotoHomeVC() {
        guard let window = getApplicationWindow else { return }
        guard let vc = R.storyboard.dashBoard.dashBoardTabBarController() else { return }
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    func gotoLoginVC() {
        guard let vc = R.storyboard.authenticationModule.authLoginVC() else { return }
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func gotoSignUpVC() {
        guard let vc = R.storyboard.authenticationModule.signUpVC() else { return }
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
