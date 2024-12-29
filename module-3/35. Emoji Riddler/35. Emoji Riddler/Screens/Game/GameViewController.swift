//
//  GameViewController.swift
//  35. Emoji Riddler
//
//  Created by Despo on 29.12.24.
//

final class GameViewController {
  private var currentQuestionIndex = 0
  private var myCurretArray: [GameModel] = []
  private var movieArray: [GameModel] = [
    GameModel(question: "🏀", answers: [Answer(answerTitle: "Jordan", isCorrect: true),
                                        Answer(answerTitle: "darwin", isCorrect: false),
                                        Answer(answerTitle: "salah", isCorrect: false),
                                        Answer(answerTitle: "bool", isCorrect: false)], hint: "michael jordan"),
    GameModel(question: "⚽️", answers: [Answer(answerTitle: "pele", isCorrect: true),
                                        Answer(answerTitle: "darwin", isCorrect: false),
                                        Answer(answerTitle: "salah", isCorrect: false),
                                        Answer(answerTitle: "bool", isCorrect: false)], hint: "michael jordan")
  ]
  
  func getGameCategory(category: Categories) -> [GameModel] {
    switch category {
    case .books:
      myCurretArray = movieArray
    case .anime:
      myCurretArray = movieArray
    case .movies:
      myCurretArray = movieArray
    }
    
    return myCurretArray
  }
  
  
  func loadNextQuestion(cat: Categories) -> GameModel? {
    let currentArray = getGameCategory(category: cat)
    
    guard currentQuestionIndex < movieArray.count else { return nil }
    let newQuestion = currentArray[currentQuestionIndex]
    currentQuestionIndex += 1
    return newQuestion
  }
}
