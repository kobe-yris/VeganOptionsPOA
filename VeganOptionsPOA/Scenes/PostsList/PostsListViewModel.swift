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
        service.fetchPosts(placeId: placeId) { error, data in
            if error == nil {
                guard let places = data else { return }
                self.posts = places
            }
            self.delegate?.updateData()
        }
    }
    
    func sendPost(placeId: String, title: String, postText: String) -> Bool {
        var status = true
        service.sendPost(placeId: placeId, title: title, postText: postText) { error, stats in
            status = stats
            if status {
                self.fetchPosts(placeId: placeId)
            }
        }
        return status
    }

}
