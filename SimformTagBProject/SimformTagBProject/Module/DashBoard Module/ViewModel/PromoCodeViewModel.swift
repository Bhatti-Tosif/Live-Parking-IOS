//
//  PromoCodeViewModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import Foundation

class PromoCodeViewModel: NSObject {
    
    //MARK: Properties
    internal let customError = Dynamic<String>("")
    internal let apiError = Dynamic<String>("")
    internal let apiSuccess = Dynamic<Void>(())
    internal let promoCodeData = DynamicArray<PromoCodeResponseModel>([])

    //MARK: - Function
    func fatchPromoCode() {
        apiManager.call(type: .getPromoCode, handler: { [weak self] (result: Result<[PromoCodeResponseModel], CustomError>) in
            guard let uSelf = self else { return }
            switch result {
            case .success(let promoCodeData):
                uSelf.promoCodeData.value = promoCodeData
                uSelf.apiSuccess.fire()
            case .failure(let error):
                debugPrint(error)
            }
            
        })
    }
}
