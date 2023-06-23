//
//  LoginViewModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 07/06/23.
//

import UIKit

class LoginViewModel: NSObject {

    //MARK: Properties
    internal let customError = Dynamic<String>("")
    internal let loginSuccess = Dynamic<Void>(())
    internal let apiError = Dynamic<String>("")
    internal let validationComplete = Dynamic<Void>(())

    //MARK: - Function
    func loginValidation(loginRequestModal: LoginRequestModal) {
        if loginRequestModal.email.isBlank {
            AlertHelper.showInfoMsg(message: R.string.localizable.emptyEmailValidate())
            customError.value = R.string.localizable.pleaseEnterValidEmail()
        } else if String.isValidEmail(emailString: loginRequestModal.email) {
            AlertHelper.showInfoMsg(message: R.string.localizable.pleaseEnterValidEmail())
            customError.value = R.string.localizable.pleaseEnterValidEmail()
        } else if loginRequestModal.password.isBlank {
            AlertHelper.showInfoMsg(message: R.string.localizable.passwordValidate())
            customError.value = R.string.localizable.passwordValidate()
        } else {
            validationComplete.fire()
            doLogin(loginRequestModal: loginRequestModal)
        }
    }
    
    func doLogin(loginRequestModal: LoginRequestModal) {
        APIManager.shared.call(type: .login, params: loginRequestModal.loginParam()) { [weak self] (result: Result<AuthenticationModelData, CustomError>) in
            
            switch result {
            case .success(let loginValue):
                guard let token = loginValue.authToken, let refreshToken = loginValue.refreshToken, let user = loginValue.user else {
                    return
                }
                debugPrint(user.userId ?? 0)
                userManager.isUserLogin = true
                userManager.accessToken = token
                userManager.userAccountType = user.userType ?? ""
                debugPrint(userManager.userAccountType)
                userManager.refreshToken = refreshToken
                userManager.userEmail = user.email ?? ""
                
                self?.loginSuccess.fire()
                
            case .failure(let error):
                debugPrint("Failure")
                self?.apiError.value = error.body
            }
        }
    }
}

