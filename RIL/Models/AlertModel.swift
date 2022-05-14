//
//  AlertModel.swift
//  RIL
//
//  Created by Shakhawat Hossain Shahin on 12/5/22.
//

import Foundation

struct AlertModel: Encodable, Decodable {
    let lat: String?
    let lon: String?
    let name: String?
    let number: String?
    let postid: String?
    let sosCat: String?
    let sosImage: String?
    let sosMsg: String?
    let time: String?
    let uid: String?
    let userImage: String?
}

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
