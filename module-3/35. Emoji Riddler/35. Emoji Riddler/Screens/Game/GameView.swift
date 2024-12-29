//
//  Game.swift
//  35. Emoji Riddler
//
//  Created by Despo on 29.12.24.
//


import UIKit
import SwiftUI

final class GameView: UIViewController, PointsDelegate, AttemptsDelegate {
  private var hostingController: UIHostingController<SwiftUIListView>?
  let gameCategory: Categories
  let vm: GameViewModel?
  
  private lazy var spacerOne: UIView = {
    let view = UIView()
    return view
  }()
  
  private lazy var livesStack: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .horizontal
    stack.distribution = .fill
    return stack
  }()
  
  private lazy var scoreLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var attemptsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
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
  
  init(gameCategory: Categories, vm: GameViewModel = GameViewModel()) {
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
    vm?.delegate = self
    vm?.attemptsDelegate = self
    view.backgroundColor = .secondaryWhite
    
    view.addSubview(questionView)
    questionView.addSubview(questionTitle)
    view.addSubview(nextButton)
    view.addSubview(livesStack)
    view.addSubview(livesStack)
    livesStack.addArrangedSubview(scoreLabel)
    livesStack.addArrangedSubview(spacerOne)
    livesStack.addArrangedSubview(attemptsLabel)
    
    setupConstraints()
    showNextQuestion()
    setupPoints()
    setupAttepmts()
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      livesStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      livesStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      livesStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      
      questionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      questionView.topAnchor.constraint(equalTo: livesStack.topAnchor, constant: 50),
      questionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      questionView.heightAnchor.constraint(equalToConstant: 150),
      
      questionTitle.centerXAnchor.constraint(equalTo: questionView.centerXAnchor),
      questionTitle.centerYAnchor.constraint(equalTo: questionView.centerYAnchor),
      
      nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
      nextButton.widthAnchor.constraint(equalToConstant: 100),
      nextButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  
  private func setupAnswers(nextQuestion: GameModel) {
    guard let viewModel = vm else { return }
    
    hostingController?.willMove(toParent: nil)
    hostingController?.view.removeFromSuperview()
    hostingController?.removeFromParent()
    
    let swiftUIView = SwiftUIListView(item: nextQuestion, vm: viewModel)
    hostingController = UIHostingController(rootView: swiftUIView)
    addChild(hostingController!)
    view.addSubview(hostingController!.view)
    
    guard let hostingController = hostingController  else {return}
    hostingController.didMove(toParent: self)
    hostingController.view.backgroundColor = .clear
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      hostingController.view.topAnchor.constraint(equalTo: questionView.bottomAnchor, constant: 50),
      hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
    ])
  }
  
  private func showNextQuestion() {
    if let nextQuestion = vm?.loadNextQuestion(cat: gameCategory) {
      questionTitle.text = nextQuestion.question
      setupAnswers(nextQuestion: nextQuestion)
    } 
  }
  
  private func setupPoints() {
    scoreLabel.configureCustomText(
      text: "Points: \(vm?.points ?? 0)",
      color: .mainGreen,
      isBold: true,
      size: 16)
  }
  
  func updateScore(to score: Int) {
    DispatchQueue.main.async {[weak self] in
      self?.scoreLabel.text = "Points: \(score)"
    }
  }
  
  private func setupAttepmts() {
    attemptsLabel.configureCustomText(
      text: "Try: \(vm?.attempts ?? 0)",
      color: .mainGreen,
      isBold: true,
      size: 16
    )
  }
  
  func updateAttpemts(to tries: Int) {
    DispatchQueue.main.async{[weak self] in
      self?.attemptsLabel.configureCustomText(
        text: "Try: \(tries)",
        color: .mainGreen,
        isBold: true,
        size: 16
      )
    }
  }
}
