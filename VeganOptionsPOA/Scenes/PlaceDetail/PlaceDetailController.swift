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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewComments.layer.cornerRadius = 5
        viewComments.layer.borderWidth = 0.5
        viewComments.layer.borderColor = UIColor.lightGray.cgColor
        
        placeTitle.text = places[myIndex]
        placeImage.image = UIImage(named: placesImage[myIndex])
        placeDescription.text = placesDescription[myIndex]
        placeAddress.text = placesAddress[myIndex]
        placePhone.text = placesPhone[myIndex]
    }
}

