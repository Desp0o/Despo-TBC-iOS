//: [Previous](@previous)

//2. დაწერეთ ფუნქცია printMultiplicationTable, რომელიც იღებს ერთ Int ტიპის პარამეტრს number და ბეჭდავს ამ რიცხვის გამრავლების ტაბულას 1-დან 10-მდე. მაგალითად, თუ გადავცემთ 5-ს, ფუნქციამ უნდა დაბეჭდოს:
//
//5 x 1 = 5
//5 x 2 = 10
//5 x 3 = 15
//...
//5 x 10 = 50
//გამოიძახეთ ეს ფუნქცია რამდენიმე სხვადასხვა რიცხვისთვის.

import Foundation

func printMultiplicationTable(number: Int) {
    for i in 1...10 {
        print("\(number) x \(i) = \(5 * i)")
    }
}

printMultiplicationTable(number: 5)
print("\n")
printMultiplicationTable(number: 26)
print("\n")
printMultiplicationTable(number: 1121)

//: [Next](@next)
