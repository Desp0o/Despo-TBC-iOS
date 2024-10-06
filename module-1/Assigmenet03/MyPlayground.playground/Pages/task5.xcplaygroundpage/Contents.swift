//: [Previous](@previous)

//5. შექმენით Optional String ტიპის ცვლადი. გამოიყენეთ optional binding (if let), რომ უსაფრთხოდ ამოიღოთ მნიშვნელობა და დაბეჭდოთ ის.


import Foundation

var greeting: String?

if let temp = greeting {
    print(temp)
} else {
    print("There is no string")
}

//: [Next](@next)
