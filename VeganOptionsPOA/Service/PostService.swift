//
//  PostService.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation
import Firebase

class PostService: PostServiceProtocol {
    
    var provider: PostProtocol!
    
    init(provider: PostProtocol = PostFirebaseProvider()) {
        self.provider = provider
    }
    
    func fetchPosts(identifier: String, completion: @escaping (Error?, [Post]?) -> Void) {
        var posts: [Post] = []
        _ = provider.getDocuments(identifier: identifier) { error, data in
            if let err = error {
                completion(err, nil)
            } else {
                guard let data = data else {
                    return
                }
                for data in data {
                    if let post = try? JSONDecoder.init().decode(Post.self, from: data) {
                        posts.append(post)
                    }
                }
            }
            completion(nil, posts)
        }
    }
    
}
