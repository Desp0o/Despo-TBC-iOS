//: [Previous](@previous)

//6. დაწერეთ ფუნქცია `processOptionalNumbers`, რომელიც იღებს `[Int?]` ტიპის მასივს (ოფციონალური Int-ების მასივი). გამოიყენეთ `compactMap`, რომ მიიღოთ ახალი მასივი, სადაც ყველა nil მნიშვნელობა მოშორებულია და დანარჩენი რიცხვები გაორმაგებულია. გამოიძახეთ ფუნქცია და დაბეჭდეთ შედეგი.

import Foundation

var optArray: [Int?] = [1, 2, 3, nil, nil, 7]

func processOptionalNumbers(_ arrary: [Int?]) {
    var myArray = arrary
        .compactMap { $0 }
        .map { $0 * 2 }
    
    print(myArray)
}

processOptionalNumbers(optArray)

//: [Next](@next)
