//
//  PlacesListController.swift
//  VeganOptionsPOA
//
//  Created by Camila Legramante Prestes on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import UIKit

class PlacesListController: UIViewController {
    
    @IBOutlet var placesTableView: UITableView! {
        didSet {
            placesTableView.dataSource = self
            placesTableView.delegate = self
        }
    }
    
    var places: [Place] = []
    var index = 0
    
    var viewModel: PlacesListViewModel!
    
    override func viewDidLoad() {
        viewModel = PlacesListViewModel()
        viewModel.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let destination = segue.destination as? PlaceDetailController {
                destination.places = self.places
                destination.index = self.index
            }
        }
    }
    
}

extension PlacesListController: UITableViewDelegate {
    
}

extension PlacesListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlacesListTableViewCell
        cell.placeTitle.text = places[indexPath.row].name
        cell.placeAddress.text = places[indexPath.row].address
        cell.placePhone.text = places[indexPath.row].phone
        
        let imageUrl = URL(string: places[indexPath.row].image)
        if let url = imageUrl, let data = try? Data(contentsOf: url) {
            cell.placeImage.image = UIImage(data: data)
        }
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.white.cgColor
        
        cell.placeImage.layer.cornerRadius = 50
        cell.placeImage.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segue", sender: self)
    }
}

extension PlacesListController: PlacesListViewModelDelegate {
    func updateData() {
        self.places = viewModel.places
        self.placesTableView.reloadData()
    }
}
