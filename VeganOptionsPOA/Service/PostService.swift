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
    
    func fetchPlaces(completion: @escaping (Error?, [Post]?) -> Void) {
        var places: [Post] = []
        _ = provider.getDocuments { error, data in
            if let err = error {
                completion(err, nil)
            } else {
                guard let data = data else {
                    return
                }
                for data in data {
                    if let place = try? JSONDecoder.init().decode(Post.self, from: data) {
                        places.append(place)
                    }
                }
            }
            completion(nil, places)
        }
    }
    
}
