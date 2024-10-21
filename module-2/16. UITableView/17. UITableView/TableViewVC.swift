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
        ("Mars", "1,258,250 km²", UIImage(named: "mars"), "-60°C", "144.798.500"),
        ("Jupiter", "64E10 km²", UIImage(named: "jupiter"), "-108°C", "61.418.738.571"),
        ("Earth", "500,100,100 km²", UIImage(named: "earth"), "15°C", "510.072.000"),
        ("Saturn", "2,608,250 km²", UIImage(named: "saturn"), "-139°C", "42.700.000.000"),
        ("Venus", "460,234,300 km²", UIImage(named: "venus"), "462°C", "460.234.317"),
        ("Mars", "1,258,250 km²", UIImage(named: "mars"), "-60°C", "144.798.500"),
        ("Jupiter", "64E10 km²", UIImage(named: "jupiter"), "-108°C", "61.418.738.571"),
        ("Earth", "500,100,100 km²", UIImage(named: "earth"), "15°C", "510.072.000"),
        ("Saturn", "2,608,250 km²", UIImage(named: "saturn"), "-139°C", "42.700.000.000"),
        ("Venus", "460,234,300 km²", UIImage(named: "venus"), "462°C", "460.234.317"),
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

