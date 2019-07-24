//
//  PlaceDetailViewModel.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

class PlaceDetailViewModel {
    
    let service: PlaceServiceProtocol
    var data: [Place] = []
    
    init() {
        service = PlaceService()
        fetchPlaces()
    }
    
    func fetchPlaces() {
        service.fetchPlaces { error, data in
            if error == nil {
                guard let places = data else { return }
                self.data = places
            }
        }
    }
    
}
