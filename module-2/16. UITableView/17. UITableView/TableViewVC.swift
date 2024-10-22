//
//  ViewController.swift
//  17. UITableView
//
//  Created by Despo on 18.10.24.
//

import UIKit

protocol PlanetPositionsDelegate: AnyObject {
    func updatePlanetPositionInArray(array: [(String, String, UIImage?, String, String)])
}

final class TableViewVC: UIViewController, UITableViewDataSource {
    private var pageTitle = UILabel()
    private let tableView = UITableView()
    
    var planetsArray = [
        Planet(name: "Jupiter", temperature: "-108°C", area: "64E10 km²", mass: "61.418.738.571", image: "jupiter", isFaved: false),
        Planet(name: "Earth", temperature: "15°C", area: "500,100,100 km²", mass: "510.072.000", image: "earth", isFaved: false),
        Planet(name: "Saturn", temperature: "-139°C", area: "2,608,250 km²", mass: "42.700.000.000", image: "saturn", isFaved: false),
        Planet(name: "Venus", temperature: "462°C", area: "460,234,300 km²", mass: "460.234.317", image: "venus", isFaved: false),
        Planet(name: "Mars", temperature: "-60°C", area: "1,258,250 km²", mass: "144.798.500", image: "mars", isFaved: false),
        Planet(name: "Jupiter", temperature: "-108°C", area: "64E10 km²", mass: "61.418.738.571", image: "jupiter", isFaved: false),
        Planet(name: "Earth", temperature: "15°C", area: "500,100,100 km²", mass: "510.072.000", image: "earth", isFaved: false),
        Planet(name: "Saturn", temperature: "-139°C", area: "2,608,250 km²", mass: "42.700.000.000", image: "saturn", isFaved: false),
        Planet(name: "Venus", temperature: "462°C", area: "460,234,300 km²", mass: "460.234.317", image: "venus", isFaved: false)
    ]
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
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
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: 40, left: 0, bottom: -40, right: 0)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: pageTitle.topAnchor, constant: 69),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


extension TableViewVC: UpdatePLanetStatus {
    func addPlanetFavourites(index: Int) {
        planetsArray[index].isFaved.toggle()
        
        let currentPlanet = planetsArray.remove(at: index)
        
        if currentPlanet.isFaved {
            planetsArray.insert(currentPlanet, at: 0)
        } else {
            planetsArray.append(currentPlanet)
        }

        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planetsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetCell
        let currentPlanet = planetsArray[indexPath.row]
        cell.delegate = self
        cell.setupPlanetCell(planet: currentPlanet, currentIndex: indexPath.row)
        return cell
    }
}
