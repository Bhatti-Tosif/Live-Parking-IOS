//
//  RefreshTokenViewModel.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

class RefreshTokenViewModel {
    
    var isSuccess: Dynamic<Bool> = Dynamic(true)

    func callRefreshToken() {
        let params: [String: Any] = [APIParams.Authentication.refreshToken: userManager.refreshToken]
        APIManager.shared.call(type: .refreshToken, params: params) { [weak self] (result: Swift.Result<SessionModel, CustomError>) in
            guard let uSelf = self else {
                return
            }
            switch result {
            case .success(let data):
                guard let token = data.accessToken, let refreshToken = data.refreshToken else {
                    return
                }
                userManager.refreshToken = refreshToken
                userManager.accessToken = token
                uSelf.isSuccess.value = true
            case .failure(let error):
                print(error.body)
                let oldRefreshToken = String(describing: params[APIParams.Authentication.refreshToken] ?? "")
                if  oldRefreshToken == userManager.refreshToken {
//                    appCoordinator?.logout()
                    uSelf.isSuccess.value = false
                } else {
                    uSelf.isSuccess.value = true
                }
            }
        }
    }
    
}
