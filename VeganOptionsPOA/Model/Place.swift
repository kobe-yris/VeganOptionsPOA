//
//  Place.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

class Place: Codable {
    
    let identifier: String
    let name: String
    let address: String
    let phone: String
    let description: String
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: PlaceCodingKeys.self)
        identifier = try values.decode(String.self, forKey: .identifier)
        name = try values.decode(String.self, forKey: .name)
        address = try values.decode(String.self, forKey: .address)
        phone = try values.decode(String.self, forKey: .phone)
        description = try values.decode(String.self, forKey: .description)
    }
    
}

extension Place {
    enum PlaceCodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "name"
        case address = "address"
        case phone = "phone"
        case description = "description"
    }
}
