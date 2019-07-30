//
//  ViewController.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import UIKit

class PlaceDetailController: UIViewController {
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeDescription: UITextView!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var placePhone: UILabel!
    @IBOutlet weak var viewComments: UIButton!
    
    var places: [Place] = []
    var index: Int = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPosts" {
            if let destination = segue.destination as? PostsListController {
                destination.placeId = places[index].identifier
//                destination.places = self.places
//                destination.index = self.index
            }
        }
    }
    
    @IBAction func didTapViewComments(_ sender: UIButton) {
        performSegue(withIdentifier: "goToPosts", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        placeImage.layer.cornerRadius = 10
        placeImage.layer.shadowOffset = CGSize(width: 5, height: 1)
        placeImage.layer.shadowColor = UIColor.purple.cgColor
        placeImage.layer.isOpaque = true
        
        viewComments.layer.cornerRadius = 5
        viewComments.layer.borderWidth = 0.5
        viewComments.layer.borderColor = UIColor.lightGray.cgColor

        placeTitle.text = places[index].name
        placeDescription.text = places[index].description
        placeAddress.text = places[index].address
        placePhone.text = places[index].phone
        
        let imageUrl = URL(string: places[index].image)
        if let url = imageUrl, let data = try? Data(contentsOf: url) {
            placeImage.image = UIImage(data: data)
        }
    }
}

