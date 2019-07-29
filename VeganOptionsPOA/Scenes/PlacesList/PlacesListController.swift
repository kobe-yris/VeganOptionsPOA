//
//  PlacesListController.swift
//  VeganOptionsPOA
//
//  Created by Camila Legramante Prestes on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import UIKit

class PlacesListController: UITableViewController {
    
    @IBOutlet var placesTableView: UITableView!
    
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlacesListTableViewCell
        cell.placeTitle.text = places[indexPath.row].name
//        cell.imageView?.image = UIImage(named: placesImage[indexPath.row])
        cell.placeAddress.text = places[indexPath.row].address
        cell.placePhone.text = places[indexPath.row].phone
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}

extension PlacesListController: PlacesListViewModelDelegate {
    func updateData() {
        self.places = viewModel.places
        self.placesTableView.reloadData()
    }
}
