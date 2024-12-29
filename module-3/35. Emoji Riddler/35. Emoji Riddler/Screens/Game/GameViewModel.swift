//
//  GameViewController.swift
//  35. Emoji Riddler
//
//  Created by Despo on 29.12.24.
//

import Foundation

protocol PointsDelegate: AnyObject {
  func updateScore(to score: Int)
}

protocol AttemptsDelegate: AnyObject {
  func updateAttpemts(to tries: Int)
}

final class GameViewModel {
  var points = 0
  var attempts = 5
  weak var delegate: PointsDelegate?
  weak var attemptsDelegate: AttemptsDelegate?
  private var currentQuestionIndex = 0
  private var myCurretArray: [GameModel] = []
  private var movieArray: [GameModel] = [
    GameModel(question: "🏀", answers: [Answer(answerTitle: "1.1", isCorrect: true),
                                        Answer(answerTitle: "1.2", isCorrect: false),
                                        Answer(answerTitle: "1.3", isCorrect: false),
                                        Answer(answerTitle: "1.4", isCorrect: false)], hint: "michael jordan"),
    GameModel(question: "⚽️", answers: [Answer(answerTitle: "2.1", isCorrect: true),
                                        Answer(answerTitle: "2.2", isCorrect: false),
                                        Answer(answerTitle: "2.3", isCorrect: false),
                                        Answer(answerTitle: "2.4", isCorrect: false)], hint: "michael jordan"),
    GameModel(question: "❌", answers: [Answer(answerTitle: "3.1", isCorrect: true),
                                        Answer(answerTitle: "3.2", isCorrect: false),
                                        Answer(answerTitle: "3.3", isCorrect: false),
                                        Answer(answerTitle: "3.4", isCorrect: false)], hint: "michael jordan")
  ]
  
  private var booksArray: [GameModel] = [
    GameModel(question: "🏀🚀", answers: [Answer(answerTitle: "1.1", isCorrect: true),
                                        Answer(answerTitle: "1.2", isCorrect: false),
                                        Answer(answerTitle: "1.3", isCorrect: false),
                                        Answer(answerTitle: "1.4", isCorrect: false)], hint: "michael jordan"),
    GameModel(question: "⚽️🚀", answers: [Answer(answerTitle: "2.1", isCorrect: true),
                                        Answer(answerTitle: "2.2", isCorrect: false),
                                        Answer(answerTitle: "2.3", isCorrect: false),
                                        Answer(answerTitle: "2.4", isCorrect: false)], hint: "michael jordan"),
    GameModel(question: "❌🚀", answers: [Answer(answerTitle: "3.1", isCorrect: true),
                                        Answer(answerTitle: "3.2", isCorrect: false),
                                        Answer(answerTitle: "3.3", isCorrect: false),
                                        Answer(answerTitle: "3.4", isCorrect: false)], hint: "michael jordan")
  ]
  
  func getGameCategory(category: Categories) -> [GameModel] {
    switch category {
    case .books:
      myCurretArray = booksArray
    case .anime:
      myCurretArray = movieArray
    case .movies:
      myCurretArray = movieArray
    }
    
    return myCurretArray
  }
  
  
  func loadNextQuestion(cat: Categories) -> GameModel? {
    let currentArray = getGameCategory(category: cat)
    guard currentQuestionIndex < currentArray.count else { return nil }
    let newQuestion = currentArray[currentQuestionIndex]
    currentQuestionIndex += 1
    return newQuestion
  }
  
  func increasePoints() {
    points += 1
    delegate?.updateScore(to: points)
  }
  
  func decreaseAttempts() {
    guard attempts > 0 else { return }
    attempts -= 1
    attemptsDelegate?.updateAttpemts(to: attempts)
    print("test")
  }
}
