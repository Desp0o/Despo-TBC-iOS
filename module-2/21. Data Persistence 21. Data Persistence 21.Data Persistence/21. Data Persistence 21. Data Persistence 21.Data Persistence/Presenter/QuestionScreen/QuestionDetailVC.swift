//
//  QuestionVC.swift
//  21. Data Persistence 21. Data Persistence 21.Data Persistence
//
//  Created by Despo on 02.11.24.
//

import UIKit

final class QuestionDetailVC: UIViewController {
    private let navStack = UIStackView()
    private let currentQuestion: QuestionModel
    private let backButton = UIButton()
    private let quesNumberLabel = PaddedLabel()
    private let quizLabel = UILabel()
    
    init(currentQuestion: QuestionModel) {
        self.currentQuestion = currentQuestion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .mainViolet
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        view.addSubview(navStack)
        
        navStack.translatesAutoresizingMaskIntoConstraints = false
        navStack.axis = .horizontal
        navStack.distribution = .equalCentering
        navStack.alignment = .center
        
        NSLayoutConstraint.activate([
            navStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            navStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            navStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
        
        setupBackButton()
        setupQuestionNumberLabel()
    }
    
    private func setupBackButton() {
        navStack.addArrangedSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "backArrow"), for: .normal)
        
        backButton.addAction(UIAction(handler: {[weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    private func setupQuestionNumberLabel() {
        navStack.addArrangedSubview(quesNumberLabel)
        quesNumberLabel.configureCustomLabel(
            text: "Question \(currentQuestion.questionNumber)",
            textColor: .white,
            fontName: "Sen-Regular",
            fontSize: 12
        )
        
        quesNumberLabel.backgroundColor = .secondaryViolet
    }
}
