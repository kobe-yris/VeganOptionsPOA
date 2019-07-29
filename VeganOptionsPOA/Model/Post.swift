//
//  Post.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

class Post: Codable {
    
    let title: String
    let postText: String
    let date: String
    let likes: String
    let user: String
    let placeId: String
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: PostCodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        postText = try values.decode(String.self, forKey: .postText)
        date = try values.decode(String.self, forKey: .date)
        likes = try values.decode(String.self, forKey: .likes)
        user = try values.decode(String.self, forKey: .user)
        placeId = try values.decode(String.self, forKey: .placeId)
    }
    
}

extension Post {
    enum PostCodingKeys: String, CodingKey {
        case title = "title"
        case postText = "postText"
        case date = "date"
        case likes = "likes"
        case user = "user"
        case placeId = "placeId"
    }
}
