//: [Previous](@previous)

//10. შექმენით ფუნქცია `repeatOperation`, რომელსაც აქვს ორი პარამეტრი: Int ტიპის `count` და @autoclosure ტიპის closure `operation`. ფუნქციამ უნდა გამოიძახოს ეს operation `count`-ჯერ. გამოიყენეთ ეს ფუნქცია, რომ დაბეჭდოთ "გამარჯობა" 5-ჯერ.

import Foundation

func repeatOperation(count: Int, operation: @autoclosure () -> Void) {
    for _ in 0..<count {
        operation()
    }
}

repeatOperation(count: 5, operation: print("გამარჯობა"))


//: [Next](@next)
