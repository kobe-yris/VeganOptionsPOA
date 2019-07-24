//
//  Place.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation
//
//struct Place: Codable {
//    var id: String
//    var name: String
//    var address: String
//    var phone: String
//}

class Place: Codable {
    
    let identifier: String
    let name: String
    var address: String
    let phone: String
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: PlaceCodingKeys.self)
        identifier = try values.decode(String.self, forKey: .identifier)
        name = try values.decode(String.self, forKey: .name)
        address = try values.decode(String.self, forKey: .address)
        phone = try values.decode(String.self, forKey: .phone)
    }
    
}

extension Place {
    enum PlaceCodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "name"
        case address = "address"
        case phone = "phone"
    }
}
