//
//  PlacesListController.swift
//  VeganOptionsPOA
//
//  Created by Camila Legramante Prestes on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class PlacesListController: UIViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var placesTableView: UITableView! {
        didSet {
            placesTableView.dataSource = self
            placesTableView.delegate = self
        }
    }
    
    var places: [Place] = []
    var index = 0
    var filteredPlaces: [Place] = []
    
    var viewModel: PlacesListViewModel!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        viewModel = PlacesListViewModel()
        viewModel.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Procurar locais"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            definesPresentationContext = true
        }
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

@available(iOS 11.0, *)
extension PlacesListController: UITableViewDelegate {
    
}

@available(iOS 11.0, *)
extension PlacesListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredPlaces.count
        }
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlacesListTableViewCell
        var place: Place
        if isFiltering() {
            place = filteredPlaces[indexPath.row]
        } else {
            place = places[indexPath.row]
        }
        
        cell.placeTitle.text = place.name
        cell.placeAddress.text = place.address
        cell.placePhone.text = place.phone
        
        let imageUrl = URL(string: place.image)
        if let url = imageUrl, let data = try? Data(contentsOf: url) {
            cell.placeImage.image = UIImage(data: data)
        }
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.placeImage.layer.cornerRadius = 50
        cell.placeImage.layer.borderWidth = 1
        cell.placeImage.layer.borderColor = UIColor.lightGray.cgColor
        cell.placeImage.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segue", sender: self)
    }
}

@available(iOS 11.0, *)
extension PlacesListController: PlacesListViewModelDelegate {
    func updateData() {
        self.places = viewModel.places
        self.placesTableView.reloadData()
        self.loadingIndicator.stopAnimating()
    }
}

@available(iOS 11.0, *)
extension PlacesListController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredPlaces = places.filter({( place : Place) -> Bool in
            return place.name.range(of: searchText, options: [.diacriticInsensitive, .caseInsensitive]) != nil
        })
       placesTableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}
