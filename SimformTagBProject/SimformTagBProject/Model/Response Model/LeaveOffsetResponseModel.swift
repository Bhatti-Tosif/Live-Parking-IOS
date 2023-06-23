//
//  LeaveOffsetResponseModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import Foundation


struct LeaveOffsetBaseResponseModel: Codable {
    var error: String?
    var message: String?
    var status: Bool?
    var data: LeaveOffSetResponseModel?
    
    enum CodingKeys: String, CodingKey {
        case data
        case error = "error"
        case message = "message"
        case status = "success"
    }
}
struct LeaveOffSetResponseModel: Codable {
    
    let totalRecords: Int?
    let instituteUserLeaveRequestList: [InstituteUserLeaveRequestList]?
    
    enum CodingKeys: String, CodingKey {
        case totalRecords = "totalRecords"
        case instituteUserLeaveRequestList = "instituteUserLeaveRequestList"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalRecords = try container.decodeIfPresent(Int.self, forKey: .totalRecords)
        self.instituteUserLeaveRequestList = try container.decodeIfPresent([InstituteUserLeaveRequestList].self, forKey: .instituteUserLeaveRequestList)
    }
}
struct InstituteUserLeaveRequestList: Codable {
    
    let id: Int?
    let leaveReason: String?
    let leaveStartDate: String?
    let leaveEndDate: String?
    let status: String?
    let actionTakenDate: String?
    let createdAt: String?
    let requestCancelReason: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case leaveReason
        case leaveStartDate
        case leaveEndDate
        case status
        case actionTakenDate
        case createdAt
        case requestCancelReason
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.leaveReason = try container.decodeIfPresent(String.self, forKey: .leaveReason)
        self.leaveStartDate = try container.decodeIfPresent(String.self, forKey: .leaveStartDate)
        self.leaveEndDate = try container.decodeIfPresent(String.self, forKey: .leaveEndDate)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.actionTakenDate = try container.decodeIfPresent(String.self, forKey: .actionTakenDate)
        self.createdAt  = try container.decodeIfPresent(String.self, forKey: .createdAt)
        self.requestCancelReason = try container.decodeIfPresent(String.self, forKey: .requestCancelReason)
    }
    
}
