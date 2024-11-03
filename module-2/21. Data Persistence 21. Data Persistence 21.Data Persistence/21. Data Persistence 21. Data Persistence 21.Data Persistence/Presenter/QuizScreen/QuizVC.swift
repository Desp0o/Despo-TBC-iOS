//
//  View.swift
//  21. Data Persistence 21. Data Persistence 21.Data Persistence
//
//  Created by Despo on 02.11.24.
//

import UIKit

class QuizVC: UIViewController {
    let viewModel = QuizViewModel()
    private let table = UITableView()
    private let topStack = UIStackView()
    private let screenTitleLabel = UILabel()
    private let resetButton = PaddedLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .mainViolet
        setupTopStack()
        setupTableView()
    }
    
    private func setupTopStack() {
        view.addSubview(topStack)
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.axis = .horizontal
        topStack.distribution = .equalCentering
        
        NSLayoutConstraint.activate([
            topStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            topStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
        ])
        
        setupScreenTitle()
        setupResetButton()
    }
    
    private func setupScreenTitle() {
        topStack.addArrangedSubview(screenTitleLabel)
        screenTitleLabel.configureCustomLabel(text: "Quiz", textColor: .white, fontName: "Sen-Regular", fontSize: 24)
    }
    
    private func setupResetButton() {
        topStack.addArrangedSubview(resetButton)

        resetButton.configureCustomLabel(
            text: "Reset",
            textColor: .white,
            fontName: "Sen-Medium",
            fontSize: 14
        )
        
        resetButton.backgroundColor = .secondaryViolet
        resetButton.layer.borderColor = UIColor.outlineViolet.cgColor
        resetButton.layer.borderWidth = 1
        resetButton.padding = UIEdgeInsets(top: 9, left: 12, bottom: 9, right: 12)
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
            table.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 14),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}


extension QuizVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.questionsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "TableCell") as? TableCell
        
        let currentQuestion = viewModel.getSingleQuestion(index: indexPath.row)
        cell?.configureCell(question: currentQuestion)
        return cell ?? TableCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentQuestion = viewModel.getSingleQuestion(index: indexPath.row)
        let vc = QuestionDetailVC(currentQuestion: currentQuestion)
        navigationController?.pushViewController(vc, animated: true)
    }
}
