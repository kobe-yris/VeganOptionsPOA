//
//  PlaceService.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation
import Firebase

class PlaceService: PlaceServiceProtocol {
    
    var provider: PlaceProtocol!
    
    init(provider: PlaceProtocol = PlaceFirebaseProvider()) {
        self.provider = provider
    }
    
    func fetchPlaces(completion: @escaping (Error?, [Place]?) -> Void) {
        var places: [Place] = []
        _ = provider.getDocuments { error, data in
            if let err = error {
                completion(err, nil)
            } else {
                guard let data = data else {
                    return
                }
                for data in data {
                    if let place = try? JSONDecoder.init().decode(Place.self, from: data) {
                        places.append(place)
                    }
                }
            }
            completion(nil, places)
        }
    }
    
}
