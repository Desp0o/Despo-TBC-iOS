//
//  View.swift
//  21. Data Persistence 21. Data Persistence 21.Data Persistence
//
//  Created by Despo on 02.11.24.
//

import UIKit

class QuizVC: UIViewController {
    private let table = UITableView()
    
    let randomStrings = [
        "Sunbeam",
        "Oceanic",
        "Stardust",
        "Nebula",
        "Aurora",
        "Comet",
        "Galaxy",
        "Meteor",
        "Eclipse",
        "Celestial",
        "Nova",
        "Quasar",
        "Asteroid",
        "Pulsar",
        "Equinox",
        "Cosmos",
        "Lunar",
        "Orion",
        "Zenith",
        "Orbit",
        "Helios"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainViolet
        setupUI()
    }
    
    private func setupUI() {
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .purple
        table.dataSource = self
        table.delegate = self
        table.register(TableCell.self, forCellReuseIdentifier: "TableCell")
        
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}


extension QuizVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        randomStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "TableCell") as? TableCell
        
        let currentQuestion = randomStrings[indexPath.row]
        return cell ?? TableCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentQuestion = randomStrings[indexPath.row]
        print(currentQuestion)
    }
}
