//
//  ParkingLocationViewModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 08/06/23.
//

import Foundation

class ParkingLocationViewModel {
    
    //MARK: Properties
    var parkingData = DynamicArray<ParkingDetailModelData>([])
    internal let apiSuccess = Dynamic<Void>(())
    internal let deleteSuccess = Dynamic<Void>(())
    internal let deleteFail = Dynamic<Void>(())
    internal let customError = Dynamic<String>("")
    internal let apiError = Dynamic<String>("")
    
    //MARK: - Function
    func fatchparkingDataFromAPI() {
        APIManager.shared.call(type: .parkingLocation, handler:  { [weak self] (result: Result<[ParkingDetailModelData], CustomError>) in
            debugPrint("Parking Response")
            guard let uSelf = self else { return }
            switch result {
            case .success(let parkingDetailData):
                uSelf.parkingData.value = parkingDetailData
                uSelf.apiSuccess.fire()
            case .failure(let error):
                debugPrint(error.body)
            }
            
        })
    }
    
    func deleteParkingLocation(deleteParkingLocationRequestModel: DeleteParkingLocationRequestModel) {
        apiManager.call(type: .deleteParkingLocation, params: deleteParkingLocationRequestModel.getDeletePArkingLocationParam()) { [weak self] (result: Result<DeleteParkingLocationRequestModel, CustomError>) in
                guard let uSelf = self else { return }
                
                switch result {
                case .success(let deleteData):
                    uSelf.deleteSuccess.fire()
                    debugPrint(deleteData.parkingLotId ?? "")
                case .failure(let error):
                    debugPrint(error)
                    uSelf.deleteFail.fire()
                }
        }
    }
}
