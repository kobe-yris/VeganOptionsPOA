//
//  Report.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

class Report: Codable {
    
    let identifier: String
    let postId: String
    var user: String
    let userReported: String
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ReportCodingKeys.self)
        identifier = try values.decode(String.self, forKey: .identifier)
        postId = try values.decode(String.self, forKey: .postId)
        user = try values.decode(String.self, forKey: .user)
        userReported = try values.decode(String.self, forKey: .userReported)
    }
    
}

extension Report {
    enum ReportCodingKeys: String, CodingKey {
        case identifier = "id"
        case postId = "postId"
        case user = "user"
        case userReported = "userReported"
    }
}
