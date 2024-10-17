//
//  ViewController.swift
//  17. UITableView
//
//  Created by Despo on 18.10.24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    private var pageTitle = UILabel()
    
    private let planetsArray = [
        ("Mars", "1,258,250 km²", UIImage(named: "mars")),
        ("Jupiter", "64E10 km²", UIImage(named: "jupiter")),
        ("Earth", "500,100,100 km²", UIImage(named: "earth")),
        ("Saturn", "2,608,250 km²", UIImage(named: "saturn")),
        ("Venus", "460,234,300 km²", UIImage(named: "venus")),
        ("Mercury", "74,800,000 km²", UIImage(named: "mercury")),
        ("Neptune", "7,618,300,000 km²", UIImage(named: "neptune")),
        ("Uranus", "8,100,400,000 km²", UIImage(named: "uranus")),
        ("Pluto", "1,654,500 km²", UIImage(named: "pluto")),
        ("Eris", "1,663,000 km²", UIImage(named: "eris")),
        ("Haumea", "1,949,000 km²", UIImage(named: "haumea")),
        ("Makemake", "1,430,000 km²", UIImage(named: "makemake")),
        ("Ceres", "2,770,000 km²", UIImage(named: "ceres"))
    ]
    
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgorundColor
        setupPageTitle()
        setupTableView()
    }
    
    private func setupPageTitle() {
        view.addSubview(pageTitle)
        
        pageTitle.text = "Planets"
        pageTitle.font = UIFont.boldSystemFont(ofSize: 36)
        pageTitle.textColor = primaryColor
        
        pageTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            pageTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PlanetCell.self, forCellReuseIdentifier: "PlanetCell")
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: pageTitle.topAnchor, constant: 69),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
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
