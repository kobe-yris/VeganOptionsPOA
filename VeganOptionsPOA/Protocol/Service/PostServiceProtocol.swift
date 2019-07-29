//
//  PostServiceProtocol.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

protocol PostServiceProtocol {
    func fetchPosts(identifier: String, completion: @escaping (Error?, [Post]?) -> Void)
}

protocol PostProtocol {
    func getDocuments(identifier: String, completion: @escaping (Error?, [Data]?) -> Void)
}
