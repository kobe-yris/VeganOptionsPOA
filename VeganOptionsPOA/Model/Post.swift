//
//  Post.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

struct Post: Codable {
    var id: String
    var title: String
    var postText: String
    var date: String
    var likes: Int
    var user: String
}
