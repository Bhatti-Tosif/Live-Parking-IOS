//
//  EditProfileCoordinator.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 10/06/23.
//

import Foundation
import UIKit

class EditProfileCoordinator: Coordinator {
    
    //MARK: -Properties
    var navigationController: UINavigationController
    
    //MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Function
    func start() {
        
    }
    
    func gotoOnBoardingVC() {
        guard let vc = R.storyboard.authenticationModule.onBoardingVC() else { return }
        navigationController.pushViewController(vc, animated: true)
                
    }
    
    func logout() {
        let nc = UINavigationController()
        let authCoordinator = AuthenticationCoordinator(navigationController: nc)
        authCoordinator.start()
    }
    
}
