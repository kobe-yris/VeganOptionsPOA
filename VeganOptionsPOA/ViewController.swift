//
//  ViewController.swift
//  VeganOptionsPOA
//
//  Created by Yris Siqueira on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeDescription: UITextView!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var placePhone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeTitle.text = places[myIndex]
        placeImage.image = UIImage(named: placesImage[myIndex])
        placeDescription.text = placesDescription[myIndex]
        placeAddress.text = placesAddress[myIndex]
        placePhone.text = placesPhone[myIndex]
    }


}

