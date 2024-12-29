//
//  GameModel.swift
//  35. Emoji Riddler
//
//  Created by Despo on 29.12.24.
//
import SwiftUI

struct GameModel: Hashable, Identifiable {
  let id = UUID()
  let question: String
  let answers: [Answer]
  let hint: String
}

struct Answer: Hashable, Identifiable {
  let id = UUID()
  let answerTitle: String
  let isCorrect: Bool
}
