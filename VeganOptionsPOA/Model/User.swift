//
//  User.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

class User: Codable {
    
    let identifier: String
    let favoritePlaces: [String]
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: UserCodingKeys.self)
        identifier = try values.decode(String.self, forKey: .identifier)
        favoritePlaces = try values.decode([String].self, forKey: .favoritePlaces)
    }
    
}

extension User {
    enum UserCodingKeys: String, CodingKey {
        case identifier = "id"
        case favoritePlaces = "favoritePlaces"
    }
}
