//
//  DeleteParkingLocationRequestModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import Foundation

struct DeleteParkingLocationRequestModel: Codable {
    
    let parkingLotId: Int?
    
    enum CodingKeys: String, CodingKey {
        case parkingLotId
    }
    
    func getDeletePArkingLocationParam() -> [String: Any] {
        var param: [String: Any] = [:]
        param[APIParams.AddParkingRating.parkingLotId] = parkingLotId
        
        return param
    }
}
