//
//  QuestionVC.swift
//  21. Data Persistence 21. Data Persistence 21.Data Persistence
//
//  Created by Despo on 02.11.24.
//

import UIKit

final class QuestionDetailVC: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let navStack = UIStackView()
    private let currentQuestion: QuestionModel
    private let backButton = UIButton()
    private let quesNumberLabel = PaddedLabel()
    private let maincQuestionLabel = UILabel()
    private let bottomResultLabel = PaddedLabel()
    private let answersStack = UIStackView()
    private let answer1 = UIButton()
    private let answer2 = UIButton()
    private let answer3 = UIButton()
    private let answer4 = UIButton()
    
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
        setupScrollView()
        setupMainQuestionLabel()
        setupAnswerStack()
        setupAnswerButtons()
        setupBottomResultLabel()
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
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: navStack.bottomAnchor, constant: 25),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ])
    }
    
    private func setupMainQuestionLabel() {
        contentView.addSubview(maincQuestionLabel)
        
        maincQuestionLabel.configureCustomLabel(
            text: currentQuestion.question,
            textColor: .white,
            fontName: "Sen-Regular",
            fontSize: 20
        )
        
        NSLayoutConstraint.activate([
            maincQuestionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            maincQuestionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            maincQuestionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -75),
        ])
    }
    
    private func setupAnswerStack() {
        contentView.addSubview(answersStack)
        answersStack.translatesAutoresizingMaskIntoConstraints = false
        answersStack.axis = .vertical
        answersStack.spacing = 8
        
        NSLayoutConstraint.activate([
            answersStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            answersStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            answersStack.topAnchor.constraint(equalTo: maincQuestionLabel.bottomAnchor, constant: 30)
        ])
    }
    
    private func setupAnswerButtons() {
        let answerButtonsArray = [answer1, answer2, answer3, answer4]
        
        var incorrectAnswers = currentQuestion.incorrectAnswers
        incorrectAnswers.append(currentQuestion.correctAnswer)
        
        let shuffledAnswers = incorrectAnswers.shuffled()
        
        for (answer, answerBtn) in zip(shuffledAnswers, answerButtonsArray) {
            answersStack.addArrangedSubview(answerBtn)

            answerBtn.configureCustomButton(
                btnHeight: 49,
                bgColor: .white,
                btnTitle: answer,
                color: .mainViolet,
                fontName: "Ren-Regular",
                fonSize: 16
            )
            
            var config = UIButton.Configuration.plain()
            config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
            config.imagePadding = 16.0
            answerBtn.configuration = config

            answerBtn.setImage(UIImage(named: "emptyCircle"), for: .normal)
            answerBtn.contentHorizontalAlignment = .leading
            answerBtn.configuration?.titlePadding = 30

            NSLayoutConstraint.activate([
                answerBtn.leadingAnchor.constraint(equalTo: answersStack.leadingAnchor),
                answerBtn.trailingAnchor.constraint(equalTo: answersStack.trailingAnchor),
            ])
            
            answerBtn.addAction(UIAction(handler: {[weak self] _ in
                answerBtn.backgroundColor = .secondaryViolet
                
                if answerBtn.titleLabel?.text == self?.currentQuestion.correctAnswer {
                    answerBtn.setImage(UIImage(named: "correctCircle"), for: .normal)
                } else {
                    answerBtn.setImage(UIImage(named: "wrongCircle"), for: .normal)
                }
                
                answerButtonsArray.forEach { $0.isUserInteractionEnabled = false }
            }), for: .touchUpInside)
        }
    }
    
    private func setupBottomResultLabel() {
        contentView.addSubview(bottomResultLabel)
        
        bottomResultLabel.configureCustomLabel(
            text: "Correct Answer \(1) / Incorrect \(9)",
            textColor: .white,
            fontName: "Sen-Regular",
            fontSize: 16
        )
        bottomResultLabel.padding = UIEdgeInsets(top: 11, left: 15, bottom: 11, right: 15)
        bottomResultLabel.backgroundColor = .secondaryViolet
        
        NSLayoutConstraint.activate([
            bottomResultLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bottomResultLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            bottomResultLabel.topAnchor.constraint(greaterThanOrEqualTo: answersStack.bottomAnchor, constant: 20),
            bottomResultLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -49),
        ])
    }
}
