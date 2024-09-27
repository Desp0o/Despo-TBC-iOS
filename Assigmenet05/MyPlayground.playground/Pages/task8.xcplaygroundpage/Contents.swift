//: [Previous](@previous)

//8. შექმენით ფუნქცია printEvenNumbers, რომელიც იღებს ვარიადულ Int ტიპის პარამეტრს numbers. ფუნქციამ უნდა დაბეჭდოს მხოლოდ ლუწი რიცხვები გადმოცემული არგუმენტებიდან. გამოიძახეთ ეს ფუნქცია სხვადასხვა რაოდენობის არგუმენტებით და დაბეჭდეთ შედეგები.

import Foundation

func printEvenNumbers(_ numbers: Int...) {
    for num in numbers {
        if num % 2 == 0 {
            print(num)
        }
    }
}

printEvenNumbers(1, 2, 3, 5)
print("\n")
printEvenNumbers(1, 2, 5, 6, 8, 10, 11, 14)

//: [Next](@next)
