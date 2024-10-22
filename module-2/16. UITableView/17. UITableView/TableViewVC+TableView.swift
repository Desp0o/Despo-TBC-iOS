//
//  TableViewVC+TableView.swift
//  17. UITableView
//
//  Created by Despo on 18.10.24.
//
import UIKit



extension TableViewVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentPlanetIndex = planetsArray[indexPath.row]
        
        let vc = PlanetDetailsVC(planet: currentPlanetIndex)
    
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
