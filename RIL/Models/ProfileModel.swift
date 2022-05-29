//
//  ProfileModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 29/5/22.
//

import Foundation

struct ProfileModel: Codable {
    var address: String?
    var emergencyNumber: [String]?
    var mail: String?
    var name: String?
    var notificationId: String?
    var ph: String?
    var pp: String?
    var userId: String?
    var status: Int?
    
    enum CodingKeys: String, CodingKey {
        case address
        case emergencyNumber
        case mail
        case name
        case notificationId = "notification_id"
        case ph
        case pp
        case userId = "user_id"
        case status
    }
}
