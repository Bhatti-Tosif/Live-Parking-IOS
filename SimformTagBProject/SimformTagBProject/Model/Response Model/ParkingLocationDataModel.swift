//
//  ParkingLocationDataModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 08/06/23.
//

import Foundation

struct ParkingLocationBaseModel: Codable {
    
    var message: String?
    var success: Bool?
    var data: ParkingDetailModelData?
    var error: String?
    
    enum CodingKeys: String, CodingKey {
        case data
        case message = "message"
        case success = "success"
        case error = "error"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try ParkingDetailModelData(from: decoder)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }
}

class ParkingDetailModelData: Codable {
    
    let uniqueId: Int
    let parkingLot: ParkingLotInfo?
    
    enum CodingKeys: String, CodingKey {
        case uniqueId = "user_id"
        case parkingLot = "parkingLot"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uniqueId = try container.decode(Int.self, forKey: .uniqueId)
        self.parkingLot = try container.decodeIfPresent(ParkingLotInfo.self, forKey: .parkingLot)
    }
    
}

struct ParkingLotInfo: Codable {
    let id: Int?
    let name: String?
    let parkingImageInfo: ParkingLotImage?
    let address: Address?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case address = "Address"
        case parkingImageInfo = "Parking_Lot_Info"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.address = try container.decodeIfPresent(Address.self, forKey: .address)
        self.parkingImageInfo = try container.decodeIfPresent(ParkingLotImage.self, forKey: .parkingImageInfo)
    }
}

struct ParkingLotImage: Codable {
    let image: String?
    enum CodingKeys: String, CodingKey {
        case image = "photo"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
    }
}
