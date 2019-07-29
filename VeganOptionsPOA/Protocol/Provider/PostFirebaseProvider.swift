//
//  PostFirebaseProvider.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import Foundation
import Firebase

class PostFirebaseProvider: PostProtocol {
    
    let database = Firestore.firestore().collection(EntryPoint.post.rawValue)
    
    func getDocuments(placeId: String, completion: @escaping (Error?, [Data]?) -> Void) {
        var jsonData: [Data] = []
        database.whereField("placeId", isEqualTo: placeId).getDocuments { snapshot, err in
            if let error = err {
                completion(error, nil)
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    if let data = try? JSONSerialization.data(withJSONObject: document.data(), options: .prettyPrinted) {
                        jsonData.append(data)
                    }
                }
            }
            completion(nil, jsonData)
        }
    }
    
    func addDocuments(placeId: String, title: String, postText: String, completion: @escaping (Error?, Bool) -> Void) {
        //TODO: send data to firebase
        database.addDocument(data: ["title": title,
                                    "postText": postText,
                                    "date": getActualDate(),
                                    "user": "1",
                                    "likes": "0",
                                    "placeId": placeId]) { err in
                                        if let failure = err {
                                            completion(failure, false)
                                        } else {
                                            completion(nil, true)
                                        }
        }
    }
    
}
