//
//  OnBoardingVC.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 10/06/23.
//

import UIKit

class OnBoardingVC: BaseViewController {
    
    //MARK: Properties
    internal var coordinator: AuthenticationCoordinator?
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: InitialSetUpCall
        initialSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavBar()
    }
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        coordinator?.gotoLoginVC()
    }
}

//MARK: Extension for Actions
extension OnBoardingVC {
    
    @IBAction func btnSignUptapped(_sender: UIButton) {
        coordinator?.gotoSignUpVC()
    }
}

//MARK: Extension for Function
extension OnBoardingVC {
    
    func initialSetUp() {
        
    }
    
    func configureNavBar() {
        setNavigationBarHidden(isHidden: true)
        setStatusBarColor(color: .white)
    }
}
