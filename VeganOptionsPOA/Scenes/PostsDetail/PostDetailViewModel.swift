//
//  PlaceDetailViewModel.swift
//  VeganOptionsPOA
//
//  Created by Camila Legramante Prestes on 24/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import UIKit

class PostDetailViewModel {

    let service: PostServiceProtocol
    var data: [Post] = []
    
    init() {
        service = PostService()
        fetchPosts()
    }
    
    func fetchPosts() {
        service.fetchPosts { error, data in
            if error == nil {
                guard let places = data else { return }
                self.data = places
            }
        }
    }

}
