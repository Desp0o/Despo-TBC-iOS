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
        QuestionModel(numeration: "Stardust"),
            QuestionModel(numeration: "Nebula"),
            QuestionModel(numeration: "Aurora"),
            QuestionModel(numeration: "Comet"),
            QuestionModel(numeration: "Galaxy"),
            QuestionModel(numeration: "Meteor"),
            QuestionModel(numeration: "Eclipse"),
            QuestionModel(numeration: "Celestial"),
            QuestionModel(numeration: "Nova"),
            QuestionModel(numeration: "Quasar"),
            QuestionModel(numeration: "Asteroid"),
            QuestionModel(numeration: "Pulsar"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainViolet
        setupUI()
    }
    
    private func setupUI() {
        navigationController?.isNavigationBarHidden = true
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.dataSource = self
        table.delegate = self
        table.register(TableCell.self, forCellReuseIdentifier: "TableCell")
        table.separatorStyle = .none
        
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
        cell?.configureCell(question: currentQuestion)
        return cell ?? TableCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentQuestion = randomStrings[indexPath.row]
        print(currentQuestion)
    }
}
