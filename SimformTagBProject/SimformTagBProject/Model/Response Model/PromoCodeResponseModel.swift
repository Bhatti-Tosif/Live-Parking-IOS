//
//  PromoCodeResponseModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import Foundation

struct PromoCodeResponseModel: Codable {
   
    let id: Int
    let couponName: String
    let couponCode: String
    let discountType: String
    let discountValue: String
    let maxDiscount: String
    let startDate: String
    let expiryDate: String
    let usageLimit: Int
    let active: Bool
   
   enum CodingKeys: String, CodingKey {
       case id
       case couponName
       case couponCode
       case discountType
       case discountValue
       case maxDiscount
       case startDate
       case expiryDate
       case usageLimit
       case active
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.couponName = try container.decode(String.self, forKey: .couponName)
        self.couponCode = try container.decode(String.self, forKey: .couponCode)
        self.discountType = try container.decode(String.self, forKey: .discountType)
        self.discountValue = try container.decode(String.self, forKey: .discountValue)
        self.maxDiscount = try container.decode(String.self, forKey: .maxDiscount)
        self.startDate  = try container.decode(String.self, forKey: .startDate)
        self.expiryDate = try container.decode(String.self, forKey: .expiryDate)
        self.usageLimit = try container.decode(Int.self, forKey: .usageLimit)
        self.active = try container.decode(Bool.self, forKey: .active)
    }
    
    func getFullName() -> String {
        return "get \(discountValue)\(discountType) off:  coupon Code:- \(couponCode)"
    }
}
