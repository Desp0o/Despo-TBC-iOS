//: [Previous](@previous)

import Foundation

//3. დაწერეთ ფუნქცია sumOfUniqueSquares, რომელიც იღებს Int-ების მასივს, გადააქცევს მას Set-ად (რომ მოაშოროს დუბლიკატები), შემდეგ იყენებს map მეთოდს ყველა ელემენტის კვადრატში ასაყვანად, და ბოლოს reduce მეთოდს ჯამის გამოსათვლელად. გამოიძახეთ ეს ფუნქცია სხვადასხვა მასივებზე და დაბეჭდეთ შედეგები.

func sumOfUniqueSquares(_ arr: [Int] ) {
    var uniques = Set(arr)
    
    let doubledNums = uniques.map { $0 * $0 }
    
    let sum = doubledNums.reduce(0) { $0 + $1 }
    
    print(sum)
}

sumOfUniqueSquares([2, 3, 2, 4])

//: [Next](@next)
