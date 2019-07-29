//
//  PostsListViewModel.swift
//  VeganOptionsPOA
//
//  Created by Camila Legramante Prestes on 24/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import UIKit

protocol PostsListViewModelDelegate: class {
    func updateData()
}

class PostsListViewModel {

    let service: PostServiceProtocol
    var posts: [Post] = []
    var placeId: String!
    
    weak var delegate: PostsListViewModelDelegate?
    
    init(placeId: String) {
        service = PostService()
        fetchPosts(placeId: placeId)
    }
    
    func fetchPosts(placeId: String) {
        service.fetchPosts(identifier: placeId) { error, data in
            if error == nil {
                guard let places = data else { return }
                self.posts = places
            }
            self.delegate?.updateData()
        }
    }
    
    func sendPost(placeId: String, postText: String) {
        // TODO: send post to db
    }

}
