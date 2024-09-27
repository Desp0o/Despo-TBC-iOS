//: [Previous](@previous)

import Foundation

//2. დაწერეთ ფუნქცია `filterEvenNumbers`, რომელიც იღებს Int-ების მასივს და იყენებს `filter` მეთოდს, რომ დააბრუნოს ახალი მასივი მხოლოდ ლუწი რიცხვებით. გამოიძახეთ ეს ფუნქცია სხვადასხვა მასივებზე და დაბეჭდეთ შედეგები.

func filterEvenNumbers(_ arr: [Int]) -> [Int] {
    arr.filter { $0 % 2 == 0 }
}

print(filterEvenNumbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
print(filterEvenNumbers([1, 3, 5, 7, 9, 10]))


//: [Next](@next)
