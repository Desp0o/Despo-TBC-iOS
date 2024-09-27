//: [Previous](@previous)

import Foundation

//6. დაწერეთ ფუნქცია `printNumbers`, რომელსაც აქვს ვარიადული Int ტიპის პარამეტრი `numbers`. ფუნქციამ უნდა დაბეჭდოს ყველა გადაცემული რიცხვი. გამოიძახეთ ეს ფუნქცია სხვადასხვა რაოდენობის არგუმენტებით.

func printNumbers(_ numbers: Int...) {
    for num in numbers {
        print(num)
    }
}

printNumbers(1, 2, 3)
print("\n")

printNumbers(1, 2, 3,4 ,6, 0, 9)
print("\n")

printNumbers(1, 2, 3,4 ,6, 0, 9, 1, 2, 0)

//: [Next](@next)
