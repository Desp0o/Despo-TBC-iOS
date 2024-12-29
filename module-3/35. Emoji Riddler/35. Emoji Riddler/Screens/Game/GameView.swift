//
//  Game.swift
//  35. Emoji Riddler
//
//  Created by Despo on 29.12.24.
//

import UIKit

final class GameView: UIViewController {
  private let gameCategory: Categories
  private let vm: GameViewController
  
  private lazy var questionView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.layer.cornerRadius = 10
    view.layer.borderWidth = 4
    view.layer.borderColor = UIColor.mainGreen.cgColor
    return view
  }()
  
  private lazy var questionTitle: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var nextButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.configureWith(title: "Next", fontSize: 18, titleColor: .mainGreen, backgroundColor: .secondaryWhite)
    button.layer.cornerRadius = 10
    button.layer.borderWidth = 4
    button.layer.borderColor = UIColor.mainGreen.cgColor
    button.addAction(UIAction(handler: {[weak self] _ in
      self?.showNextQuestion()}), for: .touchUpInside)
    return button
  }()
  
  init(gameCategory: Categories, vm: GameViewController = GameViewController()) {
    self.vm = vm
    self.gameCategory = gameCategory
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
    view.backgroundColor = .secondaryWhite
    
    view.addSubview(questionView)
    questionView.addSubview(questionTitle)
    view.addSubview(nextButton)
    
    setupConstraints()
//    setupQuestions()
    showNextQuestion()
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      questionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      questionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
      questionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      questionView.heightAnchor.constraint(equalToConstant: 150),
      
      questionTitle.centerXAnchor.constraint(equalTo: questionView.centerXAnchor),
      questionTitle.centerYAnchor.constraint(equalTo: questionView.centerYAnchor),
      
      nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
    ])
  }
  
  private func setupFirstQuestion() {
    
  }
  
  private func showNextQuestion() {
    if let nextQuestion = vm.loadNextQuestion(cat: gameCategory) {
      questionTitle.text = nextQuestion.question
    } else {
      let alert = UIAlertController(title: "Game Over", message: "You've completed all the questions!", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default))
      present(alert, animated: true)
    }
  }
}
