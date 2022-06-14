//
//  AlertModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 12/5/22.
//

import Foundation

struct AlertModel: Encodable, Decodable, Identifiable {
    let id: String?
    let lat: String?
    let lon: String?
    let name: String?
    let number: String?
//    let postid: String?
    let sosCat: String?
    let sosImage: String?
    let sosMsg: String?
    let time: String?
    let uid: String?
    let userImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "postid"
        case lat
        case lon
        case name
        case number
//        case postid
        case sosCat
        case sosImage
        case sosMsg
        case time
        case uid
        case userImage
    }
}

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
