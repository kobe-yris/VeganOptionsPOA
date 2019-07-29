//
//  PostServiceProtocol.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

protocol PostServiceProtocol {
    func fetchPosts(placeId: String, completion: @escaping (Error?, [Post]?) -> Void)
    func sendPost(placeId: String, title: String, postText: String, completion: @escaping (Error?, Bool) -> Void)
}

protocol PostProtocol {
    func getDocuments(placeId: String, completion: @escaping (Error?, [Data]?) -> Void)
    func addDocuments(placeId: String, title: String, postText: String, completion: @escaping (Error?, Bool) -> Void)
}
