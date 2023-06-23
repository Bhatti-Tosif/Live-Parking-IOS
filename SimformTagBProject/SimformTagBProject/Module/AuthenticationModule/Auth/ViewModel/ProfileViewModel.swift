//
//  ProfileViewModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import Foundation

class ProfileViewModel: NSObject {
    
    //MARK: Properties
    internal let customError = Dynamic<String>("")
    internal let apiError = Dynamic<String>("")
    internal let apiSuccess = Dynamic<Void>(())
    internal let buttonStartAnimation = Dynamic<Void>(())
    var userInfo: UserInfo?
    
    //MARK: - Function
    func fatchProfileData() {
        apiManager.call(type: .myProfile, handler: { [weak self] (result: Result<UserInfo, CustomError>) in
            guard let uSelf = self else { return }
            
            switch result {
            case .success(let userData):
                uSelf.userInfo = userData
                uSelf.apiSuccess.fire()
            case .failure(let error):
                debugPrint(error.body)
                uSelf.apiError.fire()
            }
            
        })
    }
    
    func updateProfile(editProfileModel: EditProfileRequestModel) {
        buttonStartAnimation.fire()
        apiManager.call(type: .editProfile, params: editProfileModel.getEditProfileParam(), handler: { [weak self] (result: Result<AuthenticationModelData, CustomError>) in
            
            guard let uSelf = self else { return }
            switch result {
            case .success(let userData):
                debugPrint(userData.user ?? R.string.localizable.noUser())
                uSelf.apiSuccess.fire()
            case .failure(let error):
                debugPrint(error.body)
                uSelf.apiError.value = error.body
            }
        })
    }
}
