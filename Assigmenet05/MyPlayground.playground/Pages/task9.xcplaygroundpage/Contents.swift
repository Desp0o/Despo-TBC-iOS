//: [Previous](@previous)

//9. დაწერეთ ფუნქცია `applyOperation`, რომელსაც აქვს სამი პარამეტრი: ორი Int ტიპის რიცხვი და ერთი closure, რომელიც იღებს ორ Int-ს და აბრუნებს Int-ს. ფუნქციამ უნდა გამოიყენოს ეს closure ორ რიცხვზე და დააბრუნოს შედეგი. გამოიძახეთ ეს ფუნქცია სხვადასხვა არითმეტიკული ოპერაციებისთვის (მიმატება, გამოკლება, გამრავლება) და დაბეჭდეთ შედეგები.

import Foundation

let sumClosure: (Int, Int) -> Int = { num1, num2 in
    num1 + num2
}

let multipleClosure: (Int, Int) -> Int = { num1, num2 in
    num1 * num2
}

let substractClosure: (Int, Int) -> Int = {num1, num2 in
    num1 - num2
}

func applyOperation(num1: Int, num2: Int, closure: (Int, Int) -> Int) -> Int {
    closure(num1, num2)
}

print(applyOperation(num1: 2, num2: 2, closure: sumClosure))
print(applyOperation(num1: 2, num2: 3, closure: multipleClosure))
print(applyOperation(num1: 10, num2: 15, closure: substractClosure))


//: [Next](@next)
