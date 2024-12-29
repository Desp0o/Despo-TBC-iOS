//
//  GameModel.swift
//  35. Emoji Riddler
//
//  Created by Despo on 29.12.24.
//

struct GameModel {
  let question: String
  let answers: [Answer]
  let hint: String
}

struct Answer {
  let answerTitle: String
  let isCorrect: Bool
}
