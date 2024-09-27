//: [Previous](@previous)

//5. შექმენით ფუნქცია `calculateTax`, რომელსაც აქვს ორი პარამეტრი: Double ტიპის `price` და Double ტიპის `taxRate` (პროცენტებში). ფუნქციამ უნდა დააბრუნოს გადასახადის თანხა. გამოიძახეთ ეს ფუნქცია სხვადასხვა ფასისთვის და დაბეჭდეთ შედეგები.

import Foundation

func calculateTax(price: Double, taxRate: Double) -> Double {
    price * taxRate / 100
}

calculateTax(price: 10.2, taxRate: 18)
calculateTax(price: 1250, taxRate: 20)
calculateTax(price: 56.9, taxRate: 13)

//: [Next](@next)
