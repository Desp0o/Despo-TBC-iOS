//: [Previous](@previous)

//11. შექმენით ფუნქცია ‘filterAndTransform’, რომელიც იღებს Int-ების მასივს და ასრულებს შემდეგ ოპერაციებს: 1) იყენებს filter მეთოდს, რომ დატოვოს მხოლოდ 10-ზე მეტი რიცხვები 2) იყენებს map მეთოდს, რომ გამოაკლოს 10 ყველა დარჩენილ რიცხვს 3) იყენებს sorted მეთოდს, რომ დაალაგოს შედეგი ზრდადობით.

import Foundation

func filterAndTransform(_ numArray: [Int]) {
    let result = numArray
        .filter { $0 > 10 }
        .map { $0 - 10 }
        .sorted { $0 < $1 }
    
    print(result)
}

filterAndTransform([11, 12, 15, 20, 5, 30, 3, 40, 45, 7])

//: [Next](@next)
