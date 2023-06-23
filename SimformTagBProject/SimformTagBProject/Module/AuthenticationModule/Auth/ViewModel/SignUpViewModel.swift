//
//  SignUpViewModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 07/06/23.
//

import Foundation

class SignUpViewModel: NSObject {
    
    //MARK: Properties
    internal let customError = Dynamic<String>("")
    internal let signUpSuccess = Dynamic<Void>(())
    internal let apiError = Dynamic<String>("")
    internal let buttonStartAnimation = Dynamic<Void>(())
    var userInfo: UserInfo?

    //MARK: Properties
    func signUpValidaton(signupRequestModel: SignupRequestModel) {
        if signupRequestModel.email.isBlank {
            AlertHelper.showInfoMsg(message: R.string.localizable.emptyEmailValidate())
        } else if String.isValidEmail(emailString: signupRequestModel.email) {
            AlertHelper.showInfoMsg(message: R.string.localizable.pleaseEnterValidEmail())
        } else if signupRequestModel.firstName.isBlank {
            AlertHelper.showInfoMsg(message: R.string.localizable.firstNameValidate())
        } else if signupRequestModel.lastName.isBlank {
            AlertHelper.showInfoMsg(message: R.string.localizable.lastNameValidate())
        } else if signupRequestModel.password.isBlank {
            AlertHelper.showInfoMsg(message: R.string.localizable.passwordValidate())
        } else if signupRequestModel.mobileNumber.isBlank {
            AlertHelper.showInfoMsg(message: R.string.localizable.mobileNumberValidate())
        } else {
            buttonStartAnimation.fire()
            doSignUpUser(signUpRequestModel: signupRequestModel)
        }
    }
    
    func doSignUpUser(signUpRequestModel: SignupRequestModel) {
        APIManager.shared.call(type: .signUp, params: signUpRequestModel.signUpParam()) { [weak self] (result: Result<AuthenticationModelData, CustomError>) in
            guard let uSelf = self else { return }
            switch result {
            case .success(let loginValue):
                guard let _ = loginValue.authToken, let _ = loginValue.refreshToken, let user = loginValue.user else {
                    return
                }
                uSelf.userInfo = user
                uSelf.signUpSuccess.fire()
            case .failure(let error):
                debugPrint(error.body)
                uSelf.apiError.value = error.body
            }
            
        }
    }
}
