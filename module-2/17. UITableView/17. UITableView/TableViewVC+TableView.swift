//
//  TableViewVC+TableView.swift
//  17. UITableView
//
//  Created by Despo on 18.10.24.
//
import UIKit

extension TableViewVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planetsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetCell
        let planet = planetsArray[indexPath.row]
        
        cell.setupPlanetCell(planetImage: planet.2 ?? UIImage(), planetTitle: planet.0, planetArea: planet.1)
        return cell
    }
}

extension TableViewVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentPlanetIndex = planetsArray[indexPath.row]
        
        let planet = Planet(name: currentPlanetIndex.0, temperature: currentPlanetIndex.3, area: currentPlanetIndex.1, mass: currentPlanetIndex.4, image: currentPlanetIndex.2)
        
        let vc = PlanetDetailsVC(planet: planet)
    
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
