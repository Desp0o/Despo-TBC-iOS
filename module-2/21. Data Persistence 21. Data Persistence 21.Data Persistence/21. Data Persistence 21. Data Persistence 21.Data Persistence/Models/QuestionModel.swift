//
//  QuestionModel.swift
//  21. Data Persistence 21. Data Persistence 21.Data Persistence
//
//  Created by Despo on 03.11.24.
//
import Foundation

struct QuestionModel: Codable {
    let questionNumber: String
    let difficulty: String
    let category: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
    
    enum CodingKeys: String, CodingKey {
        case questionNumber
        case difficulty
        case category
        case question 
        case correct_answer = "correct_answer"
        case incorrect_answers = "incorrect_answers"
    }
}

struct QuizResponse: Codable {
    let response_code: Int
    let results: [QuestionModel]
}
