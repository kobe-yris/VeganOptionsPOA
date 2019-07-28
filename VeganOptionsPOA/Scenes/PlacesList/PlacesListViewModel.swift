//
//  File.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 27/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

protocol PlacesListViewModelDelegate: class {
    func updateData()
}

class PlacesListViewModel {
    
    let service: PlaceServiceProtocol
    var places: [Place] = []
    
    weak var delegate: PlacesListViewModelDelegate?
    
    init() {
        service = PlaceService()
        fetchPlaces()
    }
    
    func fetchPlaces() {
        service.fetchPlaces { error, data in
            if error == nil {
                guard let places = data else { return }
                self.places = places
            }
            self.delegate?.updateData()
        }
    }
    
}
