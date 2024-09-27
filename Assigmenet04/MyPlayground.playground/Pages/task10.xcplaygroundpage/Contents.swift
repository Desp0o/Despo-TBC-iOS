//: [Previous](@previous)

//10. დაწერეთ ფუნქცია `applyOperations`, რომელიც იღებს Int-ების მასივს და closure-ების მასივს, სადაც თითოეული closure იღებს Int-ს და აბრუნებს Int-ს. ფუნქციამ უნდა გამოიყენოს `map` მეთოდი, რომ ყველა ოპერაცია ჩაატაროს ყველა რიცხვზე და დააბრუნოს შედეგების მასივი. გამოიძახეთ ეს ფუნქცია სხვადასხვა რიცხვებისა და ოპერაციების კომბინაციებით.

import Foundation

let sumClosure: (Int) -> Int = { $0 + 2 }
let quadMultiplication: (Int) -> Int = { $0 * $0 }

func applyOperations(_ numArray: [Int], _ closureArrays: [(Int) -> Int]) -> [Int] {
    var finalResult: [Int] = []
    
    numArray.map { num in
        closureArrays.map { closure in
           let singleNumResult =  closure(num)
            finalResult.append(singleNumResult)
        }
    }
    
    print(finalResult)
    return finalResult
}

applyOperations([3, -1, 7, 0, 5, -4, 2, 9, 11], [sumClosure, quadMultiplication])

//: [Next](@next)
