//: [Previous](@previous)

//3. შექმენით ფუნქცია `isEven`, რომელიც იღებს Int ტიპის პარამეტრს და აბრუნებს Bool-ს - true თუ რიცხვი ლუწია, false თუ კენტი. გამოიყენეთ ეს ფუნქცია რამდენიმე რიცხვის შესამოწმებლად და დაბეჭდეთ შედეგები.

import Foundation

func isEven(number: Int) -> Bool {
   number % 2 == 0
}

isEven(number: 10)
isEven(number: 11)
isEven(number: 120)
isEven(number: 111)

//: [Next](@next)
