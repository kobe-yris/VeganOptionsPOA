//
//  PlaceServiceProtocol.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation

protocol PlaceServiceProtocol {
    func fetchPlaces(completion: @escaping (Error?, [Place]?) -> Void)
}

protocol PlaceProtocol {
    func getDocuments(completion: @escaping (Error?, [Data]?) -> Void)
}
