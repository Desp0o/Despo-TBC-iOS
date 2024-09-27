//: [Previous](@previous)

//9. შექმენით ფუნქცია processNumbers, რომელიც იღებს Int-ების მასივს და ასრულებს შემდეგ ოპერაციებს: 1) იყენებს filter მეთოდს, რომ დატოვოს მხოლოდ დადებითი რიცხვები 2) იყენებს map მეთოდს, რომ ყველა დარჩენილი რიცხვი აიყვანოს კვადრატში 3) იყენებს sorted მეთოდს, რომ დაალაგოს შედეგი კლებადობით 4) იყენებს prefix მეთოდს, რომ დააბრუნოს პირველი 5 ელემენტი (ან ნაკლები, თუ 5-ზე ნაკლები ელემენტია)
//
//მაგალითად: input: [3, -1, 7, 0, 5, -4, 2, 9, 11]
//
//      output: [121, 81, 49, 25, 9]

import Foundation

func processNumbers(_ numArray: [Int]) -> [Int] {
    var filteredArray = numArray
        .filter { $0 > 0 }
        .map { $0 * $0 }
        .sorted { $0 > $1 }
        .prefix(5)
    
    return Array(filteredArray)
}

processNumbers([3, -1, 7, 0, 5, -4, 2, 9, 11])
processNumbers([20, -11, 14])
processNumbers([20, -11, 14, -1, 7, 0, 5, -4, 2, 9, 11])

//: [Next](@next)
