//: [Previous](@previous)

import Foundation

//5. შექმენით ორგანზომილებიანი მასივი `matrix`, რომელიც შეიცავს რამდენიმე Int მასივს. გამოიყენეთ `flatMap` მეთოდი, რომ გადააქციოთ ის ერთგანზომილებიან მასივად. დაბეჭდეთ ორიგინალი მატრიცა და მიღებული ბრტყელი მასივი.

var matrix = [
    [1, 2, 3],
    [0, 4, 5],
    [6, 7, 8, 9, 10]
]

let flatMappedArray = matrix.flatMap { $0 }

print(flatMappedArray)

//: [Next](@next)
