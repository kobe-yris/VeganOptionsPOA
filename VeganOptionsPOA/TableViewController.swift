//
//  TableViewController.swift
//  VeganOptionsPOA
//
//  Created by Camila Legramante Prestes on 23/07/19.
//  Copyright © 2019 Yris Siqueira. All rights reserved.
//

import UIKit

var  places = ["Macadâmia", "Vê Empório", "Donna Laura", "Espaço Veganista"]
var placesAddress = ["Av. Benno Mentz, 366", "Av. Lageado, 1265", "Rua Cel. Fernando Machado, 1164", "Rua Cel. Paulino Teixeira, 415"]
var placesPhone = ["(51) 3517-1001", "(51) 3022-4942", "(51) 3519-3571", "(51) 3557-7710"]
var placesImage = ["maca", "veempo", "donna", "espacovega"]
var placesDescription = ["Cozinha criativa e refinada de especialidades veganas servidas em ambiente descontraído e contemporâneo.", "O Vê - Empório e Restaurante Vegano é um restaurante com toques modernos e proposta inovadora, sendo o único buffet 100% vegano de Porto Alegre.", "Especializada em comida vegana, a casa serve lanches, salgados e refeições, em espacinho modesto e acolhedor.", "Menu com destaque à torta de vegetais, creme de milho, lentilha caseira, espaço tranquilo e opção delivery."]

var myIndex = 0

class TableViewController: UITableViewController {
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlacesTableViewCell
        
        cell.placeTitle.text = places[indexPath.row]
        cell.imageView?.image = UIImage(named: placesImage[indexPath.row])
        cell.placeAddress.text = placesAddress[indexPath.row]
        cell.placePhone.text = placesPhone[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}
